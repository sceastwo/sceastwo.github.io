----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 01:03:44 PM
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ps2_keyboard_decoder is
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
end ps2_keyboard_decoder;

architecture Behavioral of ps2_keyboard_decoder is

    component debouncer is
        Generic ( the_max_count : integer := 999;
                  counter_width : integer := 10);
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               D : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    signal i_ps2_clk : std_logic;
    signal i_ps2_data : std_logic;

    signal i_ps2_clk_d1 : std_logic;
    signal i_ps2_clk_falling_edge_flag : std_logic;

    -- process #1
    type data_in_state is (S_idle, S_bits, S_parity, S_stop, S_done);
    signal i_data_in_state : data_in_state;
    signal i_bit_read_index : unsigned(2 downto 0); -- the index of the bit being read.
    signal i_data : std_logic_vector(7 downto 0);
    signal i_bit_parity : std_logic;
    signal i_read_error_flag : std_logic;
    
    -- process #2
    constant max_reset_counter : unsigned(16 downto 0) := to_unsigned(199, 17); --99999
    signal i_read_reset_counter : unsigned(16 downto 0); -- reset the data packet read after a period of inactivity
    
    -- process #3
    signal i_previous_key_code : std_logic_vector(7 downto 0);

begin

    ps2_clk_debouncer : debouncer
        generic map(
            the_max_count => 8, --498 
            counter_width => 10)
        port map(
            clk => clk, 
            reset => reset, 
            D => ps2_clk, 
            Q => i_ps2_clk);

    ps2_data_debouncer : debouncer
        generic map(
            the_max_count => 8, --498 
            counter_width => 10)
        port map(
            clk => clk, 
            reset => reset, 
            D => ps2_data, 
            Q => i_ps2_data);

    process(clk, reset) 
    begin
        if (reset = '1') then 
            i_ps2_clk_d1 <= '0';
        elsif (rising_edge(clk)) then 
            i_ps2_clk_d1 <= i_ps2_clk;
        end if;
    end process;

    process (i_ps2_clk, i_ps2_clk_d1)
    begin
        if (i_ps2_clk = '0' and i_ps2_clk_d1 = '1') then
            i_ps2_clk_falling_edge_flag <= '1';
        else 
            i_ps2_clk_falling_edge_flag <= '0';
        end if;
    end process;

    process(clk, reset)
    begin
        if (reset = '1') then
            i_data_in_state <= S_idle;
            i_bit_read_index <= (others => '0'); 
            i_data <= (others => '0');
            i_bit_parity <= '0';
            i_read_error_flag <= '0';
        elsif (rising_edge(clk)) then
            if (i_read_reset_counter = max_reset_counter) then -- reset the read if the wait is too long
                i_data_in_state <= S_idle;
                i_bit_read_index <= (others => '0');
                i_data <= (others => '0');
                i_bit_parity <= '0';
                i_read_error_flag <= '0';
            elsif (i_ps2_clk_falling_edge_flag = '1') then 
                case i_data_in_state is 
                    when S_idle => 
                        i_data_in_state <= S_bits;
                        i_bit_read_index <= (others => '0');
                        i_data <= (others => '0');
                        i_bit_parity <= '0';
                        i_read_error_flag <= '0';
                    when S_bits =>  
                        i_data(to_integer(i_bit_read_index)) <= i_ps2_data;
                        i_bit_parity <= i_bit_parity xor i_ps2_data;
                        if (i_bit_read_index = "111") then 
                            i_data_in_state <= S_parity;
                        else 
                            i_bit_read_index <= i_bit_read_index + 1;
                        end if;
                    when S_parity => 
                        i_data_in_state <= S_stop;
                        i_bit_parity <= i_bit_parity xor i_ps2_data;
                        i_read_error_flag <= not (i_bit_parity xor i_ps2_data);
                    when S_stop => 
                        i_data_in_state <= S_done;
                    when S_done => 
                        i_data_in_state <= S_idle;
                end case;
            else 
                if (i_data_in_state = S_done) then 
                    i_data_in_state <= S_idle;
                end if;
            end if;
        end if; 
    end process;

    process(clk, reset) 
    begin
        if (reset = '1') then 
            i_read_reset_counter <= (others => '0');
        elsif (rising_edge(clk)) then 
            if (i_ps2_clk_falling_edge_flag = '1') then 
                i_read_reset_counter <= (others => '0');
            elsif (i_read_reset_counter <= max_reset_counter) then -- will count to 1 past the reset value.
                i_read_reset_counter <= i_read_reset_counter + 1;
            end if;
        end if;
    end process;

    process(clk, reset)
    begin
        if (reset = '1') then 
            i_previous_key_code <= (others => '0');
            A_state <= '0';
            B_state <= '0';
            C_state <= '0';
            D_state <= '0';
            E_state <= '0';
            F_state <= '0';
            G_state <= '0';
            H_state <= '0';
            I_state <= '0';
            J_state <= '0';
            K_state <= '0';
            L_state <= '0';
            M_state <= '0';
            N_state <= '0';
            O_state <= '0';
            P_state <= '0';
            Q_state <= '0';
            R_state <= '0';
            S_state <= '0';
            T_state <= '0';
            U_state <= '0';
            V_state <= '0';
            W_state <= '0';
            X_state <= '0';
            Y_state <= '0';
            Z_state <= '0';
        elsif (rising_edge(clk)) then 
            if (i_data_in_state = S_done and i_read_error_flag = '0') then 
                i_previous_key_code <= i_data;
                if (i_previous_key_code = X"F0") then 
                    case i_data is 
                        when X"1C" => 
                            A_state <= '0';
                        when X"32" => 
                            B_state <= '0';
                        when X"21" => 
                            C_state <= '0';
                        when X"23" => 
                            D_state <= '0';
                        when X"24" => 
                            E_state <= '0';
                        when X"2B" => 
                            F_state <= '0';
                        when X"34" => 
                            G_state <= '0';
                        when X"33" => 
                            H_state <= '0';
                        when X"43" => 
                            I_state <= '0';
                        when X"3B" => 
                            J_state <= '0';
                        when X"42" => 
                            K_state <= '0';
                        when X"4B" => 
                            L_state <= '0';
                        when X"3A" => 
                            M_state <= '0';
                        when X"31" => 
                            N_state <= '0';
                        when X"44" => 
                            O_state <= '0';
                        when X"4D" => 
                            P_state <= '0';
                        when X"15" => 
                            Q_state <= '0';
                        when X"2D" => 
                            R_state <= '0';
                        when X"1B" => 
                            S_state <= '0';
                        when X"2C" => 
                            T_state <= '0';
                        when X"3C" => 
                            U_state <= '0';
                        when X"2A" => 
                            V_state <= '0';
                        when X"1D" => 
                            W_state <= '0';
                        when X"22" => 
                            X_state <= '0';
                        when X"35" => 
                            Y_state <= '0';
                        when X"1A" => 
                            Z_state <= '0';
                        when others => 
                            null;
                    end case;
                else 
                    case i_data is 
                        when X"1C" => 
                            A_state <= '1';
                        when X"32" => 
                            B_state <= '1';
                        when X"21" => 
                            C_state <= '1';
                        when X"23" => 
                            D_state <= '1';
                        when X"24" => 
                            E_state <= '1';
                        when X"2B" => 
                            F_state <= '1';
                        when X"34" => 
                            G_state <= '1';
                        when X"33" => 
                            H_state <= '1';
                        when X"43" => 
                            I_state <= '1';
                        when X"3B" => 
                            J_state <= '1';
                        when X"42" => 
                            K_state <= '1';
                        when X"4B" => 
                            L_state <= '1';
                        when X"3A" => 
                            M_state <= '1';
                        when X"31" => 
                            N_state <= '1';
                        when X"44" => 
                            O_state <= '1';
                        when X"4D" => 
                            P_state <= '1';
                        when X"15" => 
                            Q_state <= '1';
                        when X"2D" => 
                            R_state <= '1';
                        when X"1B" => 
                            S_state <= '1';
                        when X"2C" => 
                            T_state <= '1';
                        when X"3C" => 
                            U_state <= '1';
                        when X"2A" => 
                            V_state <= '1';
                        when X"1D" => 
                            W_state <= '1';
                        when X"22" => 
                            X_state <= '1';
                        when X"35" => 
                            Y_state <= '1';
                        when X"1A" => 
                            Z_state <= '1';
                        when others => 
                            null;
                    end case;
                end if;
            end if;
        end if;
    end process;
    
            


end Behavioral;





