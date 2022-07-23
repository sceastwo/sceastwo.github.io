----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 12:22:43 PM
-- Design Name: 
-- Module Name: tb_debouncer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_debouncer is
--  Port ( );
end tb_debouncer;

architecture Behavioral of tb_debouncer is

    component debouncer is
        Generic ( the_max_count : integer := 999;
                  counter_width : integer := 10);
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               D : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    constant clk_period : time := 10ns;

    constant the_max_count : integer := 9;
    constant counter_width : integer := 4;

    signal clk : std_logic;
    signal reset : std_logic; 
    signal D : std_logic; 
    signal Q : std_logic;

begin

    uut : debouncer 
        generic map(
            the_max_count => the_max_count, 
            counter_width => counter_width)
        port map(
            clk => clk, 
            reset => reset, 
            D => D, 
            Q => Q);

    process
    begin
        clk <= '0'; 
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;    

    process
    begin
        reset <= '1';
        D <= '1';
        wait for 2*clk_period; 
        reset <= '0'; 
        D <= '0'; 
        wait for 100*clk_period;
        D <= '1'; 
        wait for 9*clk_period; 
        D <= '0'; 
        wait for clk_period; 
        D <= '1'; 
        wait for 100*clk_period;
        D <= '0';
        wait;
    end process;

end Behavioral;




