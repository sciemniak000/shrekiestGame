with Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
with JEWL.Simple_Windows; use JEWL.Simple_Windows;
with Ada.Calendar; use Ada.Calendar;
with Data_Package; use Data_Package;
with GNAT.OS_Lib;
with levels; use levels;
with System;
with logwriter; use logwriter;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
package draw_canvas is      
  
   

   TimerLabel : Label_Type := Label(F,(0,Get_Height(C)+40),50,20,"Timer:",Left);
   TimerColon : Label_Type := Label(F,(90,Get_Height(C)+40),20,20,":",Left);
   Timer_Label_Min : Label_Type := Label(F,(45,Get_Height(C)+40),20,20,"0",Left);
   Timer_Label_Sec : Label_Type := Label(F,(80,Get_Height(C)+40),20,20,"0",Left);

   



   task draw_canvas_task is
      pragma Priority (System.Default_Priority + 3);
      entry draw_info;
      entry drawshrek;
      entry drawhearts;
      entry start;
      entry stop;
   end draw_canvas_task;
   
end draw_canvas;
