library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SE9 is
   port(ip: in std_logic_vector(5 downto 0);
	op: out std_logic_vector(8 downto 0));
end entity;

architecture Stru of SE9 is

begin
	op(5 downto 0) <= ip(5 downto 0);
	op(6) <= ip(5);
	op(7) <= ip(5);
	op(8) <= ip(5);
	
end Stru;