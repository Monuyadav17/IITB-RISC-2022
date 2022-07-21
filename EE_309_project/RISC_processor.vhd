library ieee;
use ieee.std_logic_1164.all;

entity RISC_processor is
port( clk, rst : in std_logic);
end entity;


architecture arch of RISC_processor is


COMPONENT RES_C is
port (	
	clk: in std_logic;
	ip: in std_logic_vector (15 downto 0);
	op: out std_logic_vector (15 downto 0)
	);
end COMPONENT;

 
   COMPONENT SE9 is
   port(ip: in std_logic_vector(5 downto 0);
	op: out std_logic_vector(8 downto 0));
end COMPONENT;
  COMPONENT MUX2_9BIT is
	generic(input_width: integer := 9);
	port(
			A, B: in std_logic_vector(input_width-1 downto 0) := (others => '0');
			S: in std_logic;
			Z: out std_logic_vector(input_width-1 downto 0));
end COMPONENT;

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
	addr, DW : in std_logic_vector (15 downto 0);
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
	
	component clk_Reg_16bit is
		port (	
			clk: in std_logic;
			inp: in std_logic_vector (15 downto 0);
			outp: out std_logic_vector (15 downto 0)
			);
	end component;

	component clk_Reg_8bit is
		port (	
			clk: in std_logic;
			inp: in std_logic_vector (7 downto 0);
			outp: out std_logic_vector (7 downto 0)
			);
	end component;

	component clk_Reg_3bit_logic is
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
	clk, rst: in std_logic;
    cond: in std_logic_vector(1 downto 0);
    op_code: in std_logic_vector(3 downto 0);
	S_1,S_2,S_3,S_4,S_5,S_6,S_7,P1,P0,S_9,M1,M0,S_11,S_12,S_13,S_14,S_15,S_16,S_17,MR,MW,IW,DW,RW,AW,BW,CW,PCW: out std_logic -----ACC TO EXCEL SHEET GIVEN
	);
	end component;

	component Shift7 is
		port(
			ip: in std_logic_vector(15 downto 0);
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
 signal SIG_ALU_OUT,W_0,W_1,S7_OUT,DR_OUT,M16,M13,M14,M12,M11,M10,M161,M17,C_OUT,S1_OUT,W_2 :std_logic_vector(15 downto 0);
 signal M9,W_3,W_4,W_5,W_6,W_7,W_8,W_9,W_10,W_11,W_12,W_13,SIG_RD,M8 ,SIG_DW,SIG_RF_WD,RF_OUT1,RF_OUT2,A_OUT,B_OUT,SE16_OUT :std_logic_vector(15 downto 0);
 signal SIG_IW,SIG_MR,SIG_MW ,SIG_S_1,SIG_S_2,SIG_S_3,SIG_S_4,SIG_S_5,SIG_S_6,SIG_S_7,SIG_P0,SIG_p1,SIG_RW,SIG_CWS ,SIG_BW1S,SIG_RWS,SIG_AWS,SIG_BWS,SIG_C1WS,SIG_PCW1:std_logic;
 signal SIG_C,SIG_Z,SIG_H,SIG_S_9,SIG_PCW,SIG_M0,SIG_M1,SIG_S_11,SIG_S_12,SIG_S_13,SIG_S_14,SIG_S_15,SIG_DWS,SIG_S_16,SIG_RWS1,SIG_AWS1,SIG_S_17 :std_logic;
 signal SIG_PEN_O,M3,M4,M5: std_logic_vector(2 downto 0);
 signal sig_op4:std_logic_vector(3 downto 0);
 signal SIG_OP,con: std_logic_vector(1 downto 0);
 signal SE9_OUT,M6: std_logic_vector(8 downto 0);
 signal PEN_OUT_1,M7,TO_OUT: std_logic_vector(7 downto 0);
 
 begin

 ctrl11:control port map (clk,rst,CON,SIG_OP4,SIG_S_1,SIG_S_2,SIG_S_3,SIG_S_4,SIG_S_5,SIG_S_6,SIG_S_7,SIG_P1,SIG_P0,SIG_S_9,SIG_M1,
                     SIG_M0,SIG_S_12,SIG_S_13,SIG_S_14,SIG_S_15, SIG_S_16,SIG_S_17,SIG_MR,SIG_MW,SIG_IW,SIG_DWS,SIG_RWS1,SIG_AWS1,SIG_BW1S,SIG_C1WS,SIG_PCW1);
 

MUX_1:MUX2_16BIT PORT MAP(W_0 ,A_OUT , SIG_S_1 ,W_2);

PC:clk_Reg_16bit PORT MAP(clk,W_2,W_3);


MUX_2:MUX2_16BIT PORT MAP(M11,W_3 , SIG_S_2 , W_5);

	
MEMORY:Mem PORT MAP(rst,clk,SIG_MW,SIG_MR,W_5,SIG_DW,SIG_RD);

INSTRUCREG : IR PORT MAP(clk,rst,SIG_IW,SIG_RD,W_6);
MUX_3:MUX2_3BIT PORT MAP (W_6(8 DOWNTO 6),SIG_PEN_O,SIG_S_3,M3);
MUX_4:MUX2_3BIT PORT MAP (W_6(5 DOWNTO 3),W_6(11 DOWNTO 9),SIG_S_4,M4);
MUX_5:MUX2_3BIT PORT MAP (W_6(11 DOWNTO 9),SIG_PEN_O,SIG_S_5,M5);
SE_9: SE9 PORT MAP(W_6(5 DOWNTO 0),SE9_OUT);

MUX_6:MUX2_9BIT PORT MAP (SE9_OUT,W_6(8 DOWNTO 0),SIG_S_6,M6 );
MUX_7:MUX2_8BIT PORT MAP(W_6(7 DOWNTO 0),PEN_OUT_1,SIG_S_7,M7 );
T0:clk_Reg_8bit PORT MAP(clk,M7,TO_OUT);
RESISFILE:RF PORT MAP(clk,rst,SIG_RW,M3,M4,M5,SIG_RF_WD,RF_OUT1,RF_OUT2);
PRIOTYINCODER: priority_encoder PORT MAP(TO_OUT,SIG_PEN_O,PEN_OUT_1,SIG_H);

REG_A:clk_Reg_16bit PORT MAP(clk,RF_OUT1,A_OUT);
REG_B:clk_Reg_16bit PORT MAP(clk,RF_OUT2,B_OUT);
SE_16: SE16 PORT MAP(M6,SE16_OUT);
MUX_8: MUX_4_16BIT PORT MAP(A_OUT, M16,"0000000000000001" , W_3 ,SIG_P1,SIG_P0,M8);
S1:Shift1 PORT MAP(B_OUT,S1_OUT);
MUX_10: MUX_4_16BIT PORT MAP(B_OUT,S1_OUT ,SE16_OUT, "0000000000000001",SIG_P1,SIG_P0,M10);
MUX_9: MUX2_16BIT PORT MAP(M8,SE16_OUT,SIG_S_9,M9);

ALU1: ALU PORT MAP(clk,SIG_OP,M9,M10,SIG_ALU_OUT,SIG_C,SIG_Z);

RESIS_C: RES_C PORT MAP(clk,SIG_ALU_OUT,C_OUT);

MUX_11:MUX2_16BIT PORT MAP(C_OUT ,B_OUT , SIG_S_11 ,M11);
MUX_12:MUX2_16BIT PORT MAP(B_OUT ,A_OUT , SIG_S_12 ,SIG_DW);

MUX_16:MUX2_16BIT PORT MAP(SIG_ALU_OUT ,B_OUT , SIG_S_16 ,M161);
	
MUX_17:MUX2_16BIT PORT MAP(SIG_ALU_OUT,C_OUT , SIG_S_17 ,W_0);

DR:clk_Reg_16bit PORT MAP(clk,SIG_RD,DR_OUT);

MUX_13:MUX2_16BIT PORT MAP(C_OUT ,DR_OUT , SIG_S_13 ,M13);

MUX_14:MUX2_16BIT PORT MAP(C_OUT ,M13 , SIG_S_14 ,M14);
SHIFTEROF7BIT:Shift7 PORT MAP(SE16_OUT,S7_OUT);

MUX_15:MUX2_16BIT PORT MAP(M14 ,S7_OUT , SIG_S_15 ,SIG_RF_WD);
end architecture;

