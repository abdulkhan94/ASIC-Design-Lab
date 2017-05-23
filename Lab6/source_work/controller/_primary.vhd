library verilog;
use verilog.vl_types.all;
entity controller is
    generic(
        IDLE            : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi0);
        \RX_ENABLE\     : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi1);
        ADDRESS_CHECK   : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi0);
        \ACK_DONE\      : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi1);
        NACK_DONE       : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi0);
        \LOAD_DATA\     : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi1);
        \TX_ENABLE\     : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi0);
        ACK_CHECK       : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi1);
        \READ_ENABLE\   : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi0);
        ACK_COMPLETE    : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi1);
        REC_ACK         : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi1, Hi0);
        REC_NACK        : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        stop_found      : in     vl_logic;
        start_found     : in     vl_logic;
        byte_received   : in     vl_logic;
        ack_prep        : in     vl_logic;
        check_ack       : in     vl_logic;
        ack_done        : in     vl_logic;
        rw_mode         : in     vl_logic;
        address_match   : in     vl_logic;
        sda_in          : in     vl_logic;
        rx_enable       : out    vl_logic;
        tx_enable       : out    vl_logic;
        read_enable     : out    vl_logic;
        sda_mode        : out    vl_logic_vector(1 downto 0);
        load_data       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 2;
    attribute mti_svvh_generic_type of \RX_ENABLE\ : constant is 2;
    attribute mti_svvh_generic_type of ADDRESS_CHECK : constant is 2;
    attribute mti_svvh_generic_type of \ACK_DONE\ : constant is 2;
    attribute mti_svvh_generic_type of NACK_DONE : constant is 2;
    attribute mti_svvh_generic_type of \LOAD_DATA\ : constant is 2;
    attribute mti_svvh_generic_type of \TX_ENABLE\ : constant is 2;
    attribute mti_svvh_generic_type of ACK_CHECK : constant is 2;
    attribute mti_svvh_generic_type of \READ_ENABLE\ : constant is 2;
    attribute mti_svvh_generic_type of ACK_COMPLETE : constant is 2;
    attribute mti_svvh_generic_type of REC_ACK : constant is 2;
    attribute mti_svvh_generic_type of REC_NACK : constant is 2;
end controller;
