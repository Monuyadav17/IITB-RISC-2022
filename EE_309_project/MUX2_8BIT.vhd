
	
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX2_8BIT is
	generic(input_width: integer := 8);
	port(
			A, B: in std_logic_vector(input_width-1 downto 0) := (others => '0');
			S: in std_logic;
			Z: out std_logic_vector(input_width-1 downto 0));
end entity;

architecture behave of MUX2_8BIT is
begin
	Z <= A when (S = '0') else
		B;
end;