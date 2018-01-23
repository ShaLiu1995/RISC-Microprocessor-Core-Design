library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity dff5_reset is
	port(	d		: in std_logic_vector(4 downto 0);
			clk		: in std_logic;		
			reset	: in std_logic_vector(5 downto 0);
		   	q		: out std_logic_vector(4 downto 0));
end entity dff5_reset;

architecture simple of dff5_reset is
begin
	process(clk)
	begin	  
		if( rising_edge(clk) ) then
			if(reset = X"00" or reset = X"07" or reset = X"08" or reset = X"0B" or reset = X"0E" or reset > X"0F") then
				q <= B"00000";
			else
				q <= d;
			end if;
		end if;
	end process;
end architecture simple;
