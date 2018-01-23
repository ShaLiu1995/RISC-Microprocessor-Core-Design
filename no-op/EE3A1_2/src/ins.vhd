library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity ins is
	port(	instruction		: in std_logic_vector (31 DOWNTO 0);
			opcode_if		: out std_logic_vector (5 DOWNTO 0);
			address1		: out std_logic_vector (4 DOWNTO 0);		
	 		address2		: out std_logic_vector (4 DOWNTO 0);
		   	address3_if		: out std_logic_vector(4 downto 0);	
			clk				: in std_logic);
end entity ins;

architecture simple of ins is
begin
	PROCESS(clk)
	BEGIN
			if( rising_edge(clk) ) then
				opcode_if <= instruction(31 downto 26);
				address1 <= instruction(25 downto 21);
				address2 <= instruction(20 downto 16);
				address3_if <= instruction(15 downto 11);	
			end if;	
	END PROCESS;
end architecture simple;