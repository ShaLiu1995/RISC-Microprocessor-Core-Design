LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;

ENTITY testbench IS
END ENTITY testbench;

ARCHITECTURE simple OF testbench IS
	SIGNAL instruction								: std_logic_vector (31 DOWNTO 0);
   	SIGNAL clk										: std_logic;
	SIGNAL address1, address2						: std_logic_vector (4 DOWNTO 0);
	SIGNAL address3_if, address3_of, address3_ex	: std_logic_vector (4 DOWNTO 0);
	SIGNAL opcode_if, opcode_of						: std_logic_vector(5 DOWNTO 0);
	SIGNAL operand1, operand2						: std_logic_vector(31 DOWNTO 0);
	SIGNAL result_ex								: std_logic_vector(31 DOWNTO 0); 
	SIGNAL result_wb								: std_logic_vector(31 DOWNTO 0);
	SIGNAL reset1									: std_logic;   
	SIGNAL reset2									: std_logic;
	SIGNAL enable									: std_logic :='1';  
	   
BEGIN
	g1: ENTITY work.ram(simple)
		PORT MAP( address1=>address1, address2=>address2, address3=>address3_ex, input=>result_wb, clk=>clk, output1=>operand1, output2=>operand2);
		
	g2: ENTITY work.alu(simple)
		PORT MAP( clk=>clk, a=>operand1, b=>operand2, opcode=>opcode_of, c=>result_ex);	  
		
	g3: ENTITY work.dff6(simple)
		PORT MAP( clk=>clk, d=>opcode_if, q=>opcode_of, reset1=>reset1); 
		
	g4: ENTITY work.dff5(simple)
		PORT MAP( clk=>clk, d=>address3_if, q=>address3_of);	
		
	g5: ENTITY work.dff5_reset(simple)
		PORT MAP( clk=>clk, d=>address3_of, reset1=>reset1, reset2=>reset2, q=>address3_ex);
	
	g6: ENTITY work.dff32(simple)
		PORT MAP( clk=>clk, d=>result_ex, q=>result_wb);	
		
	g7: ENTITY work.ins(simple)
		PORT MAP( clk=>clk, instruction=>instruction, address1=>address1, address2=>address2, address3_if=>address3_if, opcode_if=>opcode_if, enable=>enable);	   
		
	g8: ENTITY work.detector(simple)
		PORT MAP( clk=>clk, address1=>address1,	address2=>address2, address3_of=>address3_of, address3_ex=>address3_ex, enable=>enable, reset2=>reset2);
	
	PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR 10NS;
		clk <= '1';
		WAIT FOR 10NS;
	END PROCESS;
	
	PROCESS
	BEGIN 
		-- initialise
		-- r4 = r2 + r3 
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000001_00010_00011_00100_00000000000";
		
		-- no hazard
		-- r7 = r5 + r6 
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000001_00101_00110_00111_00000000000";
		-- r10 = r8 + r9 
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000001_01000_01001_01010_00000000000";	 
		
		-- add1	= add3_of
		-- r15 = r13 + r14
		WAIT UNTIL rising_edge(clk) and enable='1';	  
		instruction <= B"000001_01101_01110_01111_00000000000";	
		-- r17= r15 + r16
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000010_01111_10000_10001_00000000000";	
		
		-- add1 = add3_ex
		-- r7 = r5 + r6 
		WAIT UNTIL rising_edge(clk) and enable='1';	  
		instruction <= B"000001_00101_00110_00111_00000000000";	 
		-- r10 = r8 + r9 
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000001_01000_01001_01010_00000000000";	
		-- r12 = r7 + r11 
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000001_00111_01011_01100_00000000000";	 
		
		-- add2 = add3_of
		-- r15 = r13 + r14
		WAIT UNTIL rising_edge(clk) and enable='1';	  
		instruction <= B"000001_01101_01110_01111_00000000000";	
		-- r17 = r16 + r15
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000010_10000_01111_10001_00000000000";		
		
		-- add2 = add3_ex
		-- r7 = r5 + r6 
		WAIT UNTIL rising_edge(clk) and enable='1';	  
		instruction <= B"000001_00101_00110_00111_00000000000";	 
		-- r10 = r8 + r9 
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000001_01000_01001_01010_00000000000";	
		-- r12 = r11 + r7
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"000001_01011_00111_01100_00000000000";	 
		
		--stop
		WAIT UNTIL rising_edge(clk) and enable='1';
		instruction <= B"111111_11111_00001_00000_00000000000";
		
		WAIT;  
		
	END PROCESS;
	
	
			
END ARCHITECTURE simple;   
