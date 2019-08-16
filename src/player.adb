package body player is
      
   task body player_task is   
      
      temporary : Point_Type;
      Player_X, Player_Y, W, H : Integer;
      endtask : Exception;
      procedure updatePosition is  
      begin    
         data_centre.update_player(Player_X,Player_Y);
         draw_canvas_task.drawshrek;
      end updatePosition;
      
      procedure updatePS is
      begin
         temporary := data_centre.get_player_position;
         Player_X := temporary.X;
         Player_Y := temporary.Y;
      end updatePS;
      
    
      
      way_of_move : Character;
   begin  
      accept start;
      while Valid(F) loop
         select 
            
            accept stop;
            exit; 
         ELSE
            W := Get_Width(C);
            H := Get_Height(C);
            data_centre.check_colisions;
            
            way_of_move := Key_Code(C);
            
            
            if not data_centre.get_redraw_hearts then
            updatePS;
            case way_of_move is
            when 'A' | 'a' =>
               if Player_X - step  >= 0 and then data_centre.check_walls(-step, 0) then
                  Player_X := Player_X - Step;
                  updatePosition;
               end if;
            when 'D' | 'd' =>
               if Player_X + player_size + step <= W  and then data_centre.check_walls(step, 0) then
                  Player_X := Player_X + Step;
                  updatePosition;
               end if;
            when 'W' | 'w' =>
               if Player_Y - step >= 0 and then data_centre.check_walls(0,-step) then
                  Player_Y := Player_Y - Step;
                  updatePosition;
               end if;
            when 'S' | 's' =>
               if Player_Y + Step + player_size  <= H and then data_centre.check_walls(0,step) then
                  Player_Y := Player_Y + Step;
                  updatePosition;
               end if;   
               
               when 'X' | 'x' =>    
               logwriter_task.stop;
               Close(F);
               raise endtask; 
--              when 'L' | 'l' =>
--                    data_centre.sepuku;                  
--                 when 'K' | 'k' =>
--                    logwriter_task.write(To_Unbounded_String("Changing level to"));
--                    data_centre.skip_level;

               when others =>
                  null;
            
               
                       
               end case;
            else             
               draw_canvas_task.drawhearts;
         end if;
         end select;
    
      end loop;
      
   exception      
      when endtask =>
         logwriter_task.stop;
         GNAT.OS_Lib.OS_Exit(0);
      when E: others => 
         logwriter_task.write(To_Unbounded_String(Exception_Name (E)&" in player: "&Exception_Message(E)));         
         logwriter_task.stop;
         GNAT.OS_Lib.OS_Exit(0);
   end player_task;
end player;
