----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 11:40:16 PM
-- Design Name: 
-- Module Name: tb_downcounter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_downcounter is
--  Port ( );
end tb_downcounter;

architecture Behavioral of tb_downcounter is

    component downcounter is
        Generic ( period : integer := 10000; 
                  counter_width : integer := 14);
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               enable : in STD_LOGIC;
               count : out STD_LOGIC_VECTOR (counter_width-1 downto 0);
               pulse : out STD_LOGIC);
    end component;

    constant clk_period : time := 10ns;
    
    constant period : integer := 100;
    constant counter_width : integer := 7;

    signal clk : std_logic; 
    signal reset : std_logic;
    signal enable : std_logic;
    signal count : std_logic_vector(counter_width-1 downto 0);
    signal pulse : std_logic;

begin

    uut : downcounter
        Generic map(
            period => period,
            counter_width => counter_width
        )
        Port map(
            clk => clk, 
            reset => reset, 
            enable => enable, 
            count => count, 
            pulse => pulse
        );

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
        enable <= '0';
        wait for clk_period; 
        reset <= '0';
        wait for clk_period;
        
        loop
            enable <= '0';
            wait for 9*clk_period;
            enable <= '1';
            wait for clk_period;
        end loop;
        
        wait;
    end process;

end Behavioral;




