library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity control is
port (	
	clk, rst: in std_logic;
    cond: in std_logic_vector(1 downto 0);
    op_code: in std_logic_vector(3 downto 0);
	S_1,S_2,S_3,S_4,S_5,S_6,S_7,P1,P0,S_9,M1,M0,S_11,S_12,S_13,S_14,S_15,S_16,S_17,MR,MW,IW,DW,RW,AW,BW,CW,PCW: out std_logic -----ACC TO EXCEL SHEET GIVEN
	);
end entity;

architecture control_logic of control is

type FsmState is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19);
signal Q: FsmState;
signal z,c: std_logic;
begin


	state_machine:process(clk)
	variable NQ: FsmState;

	begin
		if rising_edge(clk) then
			if rst ='1' then
				Q<=Q;
			else
				if Q=S0 then
					if  op_code="0001" or op_code="0010" or op_code="0011"then 
						if cond="00" then
							NQ:=S1;
				    	elsif cond="01" then
							if z='1' then
								NQ:=S1;
							else
								NQ:=S0;
								end if;
						elsif cond="10" then
							if c='1' then
								NQ:=S1;
							else
								NQ:=S0;
							end if;
						elsif cond="11" then
								NQ:=S1;
						end if;
					elsif op_code="0010" then
						if cond="00" then
							NQ:=S1;
						elsif cond="01" then
							if z='1' then
								NQ:=S1;
							else
								NQ:=S0;
							end if;
						elsif cond="10" then
							if c='1' then
								NQ:=S1;
							else  
								NQ:=S0;
							end if;
						end if;
					elsif op_code="0101" or op_code="0111" then
					
						NQ:=S4;
					elsif op_code="1101" then
					
						NQ:=S17;
						
						
					elsif op_code="1000"  then
					
						NQ:=S8;	
						
							
						
					elsif op_code="1010"  then
					
						NQ:=S11;	
						
							
						
					elsif op_code="1100"  then
					
						NQ:=S15;	
						
						
							
						
					elsif op_code="0000"  then
					
						NQ:=S13;	
							
						
					elsif op_code="1011"  then
					
						NQ:=S14;	
												
					end if;
					
					
			end if;
					
			if Q=S1 then
					
						NQ:=S2;
						
			elsif Q=S4 then
					
						NQ:=S5;
			elsif Q=S17 then
					
						NQ:=S18;
						
			elsif Q=S8 then
					
						NQ:=S9;
						
						
						
						
						
			elsif Q=S15 then
					
						NQ:=S16;
						
			elsif Q=S13 then
					
						NQ:=S0;
			elsif Q=S14 then
					
						NQ:=S0;
						
						
			elsif Q=S11 then 
					if op_code(0)='1' then
						 NQ:=S19;
					else 
					    NQ:=S12;
					end if;
					
			end if;
					
			if Q=S5 then 
					if op_code(2 downto 1)="00" then
						 NQ:=S3;
					elsif  op_code(2 downto 1)="11" then
					    NQ:=S6;
				   else NQ:=S7;
					end if;
					
					
			elsif Q=S2 then
			      NQ:= S3;
					
			elsif Q=S18 then
			      NQ:= S0;
					
			elsif Q=S9 then
			      NQ:= S10;
					
					
			elsif Q=S16 then
			      NQ:= S0;
					
			elsif Q=S13 then
			      NQ:= S0;
					
			elsif Q=S14 then
			      NQ:= S0;
					
			elsif Q=S12 then
			      NQ:= S0;
					
			end if;
		
		
			if Q=S10 then
			      NQ:= S0;
					
			elsif Q=S6 then
			      NQ:= S0;
			elsif Q=S7 then
			      NQ:= S0;
							
			elsif Q=S3 then
			      NQ:= S0;
					
					
			elsif Q=S19 then
			      NQ:= S0;
			
         
          end if;
			Q<=NQ;
		end if;
		end if;
	end process;

	controls:process(clk)
	begin
		if Q=S0 then
		   
			S_1<='0';
			S_2<='0';
			P1<='1';
			P0<='1';
			S_9<='0';
			M1<='1';
			M0<='1';
			
			S_17<='0';
			MR<='1';
			MW<='0';
			IW<='1';
			AW<='1';
			BW<='1';
			
			PCW<='1';
			
		elsif Q=S1 then
			
			
			S_3<='0';
         S_4<='0';
			
			
			IW<='1';
			

		elsif Q=S2 then
			
			P1<='0';
			P0<='0';
			S_9<='0';
			M1<='0';
			M0<='0';
			
			
			IW<='1';
			
			AW<='1';
			BW<='1';
			CW<='1';
			
		
		elsif Q=S3 then
			
			S_5<='0';
			
			S_14<='0';
			S_15<='0';
			
			IW<='1';
			
			RW<='1';
			
			CW<='1';
			
		
		elsif Q=S4 then
			
			S_3<='0';
         
			S_6<='0';
			
			M1<='1';
			M0<='0';
			
			IW<='1';
			
			AW<='1';
			
		
		elsif Q=S5 then
			
			P1<='0';
			P0<='0';
			S_9<='0';
			
			AW<='1';
			
			CW<='1';
			
		elsif Q=S6 then
			
			S_2<='1';
			
			S_5<='0';
			
			S_11<='0';
			
			S_13<='1';
			S_14<='1';
			S_15<='0';
			
			MR<='1';
			MW<='0';
			IW<='1';
			DW<='1';
			RW<='1';
			
			CW<='1';
			
		elsif Q=S7 then
			
			S_2<='1';
			
         S_4<='1';
			
			S_12<='0';
			
			MR<='0';
			MW<='1';
			IW<='1';
			
			BW<='1';
			
		elsif Q=S8 then
			
			S_3<='0';
         S_4<='1';
			
			P1<='0';
			P0<='0';
			S_9<='0';
			M1<='0';
			M0<='0';
			
			AW<='1';
			BW<='1';
			
		elsif Q=S9 then
			
			S_6<='0';
			S_7<='1';
			P1<='1';
			P0<='1';
			S_9<='0';
			M1<='1';
			M0<='0';
			
		elsif Q=S10 then
			S_1<='0';
			
			S_17<='1';
			
			CW<='1';
			
		elsif Q=S11 then
			
			S_5<='0';
			
			P1<='1';
			P0<='1';
			S_9<='0';
			M1<='1';
			M0<='1';
			
			
			S_14<='0';
			S_15<='0';
			
		
			IW<='1';
		
			RW<='1';
			
			CW<='1';
			
		elsif Q=S12 then
			S_1<='1';
			
			S_3<='0';
         
			IW<='1';
			
			AW<='1';
			
			
		elsif Q=S13 then
			
			S_5<='0';
			S_6<='1';
			
			S_15<='1';
			
			IW<='1';
			
			RW<='1';
			
		elsif Q=S14 then
			S_1<='0';
			
         S_4<='1';
			
			S_6<='1';
		
			
			S_9<='1';
			M1<='0';
			M0<='0';
			
			S_17<='1';
			
			IW<='1';
			
			BW<='1';
			CW<='1';
			
		elsif Q=S15 then
			
			S_5<='1';
			
			S_7<='0';
			
			IW<='1';
			
		elsif Q=S16 then
			
			S_2<='1';
			
         S_4<='1';
			
			
			S_11<='1';
			
			S_13<='1';
			S_14<='1';
			S_15<='0';
			
			MR<='1';
			MW<='0';
			IW<='1';
			DW<='1';
			RW<='1';
			
			BW<='1';
			
		elsif Q=S17 then
			
			S_3<='1';
         
			IW<='1';
			
		elsif Q=S18 then
			
			S_2<='1';
			
         S_4<='1';
			
			S_11<='1';
			S_12<='1';
			
			MR<='0';
			MW<='1';
			IW<='1';
			
		
			AW<='1';
			BW<='1';
			
		elsif Q=S19 then
			
			S_6<='1';
			
			P1<='1';
			P0<='1';
			S_9<='0';
			M1<='1';
			M0<='0';
			
			S_17<='1';
			
			IW<='1';
			
			CW<='1';
			
		end if;
				
	end process;

end architecture;