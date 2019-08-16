with draw_canvas; use draw_canvas;
with JEWL.Simple_Windows; use JEWL.Simple_Windows;
with Data_Package; use Data_Package;
with check_bullets; use check_bullets;
with GNAT.OS_Lib;
with System;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
with logwriter; use logwriter;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
package player is
   
   task player_task is
      pragma Priority (System.Default_Priority + 2);
      entry start;
      entry stop;
   end player_task;
     
end player;
