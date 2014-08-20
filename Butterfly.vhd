----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:32:46 04/07/2013 
-- Design Name: 
-- Module Name:    Butterfly - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Butterfly is
port (
	--in1 and in2 are the main inputs 'a' and 'b'
	in1 : in std_logic_vector(31 downto 0);
	in2 : in std_logic_vector(31 downto 0);
	--in3 is the input determining the value of the exponent of e
	in3 : in std_logic_vector(1 downto 0);
	--the FFT design is such that out1 will never require more than 32 bits
	out1 : inout std_logic_vector(31 downto 0);
	out2 : inout std_logic_vector(31 downto 0)
	--out2 is inout rather than out
	--because it comes from the o port of Twiddle, which is of inout type
	--and inout type ports cannot be connected to out type ports
);
end Butterfly;

architecture Behavioral of Butterfly is

component Twiddle is
port (
	--first bit is the sign bit (1 if non-negative, 0 if negative)
	--next 7 bits are the integral part of the real part
	--next 8 bits are the fractional part of the real part
	--similarly the complex part takes up the next 16 bits
	a : in std_logic_vector(31 downto 0);
	--m takes one of the values 0, 1, 2 or 3, so we need two bits for it
	m : in std_logic_vector(1 downto 0);
	--o must be inout (rather than just out)
	--since we are accessing elements of o while assigning to it
	o : inout std_logic_vector(31 downto 0)
);
end component;
signal temp:std_logic_vector(31 downto 0);
begin
	out1 <= in1 + in2;
	temp <= in1 - in2;
	cell: Twiddle
	port map (temp, in3, out2);

end Behavioral;