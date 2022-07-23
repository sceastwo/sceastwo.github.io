----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 01:55:50 PM
-- Design Name: 
-- Module Name: ps2_keyboard - Behavioral
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

entity ps2_keyboard is
    Port ( clk : in STD_LOGIC;
           keys : in STD_LOGIC_VECTOR (25 downto 0);
           ps2_clk : out STD_LOGIC;
           ps2_data : out STD_LOGIC);
end ps2_keyboard;

architecture Behavioral of ps2_keyboard is

begin


end Behavioral;
