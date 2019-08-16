with Data_Package; use Data_Package;
with draw_canvas; use draw_canvas; 
with Data_Package; use Data_Package;
with check_bullets; use check_bullets;
with player; use player;
with Time_me; use time_me;
with JEWL.Simple_Windows; use JEWL.Simple_Windows;
with Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO;
with logwriter; use logwriter;
procedure main is 
begin     
   logwriter_task.start;
   data_centre.set_max_level(3);
   data_centre.set_nof_lives(10);
   draw_canvas_task.draw_info;
   while(Key_Code(C) /= 'o' and Key_Code(C) /= 'O') loop
      delay 0.5;
   end loop;   
   player_task.start; 
   check_bullets_task.start;
   time_me_task.start;
   draw_canvas_task.start;   
   
end main;
