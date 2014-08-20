--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:02:10 04/11/2013
-- Design Name:   
-- Module Name:   D:/Xilinx/Assignments/fft/main_tb.vhd
-- Project Name:  fft
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main_fft_entity
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
 
ENTITY main_tb IS
END main_tb;
 
ARCHITECTURE behavior OF main_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main_fft_entity
    PORT(
         clk : IN  std_logic;
         in_tick : IN  std_logic;
         in_seq : IN  std_logic_vector(7 downto 0);
         outseq : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal in_tick : std_logic := '0';
   signal in_seq : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal outseq : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main_fft_entity PORT MAP (
          clk => clk,
          in_tick => in_tick,
          in_seq => in_seq,
          outseq => outseq
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		in_tick<='0';
       wait for 100 ns;	

		in_seq<="00111100";
      wait for clk_period*10;
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	

		in_seq<="01111000";
      wait for clk_period*10;
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	


		in_seq<="01111000";
      wait for clk_period*10;
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		
		in_seq<="01011000";
      wait for clk_period*10;
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	

		in_seq<="00000000";
      wait for clk_period*10;
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	

		in_seq<="00011100";
      wait for clk_period*10;
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		
		in_seq<="00011000";
      wait for clk_period*10;
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	

		
		in_seq<="00110000";
      wait for clk_period*10;
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		

		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;	
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			

		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			
		
		in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			in_tick<='1';
		wait for clk_period*10;
		in_tick<='0';
		wait for 100 ns;			
      -- insert stimulus here 

      wait;
   end process;

END;
