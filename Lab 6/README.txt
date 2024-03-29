Lab 6: Video Game "PONG"

    Extend the FPGA code developed in Lab 3 (Bouncing Ball) to build a PONG game using a 800x600 Video Graphics Array (VGA) display and a potentiometer with an analog-to-digital converter called Pmod ADC connected to the top pins of the Pmod port JA (See Section 11 of the reference manual https://reference.digilentinc.com/reference/programmable-logic/nexys-4-ddr/reference-manual)

    2019-11-15 pull request by Peter Ho with the 800x600@60Hz support for 100MHz clock

1. Create a new RTL project Pong in Vivado Quick Start

    Create six new source files of file type VHDL called clk_wiz_0, clk_wiz_0_clk_wiz, vga_sync, bat_n_ball, adc_if, and pong

    Create a new constraint file of file type XDC called pong

    Choose Nexys 4 DDR board for the project

    Click 'Finish'

    Click design sources and copy the VHDL code from clk_wiz_0, clk_wiz_0_clk_wiz, vga_sync.vhd, bat_n_ball.vhd, adc_if.vhd, pong.vhd

    Click constraints and copy the code from pong.xdc  

2. Run synthesis
3. Run implementation and open implemented design
4. Generate bitstream, open hardware manager, and program device

    Click 'Generate Bitstream'

    Click 'Open Hardware Manager' and click 'Open Target' then 'Auto Connect'

    Click 'Program Device' then xc7a100t_0 to download pong.bit to the Nexys 4 DDR board

    Push BTNC to start the bouncing ball and use the bat to keep the ball in play

5. Change ball speed

    The ball speed is currently 6 pixels per video frame

    Use the slide switches on the Nexys 4 DDR board to program the ball speed in the range of 1-32 pixels per frame

    Avoid setting the speed to zero as the ball will then never reach the bat or wall

    See how fast to move the ball and still keep it in play

6. Change bat width

    Double the width of the bat to make the game really easy

    Modify the code so that the bat width decreases one pixel each time successfully hitting the ball and then resets to starting width when missing the ball

    See how many times hitting the ball in a row as the bat slowly shrinks

    Count the number of successful hits after each serve and display the count in binary on the LEDs on the Nexys 4 DDR board
