	component cordic_block is
		port (
			a      : in  std_logic_vector(34 downto 0) := (others => 'X'); -- a
			areset : in  std_logic                     := 'X';             -- reset
			c      : out std_logic_vector(33 downto 0);                    -- c
			clk    : in  std_logic                     := 'X';             -- clk
			s      : out std_logic_vector(33 downto 0)                     -- s
		);
	end component cordic_block;

	u0 : component cordic_block
		port map (
			a      => CONNECTED_TO_a,      --      a.a
			areset => CONNECTED_TO_areset, -- areset.reset
			c      => CONNECTED_TO_c,      --      c.c
			clk    => CONNECTED_TO_clk,    --    clk.clk
			s      => CONNECTED_TO_s       --      s.s
		);

