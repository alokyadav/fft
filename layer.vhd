----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:38 04/11/2013 
-- Design Name: 
-- Module Name:    layer - Behavioral 
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

entity layer is port
(
input1:in std_logic_vector(31 downto 0);
input2:in std_logic_vector(31 downto 0);
input3:in std_logic_vector(31 downto 0);
input4:in std_logic_vector(31 downto 0);
input5:in std_logic_vector(31 downto 0);
input6:in std_logic_vector(31 downto 0);
input7:in std_logic_vector(31 downto 0);
input8:in std_logic_vector(31 downto 0);
twiddle_m0:in std_logic_vector(1 downto 0);
twiddle_m1:in std_logic_vector(1 downto 0);
twiddle_m2:in std_logic_vector(1 downto 0);
twiddle_m3:in std_logic_vector(1 downto 0);
output1:inout std_logic_vector(31 downto 0);
output2:inout std_logic_vector(31 downto 0);
output3:inout std_logic_vector(31 downto 0);
output4:inout std_logic_vector(31 downto 0);
output5:inout std_logic_vector(31 downto 0);
output6:inout std_logic_vector(31 downto 0);
output7:inout std_logic_vector(31 downto 0);
output8:inout std_logic_vector(31 downto 0)

);
end layer;

architecture Behavioral of layer is
component Butterfly is
port (
	--in1 and in2 are the main inputs 'a' and 'b'
	in1 : in std_logic_vector(31 downto 0);
	in2 : in std_logic_vector(31 downto 0);
	--in3 is the input determining the value of the exponent of e
	in3 : in std_logic_vector(1 downto 0);
	--the FFT design is such that out1 will never require more than 32 bits
	out1 : inout std_logic_vector(31 downto 0);
	out2 : inout std_logic_vector(31 downto 0)
);
end component;

begin
--The inputs of the layer componenet are mapped two-by-two
--to each one of the four butterfly components
cell1:Butterfly
port map(input1,input2,twiddle_m0,output1,output2);
cell2:Butterfly
port map(input3,input4,twiddle_m1,output3,output4);
cell3:Butterfly
port map(input5,input6,twiddle_m2,output5,output6);
cell4:Butterfly
port map(input7,input8,twiddle_m3,output7,output8);

end Behavioral;