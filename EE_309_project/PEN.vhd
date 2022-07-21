library std;
library ieee;
use ieee.std_logic_1164.all;
--library work;
--use work.components_init.all;

entity priority_encoder is
  port (
	pen_in : in std_logic_vector(7 downto 0);
	pen_out1 : out std_logic_vector(2 downto 0);
	pen_out2 : out std_logic_vector(7 downto 0);
	H: out std_logic
  ) ;
end entity ; -- priority_encoder

architecture PEN of priority_encoder is 

begin

process(pen_in)
variable pen_out_var : std_logic_vector(2 downto 0);
variable po : std_logic_vector(7 downto 0);
variable H_var : std_logic;
begin
	H_var:='0';
	if pen_in(0) = '1' then 
		pen_out_var := "000";
		po(7 downto 1):=pen_in(7 downto 1);
		po(0):='0';
	elsif pen_in(1) = '1' then
		pen_out_var := "001";
		po(7 downto 2):=pen_in(7 downto 2);
		po(1 downto 0):="00";
	elsif pen_in(2) = '1' then
		pen_out_var := "010";
		po(7 downto 3):=pen_in(7 downto 3);
		po(2 downto 0):="000";
	elsif pen_in(3) = '1' then
		pen_out_var := "011";
		po(7 downto 4):=pen_in(7 downto 4);
		po(3 downto 0):="0000";
	elsif pen_in(4) = '1' then
		pen_out_var := "100";
		po(7 downto 5):=pen_in(7 downto 5);
		po(4 downto 0):="00000";
	elsif pen_in(5) = '1' then
		pen_out_var := "101";
		po(7 downto 6):=pen_in(7 downto 6);
		po(5 downto 0):="000000";
	elsif pen_in(6) = '1' then
		pen_out_var := "110";
		po(7):=pen_in(7);
		po(6 downto 0):="0000000";
	elsif pen_in(7) = '1' then
		pen_out_var := "111";
		po:="00000000";
	end if;
	if po = "00000000" then
		H_var:='0';
	end if;
	pen_out1 <= pen_out_var;
	pen_out2 <= po;
	H<=H_var;
end process;
end architecture ; -- PEN

























