----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:12:01 04/11/2013 
-- Design Name: 
-- Module Name:    fft_main - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fft_main is
	port(
		in_sample0: in std_logic_vector(7 downto 0);
		in_sample1: in std_logic_vector(7 downto 0);
		in_sample2: in std_logic_vector(7 downto 0);
		in_sample3: in std_logic_vector(7 downto 0);
		in_sample4: in std_logic_vector(7 downto 0);
		in_sample5: in std_logic_vector(7 downto 0);
		in_sample6: in std_logic_vector(7 downto 0);
		in_sample7: in std_logic_vector(7 downto 0);
		harmonic0r: inout std_logic_vector(7 downto 0);
		harmonic0i: inout std_logic_vector(7 downto 0);
		harmonic1r: inout std_logic_vector(7 downto 0);
		harmonic1i: inout std_logic_vector(7 downto 0);
		harmonic2r: inout std_logic_vector(7 downto 0);
		harmonic2i: inout std_logic_vector(7 downto 0);
		harmonic3r: inout std_logic_vector(7 downto 0);
		harmonic3i: inout std_logic_vector(7 downto 0);
		harmonic4r: inout std_logic_vector(7 downto 0);
		harmonic4i: inout std_logic_vector(7 downto 0);
		harmonic5r: inout std_logic_vector(7 downto 0);
		harmonic5i: inout std_logic_vector(7 downto 0);
		harmonic6r: inout std_logic_vector(7 downto 0);
		harmonic6i: inout std_logic_vector(7 downto 0);
		harmonic7r: inout std_logic_vector(7 downto 0);
		harmonic7i: inout std_logic_vector(7 downto 0)
	);
end fft_main;


architecture Behavioral of fft_main is
	signal m0:std_logic_vector(1 downto 0):="00";
	signal m1:std_logic_vector(1 downto 0):="01";
	signal m2:std_logic_vector(1 downto 0):="10";
	signal m3:std_logic_vector(1 downto 0):="11";
	signal temp0:std_logic_vector(31 downto 0):=(others=>'0');
	signal temp1:std_logic_vector(31 downto 0):=(others=>'0');
	signal temp2:std_logic_vector(31 downto 0):=(others=>'0');
	signal temp3:std_logic_vector(31 downto 0):=(others=>'0');
	signal temp4:std_logic_vector(31 downto 0):=(others=>'0');
	signal temp5:std_logic_vector(31 downto 0):=(others=>'0');
	signal temp6:std_logic_vector(31 downto 0):=(others=>'0');
	signal temp7:std_logic_vector(31 downto 0):=(others=>'0');
	signal z0:std_logic_vector(31 downto 0):=(others=>'0');
	signal z1:std_logic_vector(31 downto 0):=(others=>'0');
	signal z2:std_logic_vector(31 downto 0):=(others=>'0');
	signal z3:std_logic_vector(31 downto 0):=(others=>'0');
	signal z4:std_logic_vector(31 downto 0):=(others=>'0');
	signal z5:std_logic_vector(31 downto 0):=(others=>'0');
	signal z6:std_logic_vector(31 downto 0):=(others=>'0');
	signal z7:std_logic_vector(31 downto 0):=(others=>'0');
	signal w0:std_logic_vector(31 downto 0):=(others=>'0');
	signal w1:std_logic_vector(31 downto 0):=(others=>'0');
	signal w2:std_logic_vector(31 downto 0):=(others=>'0');
	signal w3:std_logic_vector(31 downto 0):=(others=>'0');
	signal w4:std_logic_vector(31 downto 0):=(others=>'0');
	signal w5:std_logic_vector(31 downto 0):=(others=>'0');
	signal w6:std_logic_vector(31 downto 0):=(others=>'0');
	signal w7:std_logic_vector(31 downto 0):=(others=>'0');
	signal y0:std_logic_vector(31 downto 0):=(others=>'0');
	signal y1:std_logic_vector(31 downto 0):=(others=>'1');
	signal y2:std_logic_vector(31 downto 0):=(others=>'0');
	signal y3:std_logic_vector(31 downto 0):=(others=>'1');
	signal y4:std_logic_vector(31 downto 0):=(others=>'0');
	signal y5:std_logic_vector(31 downto 0):=(others=>'1');
	signal y6:std_logic_vector(31 downto 0):=(others=>'0');
	signal y7:std_logic_vector(31 downto 0):=(others=>'1');
	component layer
		port(
			input1: in std_logic_vector(31 downto 0);
			input2: in std_logic_vector(31 downto 0);
			input3: in std_logic_vector(31 downto 0);
			input4: in std_logic_vector(31 downto 0);
			input5: in std_logic_vector(31 downto 0);
			input6: in std_logic_vector(31 downto 0);
			input7: in std_logic_vector(31 downto 0);
			input8: in std_logic_vector(31 downto 0);
			twiddle_m0: in std_logic_vector(1 downto 0);
			twiddle_m1: in std_logic_vector(1 downto 0);
			twiddle_m2: in std_logic_vector(1 downto 0);
			twiddle_m3: in std_logic_vector(1 downto 0);
			output1: inout std_logic_vector(31 downto 0);
			output2: inout std_logic_vector(31 downto 0);
			output3: inout std_logic_vector(31 downto 0);
			output4: inout std_logic_vector(31 downto 0);
			output5: inout std_logic_vector(31 downto 0);
			output6: inout std_logic_vector(31 downto 0);
			output7: inout std_logic_vector(31 downto 0);
			output8: inout std_logic_vector(31 downto 0)
		
		);
	end component;
