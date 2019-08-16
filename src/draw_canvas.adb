
package body draw_canvas is


   task body draw_canvas_task is

   
      function Exists(File_Name : in String) return Boolean is 
         F      : File_Type; 
         Answer : Boolean := True; 
      begin 
         begin 
            Open(F, In_File, File_Name); 
            
            Close(F);
         exception 
            when Name_Error => Answer := False; 
         end; 
         return Answer; 
      end Exists; 
      
     
      procedure Shrek_Recipe is
         B : Point_Type;
      begin
         B := data_centre.get_player_position;
         if Exists(Shrek) then
            Draw_Image(C,B,Image(Shrek));
         else
            Set_Fill(C,Blue);
            Draw_Rectangle(C,B,player_size,player_size);
         end if;
      end Shrek_Recipe;
      
       
      procedure Onions_Recipe is
         to_draw : f_dr_info;
         bulleten : point_arr;
         temporary : Point_Type;
         how_many : integer;
      begin
         to_draw := data_centre.get_bullets;
         how_many := to_draw.many;
         bulleten := to_draw.bulle;
         if Exists(onions) then
            for i in 1..how_many
            loop
               temporary := bulleten(i);
               Draw_Image(C,(temporary.X,temporary.Y),Image(onions));
            end loop;
         else
            Set_Fill(C,Red);
            for i in 1..how_many
            loop
               
               temporary := bulleten(i);
                                

               Draw_Circle(C,(temporary.X+16,temporary.Y+16),bullet_size/2);
            end loop;
         end if;
      end Onions_Recipe;
      
      procedure Spawn_Recipe is   
         spawn : Point_Type;
      begin
         spawn := data_centre.get_spawn;
         
         Set_Fill(C,Yellow);        
         Draw_Rectangle(C,spawn,spawn_size,spawn_size);
           
      end Spawn_Recipe;
      
      
      procedure win_spots_recipe is  
         spots : f_dr_info;
         spots_loc : point_arr;
         spots_num : Integer;
      begin
         spots := data_centre.get_spots;
         spots_loc := spots.bulle;
         spots_num := spots.many;
         Set_Fill(C,Green);
         for i in 1..spots_num loop
            Draw_Rectangle(C,spots_loc(i),win_spot_size,win_spot_size);
         end loop;
      end win_spots_recipe;
      
      procedure Walls_Recipe is  
         walls : f_dr_info;
         walls_loc : point_arr;
         walls_num : Integer;
      begin
         walls := data_centre.get_walls;
         walls_loc := walls.bulle;
         walls_num := walls.many;
         Set_Fill(C,Black);
         for i in 1..walls_num loop
            Draw_Rectangle(C,walls_loc(i),32,32);
         end loop;
      end Walls_Recipe;
     
      procedure Background_Recipe is
      begin
         if data_centre.get_level = 3 then
            
            if Exists(Background) then
               Set_Color(C,(212,238,238));
               Draw_Image(C,(0,0),Image(Background));    
               Draw_Image(C,(0,0),Image(MadeBy)); 

            end if;
            Win_Spots_Recipe;
            Walls_Recipe;
            Spawn_Recipe;
            Save(C);
         else
            if Exists(Background) then
               Set_Color(C,(212,238,238));
               Draw_Image(C,(0,0),Image(Background));        

            end if;
            Win_Spots_Recipe;
            Walls_Recipe;
            Spawn_Recipe;
            Save(C);
         end if;
      end Background_Recipe;

      procedure Heart_Recipe is 
         lives : Integer;
      begin 
         Restore(Gui);         
         lives := data_centre.get_lives;
         for i in Integer range 1..lives loop
            Draw_Image(Gui,((i-1)*40,0),Image(Heart));  

         end loop;
      end Heart_Recipe;
      
      
      procedure update_Shrek is         
      begin
         if data_centre.get_redraw_hearts then
            Heart_Recipe;
         end if;
         if data_centre.get_reset then
            Draw_Image(C,(0,0),Image(TryAgain));  
            delay 1.5; 
            Erase(C);
            restart_game;
            Background_Recipe;
            data_centre.check_colisions;
            Heart_Recipe;

            Restore(C);
           
                    
            
         end if;
         
         Restore(C);
         Shrek_Recipe;
         Onions_Recipe; 
         data_centre.check_victory;
         if data_centre.change_level then
            Erase(C);
            data_centre.set_level(0); -- this increases the level by 1
            change_to_level(data_centre.get_level);
            data_centre.Reset_level;
            Heart_Recipe;
            Background_Recipe;           
            Restore(C);
            Shrek_Recipe;
            Onions_Recipe; 
         end if;
         
          
         
      end update_Shrek;
                      
   begin
      
      accept draw_info;
      Set_Color(Gui,(213,33,33));  
      Save(Gui);
      Draw_Image(C,(0,0),Image(GetReady));  
      
      accept start;
      Restore(C);
      change_to_level(1); 
      Heart_Recipe;
      Background_Recipe; 
      update_Shrek;
      data_centre.check_colisions;
      
      while Valid(F) loop
         select
            accept stop;
            exit;       
         or
            accept drawshrek;
            update_Shrek;
         or accept drawhearts;
            Heart_Recipe;

         end select;
         
         
      end loop;
      logwriter_task.stop;
      GNAT.OS_Lib.OS_Exit(0);
            
   exception
      when E: others => 
         logwriter_task.write(To_Unbounded_String(Exception_Name (E)&" in draw_canvas: "&Exception_Message(E)));

         logwriter_task.stop;
         GNAT.OS_Lib.OS_Exit(0);
   end draw_canvas_task;


end draw_canvas;
