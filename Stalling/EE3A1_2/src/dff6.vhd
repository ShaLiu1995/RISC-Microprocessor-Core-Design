library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity dff6 is
	port(	d		: in std_logic_vector(5 downto 0);
			clk		: in std_logic;
		   	q		: out std_logic_vector(5 downto 0); 
			reset1	: out std_logic);
end entity dff6;

architecture simple of dff6 is
begin
	process(clk)
	begin	 
		
	
		if( rising_edge(clk) ) then	
			
			q <= d;	
			if( d = X"00" or d = X"07" or d = X"08" or d = X"0B" or d = X"0E" or d > X"0F") then
				reset1 <= '1';	
			else
				reset1 <= '0';
			end if;		   
			
		end if;	  
		
		
	end process;
end architecture simple;
