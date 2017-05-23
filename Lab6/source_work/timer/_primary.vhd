library verilog;
use verilog.vl_types.all;
entity timer is
    generic(
        IDLE            : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi0);
        CNT             : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi1);
        RECEIVE         : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi0);
        PREP            : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi1);
        CHECK           : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi0);
        COMPLETE        : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        rising_edge_found: in     vl_logic;
        falling_edge_found: in     vl_logic;
        stop_found      : in     vl_logic;
        start_found     : in     vl_logic;
        byte_received   : out    vl_logic;
        ack_prep        : out    vl_logic;
        check_ack       : out    vl_logic;
        ack_done        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 2;
    attribute mti_svvh_generic_type of CNT : constant is 2;
    attribute mti_svvh_generic_type of RECEIVE : constant is 2;
    attribute mti_svvh_generic_type of PREP : constant is 2;
    attribute mti_svvh_generic_type of CHECK : constant is 2;
    attribute mti_svvh_generic_type of COMPLETE : constant is 2;
end timer;
