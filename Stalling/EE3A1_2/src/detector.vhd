 library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity detector is
	port(	
			address1		: in std_logic_vector (4 DOWNTO 0);		
	 		address2		: in std_logic_vector (4 DOWNTO 0);
		   	address3_of		: in std_logic_vector(4 downto 0);	
			address3_ex		: in std_logic_vector(4 downto 0);
			enable			: out std_logic;
			reset2			: out std_logic;
			clk				: in std_logic);  
			
end entity detector;

architecture simple of detector is 
SIGNAL count: integer :=0;	
SIGNAL flag: integer :=0; 
SIGNAL mode: integer :=0;
begin	 
	
	PROCESS(address3_ex)
	BEGIN
		
		if ( flag <4 ) then
			enable <= '1';
			
		elsif( address1 = address3_ex or address2 = address3_ex or address1 = address3_of or address2 = address3_of  ) then
					  
					enable <= '0';
					
					--flag <= 0;
				else
					enable <= '1';
					
					--flag <= 1;
				
				end if;
		
	END PROCESS;   
	
	
	PROCESS(clk)
	BEGIN 
		if( rising_edge(clk)) then 
			flag <= flag + 1;
			if( mode = 0 ) then
				if( address1 = address3_ex or address2 = address3_ex) then
					  
					mode <= 1;
					
					count <= 1;	 
					reset2 <= '1';
				elsif( address1 = address3_of or address2 = address3_of) then
					
					mode <= 2; 
					
					count <= 1;	
					reset2 <= '1';
				end if;
			else
				if( mode = 1 and count = 1) then
					
					
					count <= 0;	
					mode <= 0;	 
					reset2 <= '0';
				elsif( mode = 2 and count = 1) then
					
					count <= 2;	 
					reset2 <= '1';
				elsif( mode = 2 and count = 2) then
					
					
					count <= 0;	
					mode <= 0;
					reset2 <= '0';
				end if;
			end if;
			
		end if;
		
	END PROCESS;   
	
	
end architecture simple;