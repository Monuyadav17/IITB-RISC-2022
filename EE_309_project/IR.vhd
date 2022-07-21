library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity IR is
port (	
	clk, rst, IW: in std_logic;
	ip: in std_logic_vector (15 downto 0);
	op: out std_logic_vector (15 downto 0)
	);
end entity;

architecture IR_logic of IR is

signal reg: std_logic_vector(15 downto 0);

begin
	process(ip, clk) is
	begin
		if(rst='1') then
			reg<=(others=>'0');
		elsif(IW='1') then
			reg<=ip;
		end if;
		op<=reg;
	end process;
end architecture;