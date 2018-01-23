library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity dff32 is
	port(	d		: in std_logic_vector(31 downto 0);
			clk		: in std_logic;
		   	q		: out std_logic_vector(31 downto 0));
end entity dff32;

architecture simple of dff32 is
begin
	process(clk)
	begin
		if( rising_edge(clk) ) then
			q <= d;
		end if;
	end process;
end architecture simple;
