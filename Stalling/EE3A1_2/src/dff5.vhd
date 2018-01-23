library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity dff5 is
	port(	d		: in std_logic_vector(4 downto 0);
			clk		: in std_logic;
		   	q		: out std_logic_vector(4 downto 0));
end entity dff5;

architecture simple of dff5 is
begin
	process(clk)
	begin
		if( rising_edge(clk) ) then
			q <= d;
		end if;
	end process;
end architecture simple;
