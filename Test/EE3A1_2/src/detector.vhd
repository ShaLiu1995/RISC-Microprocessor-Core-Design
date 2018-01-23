library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity ins is
	port(	
			address1		: in std_logic_vector (4 DOWNTO 0);		
	 		address2		: in std_logic_vector (4 DOWNTO 0);
		   	address3_of		: in std_logic_vector(4 downto 0);	
			address3_ex		: in std_logic_vector(4 downto 0);
			enable_in		: in std_logic;
			enable_out		: out std_logic;
			clk				: in std_logic);
end entity ins;

architecture simple of ins is 
SIGNAL count: integer :=0;	
SIGNAL flag: integer :=0;
begin	 
	PROCESS(clk)
	BEGIN  
		if( enable_in = '1' ) then
			if( address1 = address3_ex or address2 = address3_ex) then
				enable_out <= '0';	  
				flag <= 1;
			elsif( address1 = address3_of or address2 = address3_of) then
				enable_out <= '0';	  
				flag <= 2;
			end if;
		else
			
			if( flag = 1 and count = 1) then
				enable_out <= '1';
				count <= 0;	 
			elsif( flag = 2 and count = 2) then
				enable_out <= '1';
				count <= 0;	 
			end if;
		end if;
		
		
	END PROCESS;
end architecture simple;