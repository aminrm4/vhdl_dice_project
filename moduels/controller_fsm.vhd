library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller_fsm is
    port(
        clk      : in  std_logic;
        reset    : in  std_logic;
        roll_btn : in  std_logic;
        d7       : in  std_logic;
        d711     : in  std_logic;
        d2312    : in  std_logic;
        eq       : in  std_logic;
        roll     : out std_logic;
        sp       : out std_logic;
        win      : out std_logic;
        lose     : out std_logic;
        show     : out std_logic
    );
end controller_fsm;

architecture behavioral of controller_fsm is
    
    type state_t is (
        reset_state,
        roll_come_out,
        eval_come_out,
        store_point,
        idle_point,
        roll_point,
        eval_point,
        win_state,
        lose_state
    );

    signal state, next_state : state_t;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= reset_state;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    process(state, roll_btn, d7, d711, d2312, eq)
    begin
        case state is
            when reset_state =>
                if roll_btn = '0' then
                    next_state <= reset_state;
                else
                    next_state <= roll_come_out;
                end if;

            when roll_come_out =>
                if roll_btn = '1' then
                    next_state <= roll_come_out;
                else
                    next_state <= eval_come_out;
                end if;

            when eval_come_out =>
                if d711 = '1' then
                    next_state <= win_state;
                elsif d2312 = '1' then
                    next_state <= lose_state;
                else
                    next_state <= store_point;
                end if;

            when store_point =>
                next_state <= idle_point;

            when idle_point =>
                if roll_btn = '0' then
                    next_state <= idle_point;
                else
                    next_state <= roll_point;
                end if;

            when roll_point =>
                if roll_btn = '1' then
                    next_state <= roll_point;
                else
                    next_state <= eval_point;
                end if;

            when eval_point =>
                if eq = '1' then
                    next_state <= win_state;
                elsif d7 = '1' then
                    next_state <= lose_state;
                else
                    next_state <= idle_point;
                end if;

            when win_state =>
                next_state <= win_state;

            when lose_state =>
                next_state <= lose_state;
        end case;
    end process;

    process(state)
    begin
        roll <= '0';
        sp   <= '0';
        win  <= '0';
        lose <= '0';
        show <= '0';

        case state is
            when reset_state =>
                show <= '1';
            when roll_come_out | roll_point =>
                roll <= '1';
            when eval_come_out | eval_point =>
                show <= '1';
            when store_point =>
                sp <= '1';
            when idle_point =>
                null;
            when win_state =>
                win  <= '1';
                show <= '1';
            when lose_state =>
                lose <= '1';
                show <= '1';
        end case;
    end process;

end behavioral;

