package body Data_Package is
  
   protected body data_centre is
      procedure add_bullet(x : Integer; y : Integer; step : Integer; upper_bounce : Integer;
                           lower_bounce : Integer; skip : Integer; up : Boolean; vert : Boolean) is
      begin
         how_many_bullets_registered := how_many_bullets_registered + 1;
         bulletin(how_many_bullets_registered) := check_grid((x,y));
         upper_bounds(how_many_bullets_registered) := check_grid((upper_bounce,0)).X;
         lower_bounds(how_many_bullets_registered) := check_grid((lower_bounce,0)).X;
         steps(how_many_bullets_registered) := step;
         steps_to_skip(how_many_bullets_registered) := skip;
         steps_skipped(how_many_bullets_registered) := 0;
         the_way(how_many_bullets_registered) := up;
         vertical(how_many_bullets_registered) := vert;
      end add_bullet;
      
      procedure add_wall(A, Z : Point_Type) is
      begin
         if A.X = Z.X then
            for i in 1..(abs(A.Y - Z.Y)/32) loop
               walls_number := walls_number + 1;
               if A.Y - Z.Y > 0 then
                  walls(walls_number) := check_grid((A.X,A.Y - i*32));
               else 
                  walls(walls_number) := check_grid((A.X,A.Y + i*32));
               end if;
            end loop;
         elsif A.Y = Z.Y then
              for i in 1..(abs(A.X - Z.X)/32) loop
               walls_number := walls_number + 1;
               if A.X - Z.X > 0 then
                  walls(walls_number) := check_grid((A.X  - i*32,A.Y));
               else 
                  walls(walls_number) := check_grid((A.X  + i*32,A.Y));
               end if;
            end loop;
         else
            null;
         end if;
      end add_wall;
      
      procedure add_win_spot(B : Point_Type) is
      begin
         spots_number := spots_number + 1;
         win_spots(spots_number) := check_grid(B);
         
      end add_win_spot;
      
      function check_grid(B : Point_Type ) return Point_Type is
         
         multiple : Integer := Step*4;
         x : Integer;
         y : Integer;
      begin
         if B.X rem 32 /= 0 then
            x := (((B.X + multiple/2) / multiple) * multiple);
         else 
            x := B.X;
         end if;
         if B.Y rem 32 /= 0 then
            y := (((B.Y + multiple/2) / multiple) * multiple);
         else 
            y := B.Y;
         end if;
         return (x,y);
      end check_grid;  
      
      procedure set_nof_lives(life : Integer) is
      begin 
         lives := life;
         base_lives := life;
      end set_nof_lives;
      
      procedure set_max_level(max : Integer) is
      begin 
         max_level:= max;
      end set_max_level;
      
      procedure add_spawn(B : Point_Type) is
      begin
         spawn := check_grid(B);         
      end add_spawn;
      
      procedure update_player(x : Integer; y : Integer) is
      begin
         player.X := x;
         player.Y := y;
      end update_player;
      
      procedure update_bullets is
         tempoint : Point_Type;
      begin
         if how_many_bullets_registered = 0 then
            null;
         else
            for i in 1..how_many_bullets_registered
            loop
               if steps_skipped(i) = steps_to_skip(i) then
                  steps_skipped(i) := 0;
                  tempoint := bulletin(i);
                  if the_way(i) and  vertical(i) then
                     
                     if tempoint.Y + steps(i) > upper_bounds(i) then
                        the_way(i) := False;
                        bulletin(i).Y := bulletin(i).Y - steps(i);
                     else
                        bulletin(i).Y := bulletin(i).Y + steps(i);
                     end if;
                  elsif not the_way(i) and  vertical(i) then
                     if tempoint.Y - steps(i) < lower_bounds(i) then
                        the_way(i) := True;
                        bulletin(i).Y := bulletin(i).Y + steps(i);
                     else
                        bulletin(i).Y := bulletin(i).Y - steps(i);
                     end if;
                  elsif the_way(i) and not vertical(i) then
                     if tempoint.X + steps(i) > upper_bounds(i) then
                        the_way(i) := False;
                        bulletin(i).X := bulletin(i).X - steps(i);
                     else
                        bulletin(i).X := bulletin(i).X + steps(i);
                     end if;
                  else
                     if tempoint.X - steps(i) < lower_bounds(i) then
                        the_way(i) := True;
                        bulletin(i).X := bulletin(i).X + steps(i);
                     else
                        bulletin(i).X := bulletin(i).X - steps(i);
                     end if;
                  end if;
               else
                  steps_skipped(i) := steps_skipped(i) + 1;
               end if;
            end loop;
         end if;
      end update_bullets;
      
      procedure Reset_Level is
      begin
         player := spawn;
      end Reset_Level;
    
      
      -- na pewno dziala dobrze
      procedure check_colisions is
         lower_left_corner, upper_right_corner,i : Point_Type;
        
      begin
         lower_left_corner := ((player.X - player_size/2),(player.Y - player_size/2));
         upper_right_corner := ((player.X + player_size/2),(player.Y + player_size/2));         
         
         reset := False;
         redraw_hearts := False;
         if lives <=0 then
            reset := True;
         end if;
         for j in 1..how_many_bullets_registered
         loop
            i := bulletin(j);
            if Inside(i,lower_left_corner,upper_right_corner) then
            

               if lives > 0 then
                  lives := lives - 1;
                  redraw_hearts := True;
                  pragma Warnings(Off);
                  logwriter_task.write(To_Unbounded_String("Player Died, lives left:" & lives'Image));
                  Reset_Level; 
               else
                  
                  reset := True;
                   
               end if;
               exit;
            end if;
         end loop;  
      end check_colisions;
      
      function get_lives return Integer is       
         response : Integer;
      begin 
         response := lives;
         return response;
      end get_lives;
      
     
      
      function get_level return Integer is       
         response : Integer;
      begin 
         response := level;
         return response;
      end get_level;
      
      function get_redraw_hearts return Boolean is       
         response : Boolean;
      begin 
         response := redraw_hearts;
         return response;
      end get_redraw_hearts;
      
      function get_reset return Boolean is       
         response : Boolean;
      begin 
         response := reset;
         return response;
      end get_reset;
      
      function get_player_position return Point_Type is
         response : Point_Type;
      begin
         response := player;
         return response;
      end get_player_position;
      
      
      function get_bullets return f_dr_info is
         response : f_dr_info;
      begin
         response.many := how_many_bullets_registered;
         response.bulle := bulletin;
         return response;
      end get_bullets;
      
      procedure check_victory is         
      begin
         for i in 1..spots_number
         loop 
          
           if (player.X < win_spots(i).X + win_spot_size and player.X > win_spots(i).X - player_size
               and player.Y < win_spots(i).Y + win_spot_size and player.Y > win_spots(i).Y - player_size) then
               
               
               if level + 1 = 2 then
                  Draw_Image(C,(0,0),Image(Easy));
                  pragma Warnings(Off);
                  delay 1.5;
               end if;
               if level + 1 = 3 then
                  Draw_Image(C,(0,0),Image(Harder));
                  pragma Warnings(Off);
                  delay 1.5;       
               end if;
               if level + 1 > max_level then
                  Draw_Image(C,(0,0),Image(YouWon));
                  pragma Warnings(Off);
                  logwriter_task.write(To_Unbounded_String("Player passed the game."));

                  delay 1.5;      
                  logwriter_task.stop;
                  GNAT.OS_Lib.OS_Exit (0);
               end if;    
               exit;
            end if;
      end loop;

      end check_victory;  
      
      
      function change_level return Boolean is   
         won : Boolean;
         tmp : Integer;
      begin
         won := False;
         
         for i in 1 .. spots_number
         loop 
            if skip_level_now then
               won := True;               
               skip_level_now := False;
            elsif player.X < win_spots(i).X + win_spot_size and player.X > win_spots(i).X - player_size
              and player.Y < win_spots(i).Y + win_spot_size and player.Y > win_spots(i).Y - player_size then
               tmp := level + 1;
               logwriter_task.write(To_Unbounded_String("Changing level to" & tmp'Image));
               won := True;
               exit;
            end if;
         end loop;
         return won;
      end change_level; 
      
     
      
      procedure clear is
      begin
         walls_number := 0;
         how_many_bullets_registered := 0;
         spots_number := 0;
      end clear;      
      
      
      procedure set_level(lev : integer) is
      begin
         if lev = 0 then
            level := level + 1;
         else
            level := lev;
         end if;
      end set_level;
      
      function get_spots return f_dr_info is
         response : f_dr_info;
      begin
         response.bulle := win_spots;
         response.many := spots_number;
         return response;
      end get_spots;
      
      function get_walls return f_dr_info is
         response : f_dr_info;
      begin
         response.bulle := walls;
         response.many := walls_number;
         return response;
      end get_walls;
      
      function get_spawn return Point_Type is
      begin
         return spawn;
      end get_spawn;
      
      function check_walls(x, y : Integer) return Boolean is           
         lower_left_corner, upper_right_corner,i : Point_Type;         
      begin
        
         lower_left_corner := ((player.X - player_size+step/2 + x),(player.Y - player_size+step/2 + y));
         upper_right_corner := ((player.X + player_size-step/2 + x ),(player.Y + player_size-step/2 + y));         
         
         
         for j in 1..walls_number
         loop
            i := walls(j);
            if Inside(i,lower_left_corner,upper_right_corner) then
               return False;
               exit;
            end if;
               
         
         end loop;  
         return True;   
      end check_walls;
      -- Admin procedures
--        procedure skip_level is
--        begin
--           level := level+1;
--           skip_level_now := True;
--           check_victory;
--        end skip_level;
      
--         procedure sepuku is
--        begin
--           lives := 0;
--           check_colisions;
--        end sepuku; 
   end data_centre;

end Data_Package;
