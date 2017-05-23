library verilog;
use verilog.vl_types.all;
entity top_level is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        buffer_load     : in     vl_logic;
        w_load_size     : in     vl_logic_vector(31 downto 0);
        sample1         : in     vl_logic_vector(15 downto 0);
        sample2         : in     vl_logic_vector(15 downto 0);
        sample3         : in     vl_logic_vector(15 downto 0);
        sample4         : in     vl_logic_vector(15 downto 0);
        sample5         : in     vl_logic_vector(15 downto 0);
        sample6         : in     vl_logic_vector(15 downto 0);
        sample7         : in     vl_logic_vector(15 downto 0);
        sample8         : in     vl_logic_vector(15 downto 0);
        w_output_load   : out    vl_logic;
        w_wav_done      : out    vl_logic;
        data_out1       : out    vl_logic_vector(15 downto 0);
        data_out2       : out    vl_logic_vector(15 downto 0);
        data_out3       : out    vl_logic_vector(15 downto 0);
        data_out4       : out    vl_logic_vector(15 downto 0);
        data_out5       : out    vl_logic_vector(15 downto 0);
        data_out6       : out    vl_logic_vector(15 downto 0);
        data_out7       : out    vl_logic_vector(15 downto 0);
        data_out8       : out    vl_logic_vector(15 downto 0)
    );
end top_level;