begin
	--converting the real inputs to complex ones
	--first we extract the sign bit of the input, which is the leftmost bit
	--then we place the remaining bits in their appropriate positions
	--structure of the input: 1 sign bit, then 4 integral part bits, then 3 decimal part bits
	temp0(31 downto 28)<=(others=>in_sample0(7));
	temp0(27 downto 21)<=in_sample0(6 downto 0);
	temp1(31 downto 28)<=(others=>in_sample1(7));
	temp1(27 downto 21)<=in_sample1(6 downto 0);
	temp2(31 downto 28)<=(others=>in_sample2(7));
	temp2(27 downto 21)<=in_sample2(6 downto 0);
	temp3(31 downto 28)<=(others=>in_sample3(7));
	temp3(27 downto 21)<=in_sample3(6 downto 0);
	temp4(31 downto 28)<=(others=>in_sample4(7));
	temp4(27 downto 21)<=in_sample4(6 downto 0);
	temp5(31 downto 28)<=(others=>in_sample5(7));
	temp5(27 downto 21)<=in_sample5(6 downto 0);
	temp6(31 downto 28)<=(others=>in_sample6(7));
	temp6(27 downto 21)<=in_sample6(6 downto 0);
	temp7(31 downto 28)<=(others=>in_sample7(7));
	temp7(27 downto 21)<=in_sample7(6 downto 0);
	layer_1: layer
	port map (temp0,temp4,temp1,temp5,temp2,temp6,temp3,temp7,m0,m1,m2,m3,z0,z1,z2,z3,z4,z5,z6,z7);
	layer_2: layer
	port map (z0,z4,z2,z6,z1,z5,z3,z7,m0,m2,m0,m2,w0,w1,w2,w3,w4,w5,w6,w7);
	layer_3: layer
	port map (w0,w2,w1,w3,w4,w6,w5,w7,m0,m0,m0,m0,y0,y1,y2,y3,y4,y5,y6,y7);
	harmonic0r<=y0(31 downto 24);
	harmonic0i<=y0(15 downto 8);
	harmonic1r<=y4(31 downto 24);
	harmonic1i<=y4(15 downto 8);
	harmonic2r<=y2(31 downto 24);
	harmonic2i<=y2(15 downto 8);
	harmonic3r<=y6(31 downto 24);
	harmonic3i<=y6(15 downto 8);
	harmonic4r<=y1(31 downto 24);
	harmonic4i<=y1(15 downto 8);
	harmonic5r<=y5(31 downto 24);
	harmonic5i<=y5(15 downto 8);
	harmonic6r<=y3(31 downto 24);
	harmonic6i<=y3(15 downto 8);
	harmonic7r<=y7(31 downto 24);
	harmonic7i<=y7(15 downto 8);
end Behavioral;