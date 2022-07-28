----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Shawn Eastwood
-- 
-- Create Date: 07/24/2022 12:01:21 PM
-- Design Name: 
-- Module Name: ps2_host - Behavioral
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

entity ps2_host is
    Port ( clk : in STD_LOGIC; -- 10ns period
           reset : in STD_LOGIC;
           ps2_clk : in STD_LOGIC;
           ps2_data : in STD_LOGIC;
           send_flag : in STD_LOGIC; -- 1 clk pulse will be applied when "send_byte" has the to be sent byte.  
           send_byte : in STD_LOGIC_VECTOR (7 downto 0);
           send_busy_flag : out STD_LOGIC; -- will return 1 until new data can be accepted.
           received_flag : out STD_LOGIC; -- 1 clk pulse will be emmited when "received_byte" has the received byte.
           received_byte : out STD_LOGIC_VECTOR (7 downto 0));
end ps2_host;

architecture Behavioral of ps2_host is

    component debouncer is
        Generic ( the_max_count : integer := 999;
                  counter_width : integer := 10);
        Port ( clk : in STD_LOGIC; -- 10ns period
               reset : in STD_LOGIC;
               D : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    signal i_ps2_clk : std_logic;
    signal i_ps2_data : std_logic;

    signal i_ps2_clk_d1 : std_logic;
    signal i_ps2_clk_falling_edge_flag : std_logic;
    
    type direction_mode is (S_DIR_IDLE, S_DIR_RECEIVE, S_DIR_SEND);
    signal i_direction : direction_mode; 



    type data_received_state is (S_REC_IDLE, S_REC_BITS, S_REC_PARITY, S_REC_STOP, S_REC_DONE, S_REC_ERROR);
    signal i_data_received_state : data_received_state;
    
    signal i_received_data_buffer : std_logic_vector(7 downto 0); 
    signal i_received_data_bit_index : unsigned(2 downto 0); -- indexes the bits of "i_received_data_buffer"
    
    signal i_received_data_parity_bit : std_logic;
    
    signal i_receive_time_out_counter : unsigned(16 downto 0); -- abort receive due to inactivity.
    constant c_receive_time_out_time : unsigned(16 downto 0) := to_unsigned(100000, 17);
    
    
    
    signal i_send_busy_flag : std_logic;
    
    type data_send_state is (S_SEND_IDLE, S_SEND_INHIBIT, S_SEND_BITS, S_SEND_PARITY, S_SEND_STOP, S_SEND_PS2_RELEASE, S_SEND_ACKNOWLEDGE, S_SEND_DONE, S_SEND_ERROR);
    signal i_data_send_state : data_send_state;
    
    signal i_send_data_buffer : std_logic_vector(7 downto 0);
    signal i_send_data_bit_index : unsigned(2 downto 0); -- indexes the bits of "i_send_data_buffer"
    
    signal i_send_data_parity_bit : std_logic;
    
    signal i_send_inhibitor_counter : unsigned(14 downto 0);
    constant c_send_inhibition_time : unsigned(14 downto 0) := to_unsigned(15000, 15);
    

begin


    ps2_clk_debouncer : debouncer 
        generic map(
            the_max_count => 3, -- 98
            counter_width => 10)
        port map(
            clk => clk, 
            reset => reset, 
            D => ps2_clk, 
            Q => i_ps2_clk);
    
    
    ps2_data_debouncer : debouncer 
        generic map(
            the_max_count => 3, -- 98 
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

    i_ps2_clk_falling_edge_flag <= (not i_ps2_clk) and i_ps2_clk_d1;


    -- i_direction
    process (clk, reset)
    begin
        if (reset = '1') then 
            i_direction <= S_DIR_IDLE;
        elsif (rising_edge(clk)) then 
            if (i_direction = S_DIR_IDLE) then 
                if (i_ps2_clk_falling_edge_flag = '1') then 
                    i_direction <= S_DIR_RECEIVE; 
                elsif (i_send_busy_flag = '1') then 
                    i_direction <= S_DIR_SEND; 
                end if;
            elsif (i_direction = S_DIR_RECEIVE and (i_data_received_state = S_REC_DONE or i_data_received_state = S_REC_ERROR)) then 
                i_direction <= S_DIR_IDLE; 
            elsif (i_direction = S_DIR_SEND and (i_data_send_state = S_SEND_DONE)) then -- Do not let go if there was an error in sending.
                i_direction <= S_DIR_IDLE; 
            end if;
        end if;
    end process; 


    -- i_data_received_state
    -- i_received_data_buffer
    -- i_received_data_bit_index
    -- i_received_data_parity_bit
    process (clk, reset)
    begin
        if (reset = '1') then 
            i_data_received_state <= S_REC_IDLE;
            i_received_data_buffer <= X"00";
            i_received_data_bit_index <= "000";
            i_received_data_parity_bit <= '0';
        elsif (rising_edge(clk)) then 
            if (i_direction = S_DIR_RECEIVE or (i_direction = S_DIR_IDLE and i_ps2_clk_falling_edge_flag = '1')) then 
                if (i_receive_time_out_counter <= c_receive_time_out_time) then 
                    if (i_ps2_clk_falling_edge_flag = '1') then 
                        case i_data_received_state is
                            when S_REC_IDLE => 
                                if (i_ps2_data = '0') then 
                                    i_data_received_state <= S_REC_BITS;
                                else 
                                    i_data_received_state <= S_REC_ERROR;
                                end if; 
                                i_received_data_buffer <= X"00";
                                i_received_data_bit_index <= "000";
                                i_received_data_parity_bit <= '0';
                            when S_REC_BITS => 
                                i_received_data_buffer(to_integer(i_received_data_bit_index)) <= i_ps2_data; 
                                i_received_data_parity_bit <= i_received_data_parity_bit xor i_ps2_data; 
                                if (i_received_data_bit_index = "111") then 
                                    i_data_received_state <= S_REC_PARITY;
                                else 
                                    i_received_data_bit_index <= i_received_data_bit_index + 1;
                                end if;
                            when S_REC_PARITY => 
                                i_received_data_parity_bit <= i_received_data_parity_bit xor i_ps2_data;
                                if ((i_received_data_parity_bit xor i_ps2_data) = '1') then 
                                    i_data_received_state <= S_REC_STOP;
                                else 
                                    i_data_received_state <= S_REC_ERROR;
                                end if;
                            when S_REC_STOP => 
                                if (i_ps2_data = '1') then 
                                    i_data_received_state <= S_REC_DONE;
                                else 
                                    i_data_received_state <= S_REC_ERROR;
                                end if;
                            when S_REC_DONE => 
                                i_data_received_state <= S_REC_IDLE;
                                i_received_data_buffer <= X"00";
                                i_received_data_bit_index <= "000";
                                i_received_data_parity_bit <= '0';
                            when S_REC_ERROR => 
                                i_data_received_state <= S_REC_IDLE;
                                i_received_data_buffer <= X"00";
                                i_received_data_bit_index <= "000";
                                i_received_data_parity_bit <= '0';
                        end case;
                    else 
                        if ((i_data_received_state = S_REC_DONE) or (i_data_received_state = S_REC_ERROR)) then 
                            i_data_received_state <= S_REC_IDLE;
                            i_received_data_buffer <= X"00";
                            i_received_data_bit_index <= "000";
                            i_received_data_parity_bit <= '0';
                        end if; 
                    end if;
                else 
                    if (i_data_received_state = S_REC_ERROR) then 
                        i_data_received_state <= S_REC_IDLE;
                        i_received_data_buffer <= X"00";
                        i_received_data_bit_index <= "000";
                        i_received_data_parity_bit <= '0';
                    else 
                        i_data_received_state <= S_REC_ERROR;
                    end if;
                end if;
            else
                i_data_received_state <= S_REC_IDLE;
                i_received_data_buffer <= X"00";
                i_received_data_bit_index <= "000";
                i_received_data_parity_bit <= '0';
            end if;
        end if;
    end process;


    -- i_receive_time_out_counter
    process (clk, reset)
    begin
        if (reset = '1') then 
            i_receive_time_out_counter <= (others => '0');
        elsif (rising_edge(clk)) then 
            if (i_direction = S_DIR_RECEIVE or (i_direction = S_DIR_IDLE and i_ps2_clk_falling_edge_flag = '1')) then 
                if (i_ps2_clk_falling_edge_flag = '1') then 
                    i_receive_time_out_counter <= (others => '0');
                elsif (i_receive_time_out_counter <= c_receive_time_out_time) then -- allow one increment past the limit
                    i_receive_time_out_counter <= i_receive_time_out_counter + 1; 
                end if;
            else 
                i_receive_time_out_counter <= (others => '0');
            end if; 
        end if;
    end process;
    
    
    -- received_flag
    -- received_byte
    process (clk, reset)
    begin 
        if (reset = '1') then 
            received_flag <= '0'; 
            received_byte <= X"00"; 
        elsif (rising_edge(clk)) then 
            if (i_data_received_state = S_REC_DONE) then 
                received_flag <= '1'; 
                received_byte <= i_received_data_buffer;
            else 
                received_flag <= '0'; 
            end if;
        end if;
    end process; 




    -- i_send_busy_flag
    -- i_send_data_buffer
    process (clk, reset)
    begin
        if (reset = '1') then 
            i_send_busy_flag <= '0';
            i_send_data_buffer <= X"00";
        elsif (rising_edge(clk)) then 
            if (i_send_busy_flag = '0' and send_flag = '1') then 
                i_send_busy_flag <= '1';
                i_send_data_buffer <= send_byte; 
            elsif (i_data_send_state = S_SEND_DONE) then -- Do not let go if there was an error in sending.
                i_send_busy_flag <= '0';
            end if;
        end if;
    end process;

    send_busy_flag <= i_send_busy_flag;


    -- i_data_send_state
    -- i_send_data_bit_index
    -- i_send_data_parity_bit 
    -- i_send_inhibitor_counter
--    process (clk, reset) 
--    begin 
--        if (reset = '1') then 
--            ps2_clk <= 'Z';
--            ps2_data <= 'Z';
--            i_data_send_state <= S_SEND_IDLE; 
--            i_send_data_bit_index <= "000"; 
--            i_send_data_parity_bit <= '0';
--            i_send_inhibitor_counter <= (others => '0');
--        elsif (rising_edge(clk)) then 
--            if (i_direction = S_DIR_SEND) then 
--                case i_data_send_state is
--                    when S_SEND_IDLE => 
--                        i_data_send_state <= S_SEND_INHIBIT;
--                        i_send_data_bit_index <= "000"; 
--                        i_send_data_parity_bit <= '0';
--                        i_send_inhibitor_counter <= c_send_inhibition_time;
--                        ps2_clk <= '0';
--                    when S_SEND_INHIBIT => 
--                        if (i_send_inhibitor_counter /= to_unsigned(0,15)) then 
--                            i_send_inhibitor_counter <= i_send_inhibitor_counter - 1; 
--                            ps2_clk <= '0';
--                        else 
--                            ps2_clk <= 'Z'; -- Release the ps2_clk 
--                            ps2_data <= '0';
--                            i_data_send_state <= S_SEND_BITS;
--                        end if;
--                    when S_SEND_BITS => 
--                        if (i_ps2_clk_falling_edge_flag = '1') then 
--                            ps2_data <= i_send_data_buffer(to_integer(i_send_data_bit_index)); 
--                            i_send_data_parity_bit <= i_send_data_parity_bit xor i_send_data_buffer(to_integer(i_send_data_bit_index)); 
--                            if (i_send_data_bit_index = "111") then 
--                                i_data_send_state <= S_SEND_PARITY;
--                            else 
--                                i_send_data_bit_index <= i_send_data_bit_index + 1;
--                            end if;
--                        end if;
--                    when S_SEND_PARITY => 
--                        if (i_ps2_clk_falling_edge_flag = '1') then 
--                            ps2_data <= not i_send_data_parity_bit; 
--                            i_data_send_state <= S_SEND_STOP;
--                        end if;
--                    when S_SEND_STOP => 
--                        if (i_ps2_clk_falling_edge_flag = '1') then 
--                            ps2_data <= '1';
--                            i_data_send_state <= S_SEND_PS2_RELEASE;
--                        end if;
--                    when S_SEND_PS2_RELEASE => 
--                        ps2_data <= 'Z'; -- Release ps2_data
--                        i_data_send_state <= S_SEND_ACKNOWLEDGE;
--                    when S_SEND_ACKNOWLEDGE => 
--                        if (i_ps2_clk_falling_edge_flag = '1') then 
--                            if (i_ps2_data = '0') then 
--                                i_data_send_state <= S_SEND_DONE;
--                            else 
--                                i_data_send_state <= S_SEND_ERROR;
--                            end if;
--                        end if;
--                    when S_SEND_DONE => 
--                        i_data_send_state <= S_SEND_IDLE;
--                    when S_SEND_ERROR => 
--                        i_data_send_state <= S_SEND_IDLE;
--                end case;
--            else 
--                ps2_clk <= 'Z';
--                ps2_data <= 'Z';
--                i_data_send_state <= S_SEND_IDLE; 
--                i_send_data_bit_index <= "000"; 
--                i_send_data_parity_bit <= '0';
--                i_send_inhibitor_counter <= (others => '0'); 
--            end if;
--        end if;
--    end process; 
    i_data_send_state <= S_SEND_IDLE;
    i_send_data_bit_index <= "000";
    i_send_data_parity_bit <= '0';
    i_send_inhibitor_counter <= (others => '0');
   
   
    

end Behavioral;




