with Data_Package; use Data_Package;
with Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
with JEWL.Simple_Windows; use JEWL.Simple_Windows;
with Ada.Calendar; use Ada.Calendar;
with Data_Package; use Data_Package;
with logwriter; use logwriter;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
package levels is

   procedure change_to_level(level : Integer);
   procedure restart_game;

end levels;
