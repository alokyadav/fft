--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:51:28 04/11/2013
-- Design Name:   
-- Module Name:   D:/Academic/4/cs210/Project - FFT/FastFourierTransform/fft_main_tb.vhd
-- Project Name:  FastFourierTransform
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fft_main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fft_main_tb IS
END fft_main_tb;
 
ARCHITECTURE behavior OF fft_main_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fft_main
    PORT(
         in_sample0 : IN  std_logic_vector(7 downto 0);
         in_sample1 : IN  std_logic_vector(7 downto 0);
         in_sample2 : IN  std_logic_vector(7 downto 0);
         in_sample3 : IN  std_logic_vector(7 downto 0);
         in_sample4 : IN  std_logic_vector(7 downto 0);
         in_sample5 : IN  std_logic_vector(7 downto 0);
         in_sample6 : IN  std_logic_vector(7 downto 0);
         in_sample7 : IN  std_logic_vector(7 downto 0);
         harmonic0r : INOUT  std_logic_vector(7 downto 0);
         harmonic0i : INOUT  std_logic_vector(7 downto 0);
         harmonic1r : INOUT  std_logic_vector(7 downto 0);
         harmonic1i : INOUT  std_logic_vector(7 downto 0);
         harmonic2r : INOUT  std_logic_vector(7 downto 0);
         harmonic2i : INOUT  std_logic_vector(7 downto 0);
         harmonic3r : INOUT  std_logic_vector(7 downto 0);
         harmonic3i : INOUT  std_logic_vector(7 downto 0);
         harmonic4r : INOUT  std_logic_vector(7 downto 0);
         harmonic4i : INOUT  std_logic_vector(7 downto 0);
         harmonic5r : INOUT  std_logic_vector(7 downto 0);
         harmonic5i : INOUT  std_logic_vector(7 downto 0);
         harmonic6r : INOUT  std_logic_vector(7 downto 0);
         harmonic6i : INOUT  std_logic_vector(7 downto 0);
         harmonic7r : INOUT  std_logic_vector(7 downto 0);
         harmonic7i : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_sample0 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_sample1 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_sample2 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_sample3 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_sample4 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_sample5 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_sample6 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_sample7 : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal harmonic0r : std_logic_vector(7 downto 0);
   signal harmonic0i : std_logic_vector(7 downto 0);
   signal harmonic1r : std_logic_vector(7 downto 0);
   signal harmonic1i : std_logic_vector(7 downto 0);
   signal harmonic2r : std_logic_vector(7 downto 0);
   signal harmonic2i : std_logic_vector(7 downto 0);
   signal harmonic3r : std_logic_vector(7 downto 0);
   signal harmonic3i : std_logic_vector(7 downto 0);
   signal harmonic4r : std_logic_vector(7 downto 0);
   signal harmonic4i : std_logic_vector(7 downto 0);
   signal harmonic5r : std_logic_vector(7 downto 0);
   signal harmonic5i : std_logic_vector(7 downto 0);
   signal harmonic6r : std_logic_vector(7 downto 0);
   signal harmonic6i : std_logic_vector(7 downto 0);
   signal harmonic7r : std_logic_vector(7 downto 0);
   signal harmonic7i : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
	
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: fft_main PORT MAP (
          in_sample0 => in_sample0,
          in_sample1 => in_sample1,
          in_sample2 => in_sample2,
          in_sample3 => in_sample3,
          in_sample4 => in_sample4,
          in_sample5 => in_sample5,
          in_sample6 => in_sample6,
          in_sample7 => in_sample7,
          harmonic0r => harmonic0r,
          harmonic0i => harmonic0i,
          harmonic1r => harmonic1r,
          harmonic1i => harmonic1i,
          harmonic2r => harmonic2r,
          harmonic2i => harmonic2i,
          harmonic3r => harmonic3r,
          harmonic3i => harmonic3i,
          harmonic4r => harmonic4r,
          harmonic4i => harmonic4i,
          harmonic5r => harmonic5r,
          harmonic5i => harmonic5i,
          harmonic6r => harmonic6r,
          harmonic6i => harmonic6i,
          harmonic7r => harmonic7r,
          harmonic7i => harmonic7i
   );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
      in_sample0 <= "11111111";
      in_sample1 <= "11111111";
      in_sample2 <= "11111111";
      in_sample3 <= "11111111";
      in_sample4 <= "11111111";
      in_sample5 <= "11111111";
      in_sample6 <= "11111111";
      in_sample7 <= "11111111";
      wait for 100 ns;
      -- insert stimulus here
      wait;
   end process;
END;