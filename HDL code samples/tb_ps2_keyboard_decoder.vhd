----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 09:59:31 PM
-- Design Name: 
-- Module Name: tb_ps2_keyboard_decoder - Behavioral
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

entity tb_ps2_keyboard_decoder is
--  Port ( );
end tb_ps2_keyboard_decoder;

architecture Behavioral of tb_ps2_keyboard_decoder is

    component ps2_keyboard_decoder is
        Port ( clk : in STD_LOGIC; 
               reset : in STD_LOGIC;
               ps2_clk : in STD_LOGIC;
               ps2_data : in STD_LOGIC;
               A_state : out STD_LOGIC;
               B_state : out STD_LOGIC;
               C_state : out STD_LOGIC;
               D_state : out STD_LOGIC;
               E_state : out STD_LOGIC;
               F_state : out STD_LOGIC;
               G_state : out STD_LOGIC;
               H_state : out STD_LOGIC;
               I_state : out STD_LOGIC;
               J_state : out STD_LOGIC;
               K_state : out STD_LOGIC;
               L_state : out STD_LOGIC;
               M_state : out STD_LOGIC;
               N_state : out STD_LOGIC;
               O_state : out STD_LOGIC;
               P_state : out STD_LOGIC;
               Q_state : out STD_LOGIC;
               R_state : out STD_LOGIC;
               S_state : out STD_LOGIC;
               T_state : out STD_LOGIC;
               U_state : out STD_LOGIC;
               V_state : out STD_LOGIC;
               W_state : out STD_LOGIC;
               X_state : out STD_LOGIC;
               Y_state : out STD_LOGIC;
               Z_state : out STD_LOGIC);
    end component;

    constant clk_period : time := 10ns;

    signal clk : std_logic;
    signal reset : std_logic;
    signal ps2_clk : std_logic; 
    signal ps2_data : std_logic; 
    signal A_state : std_logic; 
    signal B_state : std_logic; 
    signal C_state : std_logic; 
    signal D_state : std_logic; 
    signal E_state : std_logic; 
    signal F_state : std_logic; 
    signal G_state : std_logic; 
    signal H_state : std_logic; 
    signal I_state : std_logic; 
    signal J_state : std_logic; 
    signal K_state : std_logic; 
    signal L_state : std_logic; 
    signal M_state : std_logic; 
    signal N_state : std_logic; 
    signal O_state : std_logic; 
    signal P_state : std_logic; 
    signal Q_state : std_logic; 
    signal R_state : std_logic; 
    signal S_state : std_logic; 
    signal T_state : std_logic; 
    signal U_state : std_logic; 
    signal V_state : std_logic; 
    signal W_state : std_logic; 
    signal X_state : std_logic; 
    signal Y_state : std_logic; 
    signal Z_state : std_logic; 

begin

    uut : ps2_keyboard_decoder
        port map(
            clk => clk, 
            reset => reset, 
            ps2_clk => ps2_clk, 
            ps2_data => ps2_data, 
            A_state => A_state, 
            B_state => B_state, 
            C_state => C_state, 
            D_state => D_state, 
            E_state => E_state, 
            F_state => F_state, 
            G_state => G_state, 
            H_state => H_state, 
            I_state => I_state, 
            J_state => J_state, 
            K_state => K_state, 
            L_state => L_state, 
            M_state => M_state, 
            N_state => N_state, 
            O_state => O_state, 
            P_state => P_state, 
            Q_state => Q_state, 
            R_state => R_state, 
            S_state => S_state, 
            T_state => T_state, 
            U_state => U_state, 
            V_state => V_state, 
            W_state => W_state, 
            X_state => X_state, 
            Y_state => Y_state, 
            Z_state => Z_state
        );

    process
    begin
        clk <= '0'; 
        wait for clk_period/2;
        clk <= '1'; 
        wait for clk_period/2; 
    end process;

    process
        variable key_code : std_logic_vector(7 downto 0);
        variable parity : std_logic;
    begin 
        reset <= '1'; 
        ps2_clk <= '1';
        ps2_data <= '1';
        wait for clk_period;
        reset <= '0'; 
        
        
        
        -- Press the 'b' key.
        key_code := X"32";
        
        ps2_data <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        parity := '0';
        for i in 0 to 7 loop
            ps2_data <= key_code(i);
            wait for 20*clk_period; 
            ps2_clk <= '0';
            wait for 20*clk_period; 
            ps2_clk <= '1';
            wait for 20*clk_period; 
            
            parity := parity xor key_code(i);
        end loop;
        
        ps2_data <= not parity;
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        ps2_data <= '1';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        wait for 100*clk_period;
        
        
        
        -- Press the 'f' key.
        key_code := X"2B";
        
        ps2_data <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        parity := '0';
        for i in 0 to 7 loop
            ps2_data <= key_code(i);
            wait for 20*clk_period; 
            ps2_clk <= '0';
            wait for 20*clk_period; 
            ps2_clk <= '1';
            wait for 20*clk_period; 
            
            parity := parity xor key_code(i);
        end loop;
        
        ps2_data <= not parity;
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        ps2_data <= '1';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        wait for 100*clk_period;
        
        
        
        -- Release the 'b' key.
        key_code := X"F0";
        
        ps2_data <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        parity := '0';
        for i in 0 to 7 loop
            ps2_data <= key_code(i);
            wait for 20*clk_period; 
            ps2_clk <= '0';
            wait for 20*clk_period; 
            ps2_clk <= '1';
            wait for 20*clk_period; 
            
            parity := parity xor key_code(i);
        end loop;
        
        ps2_data <= not parity;
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        ps2_data <= '1';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        wait for 100*clk_period;
        
        key_code := X"32";
        
        ps2_data <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        parity := '0';
        for i in 0 to 7 loop
            ps2_data <= key_code(i);
            wait for 20*clk_period; 
            ps2_clk <= '0';
            wait for 20*clk_period; 
            ps2_clk <= '1';
            wait for 20*clk_period; 
            
            parity := parity xor key_code(i);
        end loop;
        
        ps2_data <= not parity;
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        ps2_data <= '1';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        wait for 100*clk_period;
        
        
        --check the wait to reset
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1'; 
        wait for 800*clk_period; 
        
        
        -- Release the 'f' key.
        key_code := X"F0";
        
        ps2_data <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        parity := '0';
        for i in 0 to 7 loop
            ps2_data <= key_code(i);
            wait for 20*clk_period; 
            ps2_clk <= '0';
            wait for 20*clk_period; 
            ps2_clk <= '1';
            wait for 20*clk_period; 
            
            parity := parity xor key_code(i);
        end loop;
        
        ps2_data <= not parity;
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        ps2_data <= '1';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        wait for 100*clk_period;
        
        key_code := X"2B";
        
        ps2_data <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        parity := '0';
        for i in 0 to 7 loop
            ps2_data <= key_code(i);
            wait for 20*clk_period; 
            ps2_clk <= '0';
            wait for 20*clk_period; 
            ps2_clk <= '1';
            wait for 20*clk_period; 
            
            parity := parity xor key_code(i);
        end loop;
        
        ps2_data <= not parity;
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        ps2_data <= '1';
        wait for 20*clk_period; 
        ps2_clk <= '0';
        wait for 20*clk_period; 
        ps2_clk <= '1';
        wait for 20*clk_period; 
        
        wait for 100*clk_period;
        
        
        wait;
    end process;

end Behavioral;



