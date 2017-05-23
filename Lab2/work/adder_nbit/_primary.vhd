library verilog;
use verilog.vl_types.all;
entity adder_nbit is
    generic(
        num             : integer := 4
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        carry_in        : in     vl_logic;
        sum             : out    vl_logic_vector;
        overflow        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of num : constant is 1;
end adder_nbit;
