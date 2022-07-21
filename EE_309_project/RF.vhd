library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity RF is
port (	
	clk, rst, RW: in std_logic;
	RF_A1, RF_A2, RF_A3: in std_logic_vector (2 downto 0);
	RF_WD : in std_logic_vector (15 downto 0);
	RF_D1, RF_D2: out std_logic_vector (15 downto 0)
	);
end entity;

architecture RF_logic of RF is

type registerFile is array(0 to 7) of std_logic_vector(15 downto 0);
signal reg : registerFile;

begin
	process(clk,rst) is
		begin
			if(rst='1') then
				reg(0)<="0000000000000001";
				reg(1)<="0000000000000010";
				reg(2)<="0000000000000011";
				reg(3)<="0000000000000100";
				reg(4)<="0000000000000101";
				reg(5)<="0000000000000110";
				reg(6)<="0000000000000111";
				reg(7)<="0000000000000000";

			else
				
				RF_D1<=reg(to_integer(unsigned(RF_A1)));
				RF_D2<=reg(to_integer(unsigned(RF_A2)));
				if(RW='1') then
					reg(to_integer(unsigned(Rf_A3)))<=RF_WD;
				end if;
				
			end if;

	end process;

end architecture;