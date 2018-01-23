library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity dff5_reset is
	port(	d		: in std_logic_vector(4 downto 0);
			clk		: in std_logic;		
			reset1	: in std_logic;	
			reset2	: in std_logic;
		   	q		: out std_logic_vector(4 downto 0));
end entity dff5_reset;

architecture simple of dff5_reset is
begin
	process(clk)
	begin	  
		if( rising_edge(clk) ) then
			if(reset1 = '1' or reset2 = '1') then
				q <= B"00000";	
			else
				q <= d;
			end if;
		end if;
	end process;
end architecture simple;
