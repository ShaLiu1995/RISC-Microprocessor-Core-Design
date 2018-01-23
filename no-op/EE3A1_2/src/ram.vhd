LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
 
ENTITY ram IS
	PORT ( 	address1: 	IN   STD_LOGIC_VECTOR(4 DOWNTO 0);
			address2: 	IN   STD_LOGIC_VECTOR(4 DOWNTO 0);   
			address3: 	IN   STD_LOGIC_VECTOR(4 DOWNTO 0);
			input: 		IN   STD_LOGIC_VECTOR(31 DOWNTO 0);
			clk: 		IN 	 STD_LOGIC;
	       	output1 : 	OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
			output2 : 	OUT  STD_LOGIC_VECTOR(31 DOWNTO 0) );
END ENTITY ram;

ARCHITECTURE simple OF ram IS
  TYPE ram_array IS ARRAY ( 0 TO 31 ) OF STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
  SIGNAL ram_data: ram_array := 
  		(X"00000000",X"00000000",X"000105E1",X"00000176",
  		X"00005E83",X"0000E5A8",X"00004721",X"0000CD57",
  		X"0000C034",X"00001A00",X"0000FDE1",X"0000D34C",
  		X"0001361E",X"00008D0D",X"000106D9",X"000005A0",
  		X"0000F072",X"0000024F",X"00014827",X"00015B30",
  		X"00017E94",X"00016922",X"000117CA",X"00011E11",
  		X"00015498",X"00010C97",X"000141FA",X"00018580",
  		X"00008BE0",X"0001752D",X"0000FEAE",X"00000000");                         
BEGIN	
	process(clk)
	begin
		if( rising_edge(clk) ) then	
			output1 <= ram_data( CONV_INTEGER (address1) );	
			output2 <= ram_data( CONV_INTEGER (address2) );	 
			if( address3 = B"00000" ) then
				ram_data( CONV_INTEGER (address3) ) <= X"00000000"; 
			else
				ram_data( CONV_INTEGER (address3) ) <= input;
			end if;
		end if;
	end process;
END ARCHITECTURE simple;   
