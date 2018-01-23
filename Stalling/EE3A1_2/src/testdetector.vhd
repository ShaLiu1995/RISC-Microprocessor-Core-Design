LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;

ENTITY testdetector IS
END ENTITY testdetector;

ARCHITECTURE simple OF testdetector IS
	SIGNAL instruction								: std_logic_vector (31 DOWNTO 0);
   	SIGNAL clk										: std_logic;
	SIGNAL address1, address2						: std_logic_vector (4 DOWNTO 0);
	SIGNAL address3_of, address3_ex					: std_logic_vector (4 DOWNTO 0);
	SIGNAL reset2									: std_logic;
	SIGNAL enable									: std_logic;  
	   
BEGIN   
		
	g1: ENTITY work.detector(simple)
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
		
		
		
		
		wait for 20 ns;
		address1 <= B"00011";
		address2 <= B"00001";
		address3_of <= B"00010";
		address3_ex	<= B"00011";
		
		WAIT;  
		
	END PROCESS;
	
	
			
END ARCHITECTURE simple;   
