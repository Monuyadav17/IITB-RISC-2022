library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SE6TO16 is
   port(ip: in std_logic_vector(5 downto 0);
	op: out std_logic_vector(15 downto 0));
end entity;

architecture Stru1 of SE6TO16 is

begin
	op(5 downto 0) <= ip(5 downto 0);
	op(6) <= ip(5);
	op(7) <= ip(5);
	op(8) <= ip(5);
	op(9) <= ip(5);
	op(10) <= ip(5);
	op(11) <= ip(5);
	op(12) <= ip(5);
	op(13) <= ip(5);
	op(14) <= ip(5);
	op(15) <= ip(5);
	
end Stru1;