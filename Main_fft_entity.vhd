----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:56 04/11/2013 
-- Design Name: 
-- Module Name:    Main_fft_entity - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main_fft_entity is
port(
		clk:in STD_LOGIC;
		in_tick:in STD_LOGIC;
		in_seq: in std_logic_vector(7 downto 0);

		outseq: out std_logic_vector(7 downto 0)
	);
end Main_fft_entity;


architecture Behavioral of Main_fft_entity is

--defines necessary states for the FSM
type state is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,Stemp);
--states for the debouncing logic
type state_diff is (D0,D1,D2);
signal p_state,n_state : state:=S0;
--Debouncing logic state. Starts in an accepting state
signal d_state : state_diff := D0;
-- Signal, which becomes '1' for one clock cycle when the push button is pressed
signal in_deb : std_logic:='0';
--used in debouncing logic
signal counter : std_logic_vector(24 downto 0)	;
signal counter_fft:std_logic_vector(10 downto 0);
signal sample0:  std_logic_vector(7 downto 0);
signal sample1:  std_logic_vector(7 downto 0);
signal sample2:  std_logic_vector(7 downto 0);
signal sample3:  std_logic_vector(7 downto 0);
signal sample4:  std_logic_vector(7 downto 0);
signal sample5:  std_logic_vector(7 downto 0);
signal sample6:  std_logic_vector(7 downto 0);
signal sample7:  std_logic_vector(7 downto 0);
signal harm0r : std_logic_vector(7 downto 0);
signal harm0c : std_logic_vector(7 downto 0);
signal harm1r : std_logic_vector(7 downto 0);
signal harm1c : std_logic_vector(7 downto 0);
signal harm2r : std_logic_vector(7 downto 0);
signal harm2c : std_logic_vector(7 downto 0);
signal harm3r : std_logic_vector(7 downto 0);
signal harm3c : std_logic_vector(7 downto 0);
signal harm4r : std_logic_vector(7 downto 0);
signal harm4c : std_logic_vector(7 downto 0);
signal harm5r : std_logic_vector(7 downto 0);
signal harm5c : std_logic_vector(7 downto 0);
signal harm6r : std_logic_vector(7 downto 0);
signal harm6c : std_logic_vector(7 downto 0);
signal harm7r : std_logic_vector(7 downto 0);
signal harm7c : std_logic_vector(7 downto 0);

component fft_main is
	port(
		in_sample0: in std_logic_vector(7 downto 0);
		in_sample1: in std_logic_vector(7 downto 0);
		in_sample2: in std_logic_vector(7 downto 0);
		in_sample3: in std_logic_vector(7 downto 0);
		in_sample4: in std_logic_vector(7 downto 0);
		in_sample5: in std_logic_vector(7 downto 0);
		in_sample6: in std_logic_vector(7 downto 0);
		in_sample7: in std_logic_vector(7 downto 0);
		harmonic0r: out std_logic_vector(7 downto 0);
		harmonic0i: out std_logic_vector(7 downto 0);
		harmonic1r: out std_logic_vector(7 downto 0);
		harmonic1i: out std_logic_vector(7 downto 0);
		harmonic2r: out std_logic_vector(7 downto 0);
		harmonic2i: out std_logic_vector(7 downto 0);
		harmonic3r: out std_logic_vector(7 downto 0);
		harmonic3i: out std_logic_vector(7 downto 0);
		harmonic4r: out std_logic_vector(7 downto 0);
		harmonic4i: out std_logic_vector(7 downto 0);
		harmonic5r: out std_logic_vector(7 downto 0);
		harmonic5i: out std_logic_vector(7 downto 0);
		harmonic6r: out std_logic_vector(7 downto 0);
		harmonic6i: out std_logic_vector(7 downto 0);
		harmonic7r: out std_logic_vector(7 downto 0);
		harmonic7i: out std_logic_vector(7 downto 0)

	);
end component;

