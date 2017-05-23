library verilog;
use verilog.vl_types.all;
entity flex_counter_NUM_CNT_BITS10_DW01_sub_1 is
    port(
        A               : in     vl_logic_vector(9 downto 0);
        B               : in     vl_logic_vector(9 downto 0);
        CI              : in     vl_logic;
        DIFF            : out    vl_logic_vector(9 downto 0);
        CO              : out    vl_logic
    );
end flex_counter_NUM_CNT_BITS10_DW01_sub_1;
