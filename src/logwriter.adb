

package body logwriter is

   task body logwriter_task is
      
      F    : Ada.Text_IO.File_Type;
      mes : Unbounded_String;
      Now : Time := Clock;

      begin
      accept start;
      Create(F, Ada.Text_IO.Out_File, "log.txt");
      Unbounded_IO.Put_Line(F, To_Unbounded_String("[" & Image(Date => Now, Time_Zone => 60) & "]: " & "Starting log..."));
      loop
         select
            accept stop;
            Unbounded_IO.Put_Line(F, To_Unbounded_String("[" & Image(Date => Now, Time_Zone => 60) & "]: " & "Closing log file."));
            Close(F);
         or
         
            accept write(mes : in Unbounded_String) do               
            Unbounded_IO.Put_Line(F, "[" & Image(Date => Now, Time_Zone => 60) & "]: " & mes  );
         end write;
         end select;
      
      end loop;
      
      
   end logwriter_task;

end logwriter;
