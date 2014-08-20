----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:46:33 04/07/2013 
-- Design Name: 
-- Module Name:    Twiddle - Behavioral 
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

--Representation of a complex number

--31 downto 16 real part
--    31 downto 24 integral part
--    23 downto 16 fractional part
--15 downto 0 imaginary part
--    15 downto 8 integral part
--    7 downto 0 complex part

entity Twiddle is
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
end Twiddle;

architecture Behavioral of Twiddle is
--let c = cos(pi/4) = sin(pi/4). Note: c = approx. 0.70710678118
-- c is 00000000 10110101 00000000 00000000 in our representation
--twiddle_0 equals 1
--twiddle_1 equals e^(-pi*i/4) i.e. c - ic
--twiddle_2 equals -i
--twiddle_3 equals e^(-3*pi*i/4) i.e. -c + ic

begin
Comb:process(a,m)
variable c : std_logic_vector(15 downto 0):= "0000000010110101"; --set to constant?
variable temp1 : std_logic_vector(31 downto 0);
variable temp2 : std_logic_vector(31 downto 0);
variable navinc : std_logic_vector(15 downto 0);
begin
	case m is
		when "00" =>
			--twiddle factor is 1, nothing to do
			o <= a;
		when "01" =>
			--let a = x+iy. Then, o equals (x+iy)(c-ic) = (x+y)c + i(y-x)c
			temp1 := (a(31 downto 16) + a(15 downto 0))*c;
			--discard the right 8 bits of temp1 (unnecessary precision)
			--the left 8 bits of temp1 are all guaranteed to be 0s
			o(31 downto 16) <= temp1(23 downto 8);
			temp2 := (a(15 downto 0) - a(31 downto 16))*c;
			o(15 downto 0) <= temp2(23 downto 8);
		when "10" =>
			--let a = x+iy. Then, o equals y-ix
			--That is, real part of o = imaginary part of a
			--and imaginary part of o = negative of the real part of a
			o(31 downto 16) <= a(15 downto 0);
			o(15 downto 0) <= 1+not(a(31 downto 16)); --2's complementation
		when "11" =>
			temp1 := (a(31 downto 16) - a(15 downto 0))*c;
			--discard the right 8 bits of temp1 (unnecessary precision)
			--the left 8 bits of temp1 are all guaranteed to be 0s
			o(31 downto 16) <= temp1(23 downto 8);
			temp2 := (1+ not(a(15 downto 0) + a(31 downto 16)))*c;
			o(15 downto 0) <= temp2(23 downto 8);
		when others =>
			o <= a;
	end case;
end process;
end Behavioral;