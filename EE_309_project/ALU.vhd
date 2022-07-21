Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity alu is
    port (
		clk: in std_logic;
        OP:    in std_logic_vector(1 downto 0);
        ALU_A,ALU_B:    in std_logic_vector(15 downto 0);
        ALU_OUT: out std_logic_vector(15 downto 0);   
		C, Z: out std_logic
    );
end entity;


architecture alu_logic of alu is 
begin	
	process(ALU_A,ALU_B,OP)
    variable temp:  unsigned(15 downto 0);
	variable temp_a,temp_b,temp_add:  unsigned(16 downto 0);
    begin
		if OP="00" then
			temp:=(unsigned(ALU_A) NAND unsigned(ALU_B));
			if temp="0000000000000000" then
				Z<='1';
			else
				Z<='0';
			end if;
		elsif OP="10" then
			temp:=(unsigned(ALU_A) - unsigned(ALU_B));
			if temp="0000000000000000" then
				Z<='1';
			else
				Z<='0';
			end if;
		elsif OP="01" then
			temp_a(15 downto 0) := (unsigned(ALU_A));
			temp_b(15 downto 0) := (unsigned(ALU_B));
			temp_a(16) := '0';
			temp_b(16) := '0';
			temp_add :=  temp_a + temp_b;
			temp:= (temp_add(15 downto 0));
			C <= temp_add(16);
			if temp_add = "0000000000000000" then
				Z <= '1';
			else
				Z <= '0';
			end if;
		end if;
		ALU_OUT<=std_logic_vector(temp);
	end process;		
end architecture;