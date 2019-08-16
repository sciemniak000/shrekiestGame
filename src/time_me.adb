package body Time_me is
   
   task body time_me_task is
      min,sec: Integer := 0;
     
   begin 
      accept start;
      loop
         select 
            accept stop;
            exit; 
         ELSE
            sec := sec + 1;
            if sec > 60 then
               sec := 0;
               min := min + 1;
            end if;
            delay 1.0;  
            set_text(Timer_Label_Sec, Integer'Image(sec));
            set_text(Timer_Label_Min, Integer'Image(min));
         end select;
      end loop;
   exception
      when E: others => 
         logwriter_task.write(To_Unbounded_String(Exception_Name (E)&" in time_me: "&Exception_Message(E)));

         logwriter_task.stop;
         GNAT.OS_Lib.OS_Exit(0);
   end time_me_task;
   
end Time_me;
