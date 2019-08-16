with JEWL.Simple_Windows; use JEWL.Simple_Windows;
with GNAT.OS_Lib; use GNAT.OS_Lib;
with Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO;
with logwriter; use logwriter;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
package Data_Package is
   -- array types required in protected object
   type point_arr is array (1..100) of Point_Type;
   type arno is array(1..50) of Integer;
   type bolesny_upadek is array(1..50) of Boolean;
   Background : constant String := "assets/background.bmp";
   Shrek : constant String := "assets/sh2rek.bmp";  
   YouDied : constant String := "assets/youdied.bmp";  
   YouWon : constant String := "assets/youwon.bmp";  
   GetReady : constant String := "assets/getready.bmp"; 
   TryAgain : constant String := "assets/tryagain.bmp";  
   Harder : constant String := "assets/harder.bmp"; 
   Easy : constant String := "assets/easy.bmp";  
   onions : constant String := "assets/o3nion.bmp";
   Heart : constant String := "assets/heart.bmp";
   MadeBy : constant String := "assets/madeby.bmp";

   
   F : Frame_Type  := Frame (660, 740, "The Shrekiest Game In The World", 'Q');
   Gui : Canvas_Type := Canvas (F, (0,0), 640, 40, 'X', 'X');
   C : Canvas_Type := Canvas (F, (0,40), 640, 640, 'X', 'X');
   player_size : Integer := 32;
   win_spot_size : Integer := player_size;
   spawn_size : Integer := player_size;
   bullet_size : Integer := 16;
   Step : Integer := 8;    
   base_lives : Integer;
   skip_level_now : Boolean := False;

   type f_dr_info is record 
      bulle : point_arr;
      many : integer;
   end record;
   
   protected data_centre is
      
      procedure update_bullets;
      procedure update_player(x,y : Integer);
      procedure add_bullet(x : Integer; y : Integer; step : Integer; upper_bounce : Integer;
                           lower_bounce : Integer; skip : Integer; up : Boolean; vert : Boolean);
      procedure add_wall(A, Z : Point_Type);
      procedure add_win_spot(B : Point_Type);
      procedure add_spawn(B : Point_Type);
      procedure set_nof_lives(life : Integer);
      --procedure sepuku;
      procedure check_colisions;
      procedure Reset_level;
      procedure set_max_level(max : Integer);
      function get_redraw_hearts return Boolean;
      function get_reset return Boolean;
      function get_level return Integer;
      function get_lives return Integer;
      function get_player_position return Point_Type;
      function get_bullets return f_dr_info;
      function get_spawn return Point_Type;
      function get_spots return f_dr_info;
      function get_walls return f_dr_info;
      function change_level return Boolean;
      function check_grid(B : Point_Type) return Point_Type;
      function check_walls(x, y : Integer) return Boolean;
      procedure check_victory;
      procedure clear;
      procedure set_level(lev : integer);
      -- procedure skip_level;
   private
      reset : Boolean;
      redraw_hearts : Boolean;
      max_level : Integer;
      level : Integer := 1;      
      lives : Integer;
      player : Point_Type := (0,0);
      bulletin : point_arr;
      how_many_bullets_registered : Integer := 0;
      upper_bounds : arno;
      lower_bounds : arno;
      steps : arno;
      steps_to_skip : arno;
      steps_skipped : arno;
      the_way : bolesny_upadek;
      vertical: bolesny_upadek;
      win_spots : point_arr;
      walls : point_arr;
      walls_number : Integer;
      spots_number : Integer;
      spawn : Point_Type;
   end data_centre;
   

end Data_Package;
