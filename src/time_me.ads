with JEWL.Simple_Windows; use JEWL.Simple_Windows;
with draw_canvas; use draw_canvas;
with system;
with Ada.Exceptions; use Ada.Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with logwriter; use logwriter;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
package Time_me is
 
   task time_me_task is -- can put entry points and stuff in here
      pragma Priority (System.Default_Priority);
      entry start;
      entry stop;
   end time_me_task;
end Time_me;
