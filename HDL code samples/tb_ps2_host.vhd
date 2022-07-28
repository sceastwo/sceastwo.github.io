----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 11:06:53 PM
-- Design Name: 
-- Module Name: tb_ps2_host - Behavioral
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

entity tb_ps2_host is
--  Port ( );
end tb_ps2_host;

architecture Behavioral of tb_ps2_host is

    component ps2_host is
        Port ( clk : in STD_LOGIC; -- 10ns period
               reset : in STD_LOGIC;
               ps2_clk_in : in STD_LOGIC;
               ps2_data_in : in STD_LOGIC;
               ps2_clk_out : out STD_LOGIC;
               ps2_data_out : out STD_LOGIC;
               send_flag : in STD_LOGIC; -- 1 clk pulse will be applied when "send_byte" has the to be sent byte.  
               send_byte : in STD_LOGIC_VECTOR (7 downto 0);
               send_busy_flag : out STD_LOGIC; -- will return 1 until new data can be accepted.
               received_flag : out STD_LOGIC; -- 1 clk pulse will be emmited when "received_byte" has the received byte.
               received_byte : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    constant clk_period : time := 10ns;

    signal clk : std_logic;
    signal reset : std_logic;
    signal ps2_clk_in : std_logic;
    signal ps2_data_in : std_logic;
    signal ps2_clk_out : std_logic;
    signal ps2_data_out : std_logic;
    signal send_flag : std_logic;   
    signal send_byte : std_logic_vector(7 downto 0);
    signal send_busy_flag : std_logic; 
    signal received_flag : std_logic; 
    signal received_byte : std_logic_vector(7 downto 0);

begin

    uut : ps2_host 
        port map(
            clk => clk, 
            reset => reset, 
            ps2_clk_in => ps2_clk_in, 
            ps2_data_in => ps2_data_in, 
            ps2_clk_out => ps2_clk_out, 
            ps2_data_out => ps2_data_out, 
            send_flag => send_flag,  
            send_byte => send_byte,  
            send_busy_flag => send_busy_flag, 
            received_flag => received_flag,  
            received_byte => received_byte
        );


    process
    begin 
        clk <= '0'; 
        wait for clk_period/2;
        clk <= '1'; 
        wait for clk_period/2;
    end process;

    
    process 
        variable the_byte : std_logic_vector(7 downto 0);
        variable parity : std_logic;
    begin 
        reset <= '1'; 
        ps2_clk_in <= '1';
        ps2_data_in <= '1';
        send_flag <= '0'; 
        send_byte <= X"00";
        wait for clk_period;
        reset <= '0'; 
        
        
        
        -- Receive data #1 
        the_byte := X"57";
        
        ps2_data_in <= '0';
        wait for 10*clk_period; 
        ps2_clk_in <= '0';
        wait for 20*clk_period; 
        ps2_clk_in <= '1';
        wait for 10*clk_period; 
        
        parity := '0';
        for i in 0 to 7 loop
            ps2_data_in <= the_byte(i);
            wait for 10*clk_period; 
            ps2_clk_in <= '0';
            wait for 20*clk_period; 
            ps2_clk_in <= '1';
            wait for 10*clk_period; 
            
            parity := parity xor the_byte(i);
        end loop;
        
        ps2_data_in <= not parity;
        wait for 10*clk_period; 
        ps2_clk_in <= '0';
        wait for 20*clk_period; 
        ps2_clk_in <= '1';
        wait for 10*clk_period; 
        
        ps2_data_in <= '1';
        wait for 10*clk_period; 
        ps2_clk_in <= '0';
        wait for 20*clk_period; 
        ps2_clk_in <= '1';
        wait for 10*clk_period; 
        
        wait for 500*clk_period;
    
    
    
        -- Induce a glitch 
        ps2_clk_in <= '0'; 
        wait for 20*clk_period; 
        ps2_clk_in <= '1';
        wait for 600*clk_period;
        
        
        
        -- Receive data #2 
        the_byte := X"CE";
        
        ps2_data_in <= '0';
        wait for 10*clk_period; 
        ps2_clk_in <= '0';
        wait for 20*clk_period; 
        ps2_clk_in <= '1';
        wait for 10*clk_period; 
        
        -- Initiate an early send (send data #1):
        send_flag <= '1';
        send_byte <= X"A5";
        wait for clk_period; 
        send_flag <= '0';
        send_byte <= X"00";
        
        -- Continue receipt
        parity := '0';
        for i in 0 to 7 loop
            ps2_data_in <= the_byte(i);
            wait for 10*clk_period; 
            ps2_clk_in <= '0';
            wait for 20*clk_period; 
            ps2_clk_in <= '1';
            wait for 10*clk_period; 
            
            parity := parity xor the_byte(i);
        end loop;
        
        ps2_data_in <= not parity;
        wait for 10*clk_period; 
        ps2_clk_in <= '0';
        wait for 20*clk_period; 
        ps2_clk_in <= '1';
        wait for 10*clk_period; 
        
        ps2_data_in <= '1';
        wait for 10*clk_period; 
        ps2_clk_in <= '0';
        wait for 20*clk_period; 
        ps2_clk_in <= '1';
        wait for 10*clk_period; 
        
        wait for 500*clk_period;
        
        
    
        -- Send data #1 
        
        wait for 600*clk_period; -- inhibitor pulse
        for i in 1 to 10 loop
            wait for 10*clk_period; 
            ps2_clk_in <= '0';
            wait for 20*clk_period; 
            ps2_clk_in <= '1';
            wait for 10*clk_period; 
        end loop;  
        
        ps2_data_in <= '0'; -- acknowledgement
        wait for 10*clk_period; 
        ps2_clk_in <= '0';
        wait for 20*clk_period; 
        ps2_clk_in <= '1';
        wait for 10*clk_period; 
    
        ps2_data_in <= '1';
    
        wait;
    
    end process; 


end Behavioral;









