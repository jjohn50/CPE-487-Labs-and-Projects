LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ball IS
  PORT (
  v_sync : IN STD_LOGIC;
  pixel_row : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  pixel_col : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  red : OUT STD_LOGIC;
  green : OUT STD_LOGIC;
  blue : OUT STD_LOGIC
 );
END ball;

ARCHITECTURE Behavioral OF ball IS
 CONSTANT size : INTEGER := 16;
 SIGNAL ball_on : STD_LOGIC; -- indicates whether ball is over current pixel position
 -- current ball position - intitialized to center of screen
 SIGNAL ball_x : STD_LOGIC_VECTOR(9 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(320, 10);
 SIGNAL ball_y : STD_LOGIC_VECTOR(9 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(240, 10);
 -- current ball motion - initialized to +4 pixels/frame
 SIGNAL ball_y_motion : STD_LOGIC_VECTOR(9 DOWNTO 0) := "0000000100";
    SIGNAL ball_x_motion : STD_LOGIC_VECTOR(9 DOWNTO 0) := "0000000100";
    
BEGIN
 red <= '1'; -- color setup for red ball on white background
 green <= NOT ball_on;
 blue <= NOT ball_on;
 -- process to draw ball current pixel address is covered by ball position
 bdraw : PROCESS (ball_x, ball_y, pixel_row, pixel_col) IS
 BEGIN
-- Checks to see if pixel coords are within the circle
    IF ((((CONV_INTEGER(pixel_col)- CONV_INTEGER(ball_x)) * 
    (CONV_INTEGER(pixel_col) - CONV_INTEGER(ball_x))) +
    ((CONV_INTEGER(pixel_row) - CONV_INTEGER(ball_y)) * 
    (CONV_INTEGER(pixel_row) - CONV_INTEGER(ball_y)))) <= (size*size) )THEN
            ball_on <= '1';
     ELSE
        ball_on <= '0';
        END IF;

END PROCESS;
   -- process to move ball once every frame (i.e. once every vsync pulse)
  mball : PROCESS
  BEGIN
   WAIT UNTIL rising_edge(v_sync);
   -- allow for bounce off top or bottom of screen
   IF ball_y + size >= 480 THEN
    ball_y_motion <= "1111111100"; -- -4 pixels
   ELSIF ball_y <= size THEN
    ball_y_motion <= "0000000100"; -- +4 pixels
   END IF;
   
-- x-direction motion and edge bouncing
   IF ball_x + size >= 640 THEN
    ball_x_motion <= "1111111100"; -- -4 pixels
   ELSIF ball_x <= size THEN
    ball_x_motion <= "0000000100"; -- +4 pixels
   END IF;
   
   ball_y <= ball_y + ball_y_motion; -- compute next ball position
   ball_x <= ball_x + ball_x_motion; -- compute next ball position

  END PROCESS;
END Behavioral;