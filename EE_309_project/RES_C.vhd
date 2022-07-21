library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity RES_C is
port (	
	clk: in std_logic;
	ip: in std_logic_vector (15 downto 0);
	op: out std_logic_vector (15 downto 0)
	);
end entity;

architecture ALUout_logic of RES_C is

signal reg: std_logic_vector(15 downto 0);

begin
	process(ip, clk) is
	begin
		if(rising_edge(clk)) then
			reg<=ip;
			op<=reg;
		end if;
	end process;
end architecture;