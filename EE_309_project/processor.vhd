library ieee;
use ieee.std_logic_1164.all;

entity processor is
port( clk, rst : in std_logic);
end entity;


architecture arch of processor is 

	
	
	
	component SE6TO16 is
		port(
			ip: in std_logic_vector(5 downto 0);
			op: out std_logic_vector(15 downto 0));
	end component;

	component SE16 is
		
		port(
			ip: in std_logic_vector(8 downto 0);
			op: out std_logic_vector(15 downto 0));
	end component;

	component Shift1 is
		port(
			ip: in std_logic_vector(15 downto 0);
			op: out std_logic_vector(15 downto 0));
	end component;
	component Mem is
		port (	
	rst, clk, MW, MR: in std_logic;
	addr, WD : in std_logic_vector (15 downto 0);
	RD: out std_logic_vector (15 downto 0)
	);
	end component;
	
	component IR is
		port (	
			clk, rst, IW: in std_logic;
			ip: in std_logic_vector (15 downto 0);
			op: out std_logic_vector (15 downto 0)
			);
	end component;
	
	component bit16_clk is
		port (	
			clk: in std_logic;
			inp: in std_logic_vector (15 downto 0);
			outp: out std_logic_vector (15 downto 0)
			);
	end component;

	component bit8_clk is
		port (	
			clk: in std_logic;
			inp: in std_logic_vector (7 downto 0);
			outp: out std_logic_vector (7 downto 0)
			);
	end component;

	component bit3_clk is
		port (	
			clk: in std_logic;
			inp: in std_logic_vector (2 downto 0);
			outp: out std_logic_vector (2 downto 0)
			);
	end component;

	component RF is
		port (	
	clk, rst, RW: in std_logic;
	RF_A1, RF_A2, RF_A3: in std_logic_vector (2 downto 0);
	RF_WD : in std_logic_vector (15 downto 0);
	RF_D1, RF_D2: out std_logic_vector (15 downto 0)
	);
	end component;

	component alu is
		 port (
		clk: in std_logic;
        OP:    in std_logic_vector(1 downto 0);
        ALU_A,ALU_B:    in std_logic_vector(15 downto 0);
        ALU_OUT: out std_logic_vector(15 downto 0);   
		C, Z: out std_logic
    );
	end component;

	component control is
		port (	
			clk, rst, z_in, c_in, z2: in std_logic;
			cond: in std_logic_vector(1 downto 0);
			op_code: in std_logic_vector(3 downto 0);
			MemR, MemW, IRW,PC,PCW,CW,ResB,T1,T2,PEN,addr_m: out std_logic;
			mem_addr,ALU_A,ALU_B,ALU_out,ResA,D3mux: out std_logic_vector(1 downto 0)
			);
	end component;

	component Shift7 is
		port(
			ip: in std_logic_vector(8 downto 0);
			op: out std_logic_vector(15 downto 0));
	end component;

	component priority_encoder is
		port (
	pen_in : in std_logic_vector(7 downto 0);
	pen_out1 : out std_logic_vector(2 downto 0);
	pen_out2 : out std_logic_vector(7 downto 0);
	H: out std_logic
  ) ;
	end component ;

	

	component MUX_4_16BIT is
		generic(input_width: integer := 16);
	port(
			A, B, C, D: in std_logic_vector(input_width-1 downto 0) := (others => '0');
			S1,S0: in std_logic;
			Z: out std_logic_vector(input_width-1 downto 0));
	end component;

	component MUX_4_3BIT is
		generic(input_width: integer := 3);
	port(
			A, B, C, D: in std_logic_vector(input_width-1 downto 0) := (others => '0');
			S1,S0: in std_logic;
			Z: out std_logic_vector(input_width-1 downto 0));
	end component;
	
	component MUX2_16BIT is
		generic(input_width: integer := 16);
	port(
			A, B: in std_logic_vector(input_width-1 downto 0) := (others => '0');
			S: in std_logic;
			Z: out std_logic_vector(input_width-1 downto 0));
	end component;

	component MUX2_8BIT is
		generic(input_width: integer := 8);
	port(
			A, B: in std_logic_vector(input_width-1 downto 0) := (others => '0');
			S: in std_logic;
			Z: out std_logic_vector(input_width-1 downto 0));
	end component;

	component MUX2_3BIT is
		generic(input_width: integer := 3);
	port(
			A, B: in std_logic_vector(input_width-1 downto 0) := (others => '0');
			S: in std_logic;
			Z: out std_logic_vector(input_width-1 downto 0));
	end component;
---------------------------------------------------------------------------------------------------
   
	
begin

	


	
end architecture;

