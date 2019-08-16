
package body check_bullets is
   period : constant Duration := 0.1;
   due_date : Time;
   collided : Boolean := False;
   
   
   task body check_bullets_task is   
   begin
         accept start;
         due_date := period + Clock;
         loop
            select 
               accept stop;
               exit; 
            ELSE
               delay until due_date;
               due_date := due_date + period;
               data_centre.update_bullets;
               draw_canvas_task.drawshrek; 
            end select;
         end loop;
   exception
      when E: others => 
         logwriter_task.write(To_Unbounded_String(Exception_Name (E)&" in check bullets: "&Exception_Message(E)));
         logwriter_task.stop;
         GNAT.OS_Lib.OS_Exit(0);
   end check_bullets_task;
   

end check_bullets;
