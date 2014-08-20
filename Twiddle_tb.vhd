--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:55:38 04/11/2013
-- Design Name:   
-- Module Name:   D:/Academic/4/cs210/Project - FFT/FastFourierTransform/Twiddle_tb.vhd
-- Project Name:  FastFourierTransform
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Twiddle
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
 
ENTITY Twiddle_tb IS
END Twiddle_tb;
 
ARCHITECTURE behavior OF Twiddle_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Twiddle
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         m : IN  std_logic_vector(1 downto 0);
         o : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal m : std_logic_vector(1 downto 0) := (others => '0');

	--BiDirs
	
   signal o : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Twiddle PORT MAP (
          a => a,
          m => m,
          o => o
        );

   -- Clock process definitions
--   clock_process :process
--  begin
--		clock <= '0';
--		wait for clock_period/2;
--		clock <= '1';
--		wait for clock_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      -- insert stimulus here 
		a <= "00000101000000010000000100000000";
		m <= "00";
		wait for clock_period;
		------........||||||||........||||||||
		a <= "00000101000000010000000100000000";
		m <= "01";
		wait for clock_period;
		a <= "00000101000000010000000100000000";
		m <= "10";
		wait for clock_period;
		a <= "00000101000000010000000100000000";
		m <= "11";
		wait for clock_period;
      wait;
   end process;

END;
