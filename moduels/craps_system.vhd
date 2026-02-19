library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity craps_system is
    port (
        clk        : in  std_logic;
        reset_btn  : in  std_logic;
        roll_btn   : in  std_logic;
        seg_die1   : out std_logic_vector(6 downto 0);
        seg_die2   : out std_logic_vector(6 downto 0);
        win_led    : out std_logic;
        lose_led   : out std_logic
    );
end craps_system;

architecture structural of craps_system is
    signal die1_val, die2_val : unsigned(2 downto 0);
    signal sum                : unsigned(3 downto 0);
    signal point              : unsigned(3 downto 0);
    signal d7, d711, d2312    : std_logic;
    signal eq                 : std_logic;
    signal roll, sp, win, lose : std_logic;
    signal show: std_logic;

    signal clk5    : std_logic := '0';
    signal div_cnt : unsigned(2 downto 0) := "000";
    signal seg1_int, seg2_int : std_logic_vector(6 downto 0);

begin

    clk_div_process : process(clk, reset_btn)
    begin
        if reset_btn = '1' then
            div_cnt <= "000";
            clk5    <= '0';
        elsif rising_edge(clk) then
            if div_cnt = "100" then
                div_cnt <= "000";
                clk5    <= not clk5;
            else
                div_cnt <= div_cnt + 1;
            end if;
        end if;
    end process;

    die1 : entity work.dice_counter
        port map (
            clk => clk,
            rst => reset_btn,
            en  => roll,
            q   => die1_val
        );

    die2 : entity work.dice_counter
        port map (
            clk => clk5,
            rst => reset_btn,
            en  => roll,
            q   => die2_val
        );

    add : entity work.adder
        port map (
            a => die1_val,
            b => die2_val,
            s => sum
        );
    point_reg : entity work.point_register
        port map (
            clk => clk,
            rst => reset_btn,
            en  => sp,
            d   => sum,
            q   => point
        );
    comp : entity work.comparator
        port map (
            a  => sum,
            b  => point,
            eq => eq
        );
    test : entity work.test_logic
        port map (
            sum   => sum,
            d7    => d7,
            d711  => d711,
            d2312 => d2312
        );
    ctrl : entity work.controller_fsm
        port map (
            clk      => clk,
            reset    => reset_btn,
            roll_btn => roll_btn,
            d7       => d7,
            d711     => d711,
            d2312    => d2312,
            eq       => eq,
            roll     => roll,
            sp       => sp,
            win      => win,
            lose     => lose,
            show     => show
        );
    win_led  <= win;
    lose_led <= lose;
    
    seg1 : entity work.seven_seg
        port map ( d => die1_val, seg => seg1_int );
    seg2 : entity work.seven_seg
        port map ( d => die2_val, seg => seg2_int );

    seg_die1 <= (others => '0') when show = '0' else seg1_int;
    seg_die2 <= (others => '0') when show = '0' else seg2_int;

end structural;
