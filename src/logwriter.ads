with  Ada.Text_Io, Ada.Integer_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with System;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Calendar.Time_Zones; use Ada.Calendar.Time_Zones;
with Ada.Text_Io; use Ada.Text_Io;
 
package logwriter is

      task logwriter_task is
      pragma Priority (System.Default_Priority + 1);
      entry start;
      entry stop;
      entry write(mes : in Unbounded_String);
      end logwriter_task;
     

end logwriter;
