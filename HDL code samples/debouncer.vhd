----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 11:41:10 AM
-- Design Name: 
-- Module Name: debouncer - Behavioral
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

entity debouncer is
    Generic ( the_max_count : integer := 999;
              counter_width : integer := 10);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
    
    constant min_count : unsigned(counter_width-1 downto 0) := (others => '0');
    constant max_count : unsigned(counter_width-1 downto 0) := to_unsigned(the_max_count, counter_width); 
    
    signal counter : unsigned(counter_width-1 downto 0);
    signal i_D : std_logic;
    signal i_Q : std_logic;
    
    
begin

    process (clk, reset)
    begin
        if (reset = '1') then 
            counter <= max_count;
            i_D <= D;
            i_Q <= D;
        elsif (rising_edge(clk)) then 
            if (D = i_D) then 
                if (counter = min_count) then 
                    i_Q <= i_D;
                else 
                    counter <= counter - 1;
                end if;
            else 
                counter <= max_count;
                i_D <= D;
            end if;
        end if;
    end process;

    Q <= i_Q;

end Behavioral;





