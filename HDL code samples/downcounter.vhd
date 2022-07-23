----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 11:08:57 PM
-- Design Name: 
-- Module Name: downcounter - Behavioral
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

entity downcounter is
    Generic ( period : integer := 10000; 
              counter_width : integer := 14);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (counter_width-1 downto 0);
           pulse : out STD_LOGIC);
end downcounter;

architecture Behavioral of downcounter is

    constant min_count : unsigned(counter_width-1 downto 0) := (others => '0');
    constant max_count : unsigned(counter_width-1 downto 0) := to_unsigned(period-1, counter_width);

    signal i_count : unsigned(counter_width-1 downto 0);
    signal i_pulse : std_logic;

begin

    process (clk,reset)
    begin
        if (reset = '1') then 
            i_count <= max_count;
            i_pulse <= '0';
        elsif (rising_edge(clk)) then 
            if (enable = '1') then
                if (i_count = min_count) then 
                    i_count <= max_count;
                    i_pulse <= '1';
                else 
                    i_count <= i_count - 1;
                    i_pulse <= '0';
                end if;
            else
                i_pulse <= '0';
            end if;
        end if;
    end process;

    count <= std_logic_vector(i_count);
    pulse <= i_pulse;

end Behavioral;






