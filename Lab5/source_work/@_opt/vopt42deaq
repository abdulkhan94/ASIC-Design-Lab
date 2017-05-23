library verilog;
use verilog.vl_types.all;
entity rcu is
    generic(
        idle            : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        packet_complete : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        sbc             : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        stop_check      : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        load            : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        start_bit_detected: in     vl_logic;
        packet_done     : in     vl_logic;
        framing_error   : in     vl_logic;
        sbc_clear       : out    vl_logic;
        sbc_enable      : out    vl_logic;
        load_buffer     : out    vl_logic;
        enable_timer    : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of idle : constant is 2;
    attribute mti_svvh_generic_type of packet_complete : constant is 2;
    attribute mti_svvh_generic_type of sbc : constant is 2;
    attribute mti_svvh_generic_type of stop_check : constant is 2;
    attribute mti_svvh_generic_type of load : constant is 2;
end rcu;
