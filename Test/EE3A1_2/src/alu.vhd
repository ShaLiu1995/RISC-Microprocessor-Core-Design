library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all; 

entity alu is
	port(	a, b: 	in std_logic_vector(31 downto 0);
			opcode: in std_logic_vector(5 downto 0);
			clk: 	in std_logic;
			c: 		out std_logic_vector(31 downto 0) );
end entity alu;

architecture simple of alu is
begin 
	process(a,b) 
	begin			
			if(opcode=X"01")	then
				c <= a + b;
			elsif(opcode=X"02") then 
				c <= a - b;
			elsif(opcode=X"0F") then	
				c <= abs(a);
			elsif(opcode=X"04") then
				c <= -a;
			elsif(opcode=X"03") then
				c <= abs(b);
			elsif(opcode=X"0D") then
				c <= -b; 	
			elsif(opcode=X"05") then
				c <= a or b; 	
			elsif(opcode=X"0A") then
				c <= not a;  	
			elsif(opcode=X"0C") then
				c <= not b;  	
			elsif(opcode=X"06") then
				c <= a and b; 	
			elsif(opcode=X"09") then
				c <= a xor b; 
			end if; 	
	end process;
end architecture simple;