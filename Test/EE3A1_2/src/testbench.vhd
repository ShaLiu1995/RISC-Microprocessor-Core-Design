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
	   
BEGIN
	g1: ENTITY work.ram(simple)
		PORT MAP( address1=>address1, address2=>address2, address3=>address3_ex, input=>result_wb, clk=>clk, output1=>operand1, output2=>operand2);
		
	g2: ENTITY work.alu(simple)
		PORT MAP( clk=>clk, a=>operand1, b=>operand2, opcode=>opcode_of, c=>result_ex);	  
		
	g3: ENTITY work.dff6(simple)
		PORT MAP( clk=>clk, d=>opcode_if, q=>opcode_of); 
		
	g4: ENTITY work.dff5(simple)
		PORT MAP( clk=>clk, d=>address3_if, q=>address3_of);	
		
	g5: ENTITY work.dff5_reset(simple)
		PORT MAP( clk=>clk, d=>address3_of, reset=>opcode_of, q=>address3_ex);
	
	g6: ENTITY work.dff32(simple)
		PORT MAP( clk=>clk, d=>result_ex, q=>result_wb);	
		
	g7: ENTITY work.ins(simple)
		PORT MAP( clk=>clk, instruction=>instruction, address1=>address1, address2=>address2, address3_if=>address3_if, opcode_if=>opcode_if);
	
	PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR 10NS;
		clk <= '1';
		WAIT FOR 10NS;
	END PROCESS;
	
	PROCESS
	BEGIN 
		instruction <= B"000000_00000_00000_00000_00000000000";
		--1
		instruction <= B"000001_00010_00011_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00101_00110_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--2
		instruction <= B"000001_11111_00100_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_00111_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--3
		instruction <= B"000001_11111_01000_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_01011_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--4
		instruction <= B"000001_11111_01001_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_01100_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--5
		instruction <= B"000001_11111_01010_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_01101_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--6
		instruction <= B"000001_11111_01110_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_10001_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--7
		instruction <= B"000001_11111_01111_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_10010_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--8
		instruction <= B"000001_11111_10000_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_10011_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--9
		instruction <= B"000001_11111_10100_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_10111_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--10
		instruction <= B"000001_11111_10101_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_11000_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--11
		instruction <= B"000001_11111_10110_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_11001_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--12
		instruction <= B"000001_11111_11010_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_11101_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--13
		instruction <= B"000001_11111_11011_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"000001_00001_11110_00001_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--14
		instruction <= B"000001_11111_11100_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		--15
		instruction <= B"000010_11111_00001_11111_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;
		instruction <= B"111111_00000_00000_00000_00000000000";
		WAIT FOR 20NS;

		WAIT;  
		
	END PROCESS;
	
	
			
END ARCHITECTURE simple;   