begin
	fft:fft_main
	port map(sample0,sample1,sample2,sample3,sample4,sample5,sample6,sample7,harm0r,harm0c,harm1r,harm1c,harm2r,harm2c,harm3r,harm3c,harm4r,harm4c,harm5r,harm5c,harm6r,harm6c,harm7r,harm7c);
	Seq:process(clk)
		begin
			if rising_edge(clk) then
				--in_deb = '1' means that the user has pressed the pushed button. So we know that next_state 
				-- has the currect current state, and out1 and seq_detected have correct values.
				-- So necessary assignment takes place
				if(in_deb='1') then 
					p_state<=n_state;
				end if;
			end if;
		end process;
		

Comb:process(p_state,in_seq,clk)
	begin
		--default values of out_tmp and seq_det
		--transitions have been defined here
		if rising_edge(clk) then
		case p_state is
			when S0 =>
				n_state<=S1;
				sample0<=in_seq;
				outseq<="00000001";
			when S1 =>
				n_state<=S2;
				sample1<=in_seq;
				outseq<="00000010";
			when S2 =>
				n_state<=S3;
				sample2<=in_seq;
				outseq<="00000011";
			when S3 =>
				n_state<=S4;
				sample3<=in_seq;
				outseq<="00000100";
			when S4 =>
				n_state<=S5;
				sample4<=in_seq;
				outseq<="00000101";
			when S5 =>
				n_state<=S6;
				sample5<=in_seq;
				outseq<="00000110";
			when S6 =>
				n_state<=S7;
				sample6<=in_seq;
				outseq<="00000111";
			when S7 =>
				n_state<=S8;
				sample7<=in_seq;
				outseq<="00001000";
				counter_fft<=(others=>'0');
			when S8 =>
				outseq<="00001001";
				if counter_fft=100 then
					n_state<=S9;
				else 
					counter_fft<=counter_fft+1;
					n_state<=S8;
				end if;
			when S9 =>
				outseq<="00001010";
				n_state<=S10;
				outseq <= harm0r;
			when S10 =>
				n_state<=S11;
				outseq <= harm0c;
			when S11 =>
				n_state<=S12;
				outseq <= harm1r;
			when S12 =>
				n_state<=S13;
				outseq <= harm1c;
			when S13 =>
				n_state<=Stemp;
				outseq <= harm2r;
			when Stemp =>
				n_state<=S14;
				outseq <= harm2c;
			when S14 =>
				n_state<=S15;
				outseq <= harm3r;
			when S15 =>
				n_state<=S16;
				outseq <= harm3c;
			when S16 =>
				n_state<=S17;
				outseq <= harm4r;
			when S17 =>
				n_state<=S18;
				outseq <= harm4c;
			when S18 =>
				n_state<=S19;
				outseq <= harm5r;
			when S19 =>
				n_state<=S20;
				outseq <= harm5c;
			when S20 =>
				n_state<=S21;
				outseq <= harm6r;
			when S21 =>
				n_state<=S22;
				outseq <= harm6c;
			when S22 =>
				n_state<=S23;
				outseq <= harm7r;
			when S23 =>
				n_state<=S0;
				outseq <= harm7c;			
		end case;
	end if;
	end process;

Debounce:process(clk)
	begin
		if rising_edge(clk) then
			case d_state is
			--ready to take input
			when D0 =>
				-- when input is to be taken
				if in_tick='1' then
					in_deb<='1';
					d_state<=D1;
				end if;
			when D1 =>
				--just set counter to 0 , in_deb to 0 and move to state D2
				counter<=(others=>'0');
				in_deb<='0';
				d_state <= D2;
			when D2 =>
				-- 1111111111111111111111111 is 2^25 -1 
				-- so the circuit waits for 2^25 clock pulses ( ~ 0.335 seconds)
				--note that this has to be reduced to a lower value for test_bench(possible 5 or 10)
				--when counter becomes the reqd value , then state transfer to D0,
				--"1111111111111111111111111" 
				--value for test_bench "0000000000000000000000001"
				if counter="1111111111111111111111111" then 
					if(in_tick='0') then
						d_state<=D0;
					end if;
				else
				--if the counter has not reached 2^25-1 , then keep increasing counter on rising edge
					counter <= counter +1;
				end if;
			end case;
		end if;
end process;
end Behavioral;

