with System;
with GNAT.OS_Lib;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Exceptions; use Ada.Exceptions;
with draw_canvas; use draw_canvas;
with Data_Package; use Data_Package;
with logwriter; use logwriter;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
package check_bullets is

   task check_bullets_task is
      pragma Priority (System.Default_Priority + 1);
      entry start;
      entry stop;
   end check_bullets_task;

end check_bullets;
