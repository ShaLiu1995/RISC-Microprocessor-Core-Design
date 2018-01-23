library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity dff6 is
	port(	d		: in std_logic_vector(5 downto 0);
			clk		: in std_logic;
		   	q		: out std_logic_vector(5 downto 0));
end entity dff6;

architecture simple of dff6 is
begin
	process(clk)
	begin
		if( rising_edge(clk) ) then
			q <= d;
		end if;
	end process;
end architecture simple;
