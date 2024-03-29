Lab 3: Bouncing Ball I

    Program the FPGA to display a "bouncing ball" on a 800x600 Video Graphics Array (VGA) monitor (See Section 9 on VGA Port and Subsection 9.1 on VGA System Timing of the Nexys 4 DDR Reference Manual https://reference.digilentinc.com/reference/programmable-logic/nexys-4-ddr/reference-manual)

    2019-11-03 pull request by Peter Ho with the 800x600@60Hz support for 100MHz clock

1. Create a new RTL project VGAball in Vivado Quick Start

    Create five new source files of file type VHDL called clk_wiz_0, clk_wiz_0_clk_wiz, vga_sync, ball, and vga_top

    Create a new constraint file of file type XDC called vga_top

    Choose Nexys 4 DDR board for the project

    Click 'Finish'

    Click design sources and copy the VHDL code from clk_wiz_0.vhd, clk_wiz_0_clk_wiz.vhd, vga_sync.vhd, ball.vhd, and vga_top.vhd

    Click constraints and copy the code from vga_top.xdc

2. Run synthesis
3. Run implementation and open implemented design
4. Generate bitstream, open hardware manager, and program device

    Click 'Generate Bitstream'

    Click 'Open Hardware Manager' and click 'Open Target' then 'Auto Connect'

    Click 'Program Device' then xc7a100t_0 to download vga_top.bit to the Nexys 4 DDR board

5. Change the size and color of the ball
6. Change the square ball to a round ball
7. Introduce a new signal ball_x_motion to allow the ball to move both horizontally and vertically