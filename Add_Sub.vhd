----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:45:07 04/07/2013 
-- Design Name: 
-- Module Name:    Add_Sub - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Add_Sub is
port (
	in1_R : in std_logic_vector(15 downto 0);
	in2_R : in std_logic_vector(15 downto 0);
	in1_C : in std_logic_vector(15 downto 0);
	in2_C : in std_logic_vector(15 downto 0);
	outA_R : out std_logic_vector(15 downto 0);
	outA_C : out std_logic_vector(15 downto 0);
	outS_R : out std_logic_vector(15 downto 0);
	outS_C : out std_logic_vector(15 downto 0)
);
end Add_Sub;

architecture Behavioral of Add_Sub is
begin
	--out1 and out2 are guaranteed not to exceed 32 bits
	outA_R <= in1_R + in2_R;
	outA_C <= in1_C + in2_C;
	outS_R <= in1_R - in2_R;
	outS_C <= in1_C - in2_C;
end Behavioral;