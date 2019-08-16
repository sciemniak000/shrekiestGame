package body levels is

   procedure change_to_level (level : Integer) is 
   begin
      -- x, y, step, upper_bounce, lower_bounce, skip, up, vert
      case level is 
      when 1 =>
         data_centre.clear;
         data_centre.add_spawn((550,600));

         data_centre.add_wall((440,100),(440,700));
         data_centre.add_wall((240,100),(440,100));
         data_centre.add_wall((280,100),(280,700));
         data_centre.add_wall((140,70),(140,700));
         
      
         

         --data_centre.add_win_spot((470,570)); -- delete me!
         data_centre.add_bullet(100,112,8,380,112,0,True,True);
         data_centre.add_bullet(60,380,8,380,112,0,True,True);
         data_centre.add_bullet(40,112,8,380,112,0,True,True);
         data_centre.add_bullet(0,380,8,380,112,0,True,True);

         
         data_centre.add_bullet(280,160,8,260,150,0,True,False); 
         data_centre.add_bullet(120,200,8,260,150,0,True,False); 
         data_centre.add_bullet(120,220,8,260,150,0,True,False);
         data_centre.add_bullet(280,240,8,260,150,0,True,False); 
         data_centre.add_bullet(120,280,8,260,150,0,True,False); 
        
         data_centre.add_win_spot((0,600));
         data_centre.add_win_spot((20,600));
         data_centre.add_win_spot((60,600));
         data_centre.add_win_spot((100,600));
         
         data_centre.add_win_spot((160,600));
         data_centre.add_win_spot((200,600));
         data_centre.add_win_spot((230,600));
         data_centre.add_win_spot((250,600));
     
         
         
      when 2 =>
         data_centre.clear;
         data_centre.add_spawn((620,580));

         data_centre.add_wall((280,100),(280,400));    
         data_centre.add_wall((330,100),(330,400));
         data_centre.add_wall((100,100),(500,100));

         
         data_centre.add_wall((330,520),(640,520));   
         data_centre.add_wall((-20,520),(280,520));            
         data_centre.add_bullet(240,520,12,360,240,0,True,False);


      
         

         --data_centre.add_win_spot((470,570)); -- delete me!
         data_centre.add_bullet(260,112,8,380,112,0,True,True);
         data_centre.add_bullet(220,380,8,380,112,0,True,True);
         data_centre.add_bullet(180,112,8,380,112,0,True,True);
         data_centre.add_bullet(140,380,8,380,112,0,True,True);
         data_centre.add_bullet(100,112,8,380,112,0,True,True);
         data_centre.add_bullet(60,380,8,380,112,0,True,True);
         data_centre.add_bullet(40,112,8,380,112,0,True,True);
         data_centre.add_bullet(0,380,8,380,112,0,True,True);
         
         
         
         data_centre.add_bullet(0,120,8,260,0,0,True,False);
         data_centre.add_bullet(260,160,8,260,0,0,True,False); 
         data_centre.add_bullet(0,200,8,260,0,0,True,False); 
         data_centre.add_bullet(260,220,8,260,0,0,True,False);
         data_centre.add_bullet(0,240,8,260,0,0,True,False); 
         data_centre.add_bullet(260,280,8,260,0,0,True,False); 
         data_centre.add_bullet(0,320,8,260,0,0,True,False); 
         data_centre.add_bullet(260,360,8,260,0,0,True,False); 
         data_centre.add_bullet(0,370,8,260,0,0,True,False); 
         
         
         data_centre.add_bullet(620,112,8,380,112,0,True,True);
         data_centre.add_bullet(580,380,8,380,112,0,True,True);
         data_centre.add_bullet(540,112,8,380,112,0,True,True);
         data_centre.add_bullet(500,380,8,380,112,0,True,True);
         data_centre.add_bullet(470,112,8,380,112,0,True,True);

         data_centre.add_bullet(460,380,8,380,112,0,True,True);
         data_centre.add_bullet(420,112,8,380,112,0,True,True);
         data_centre.add_bullet(380,380,8,380,112,0,True,True);
         data_centre.add_bullet(340,112,8,380,112,0,True,True);
           
         data_centre.add_bullet(340,120,8,620,340,0,True,False);
         data_centre.add_bullet(620,160,8,620,340,0,True,False); 
         data_centre.add_bullet(340,200,8,620,340,0,True,False); 
         data_centre.add_bullet(620,220,8,620,340,0,True,False);
         data_centre.add_bullet(340,240,8,620,340,0,True,False); 
         data_centre.add_bullet(620,280,8,620,340,0,True,False); 
         data_centre.add_bullet(340,320,8,620,340,0,True,False); 
         data_centre.add_bullet(620,360,8,620,340,0,True,False); 
         data_centre.add_bullet(340,370,8,620,340,0,True,False); 
         
         
         data_centre.add_win_spot((330,0));
         data_centre.add_win_spot((330,40));
         data_centre.add_win_spot((330,70));
         data_centre.add_win_spot((280,0));         
         data_centre.add_win_spot((280,40));
         data_centre.add_win_spot((280,70));
         
      when 3 =>
         data_centre.clear;
         
         data_centre.add_wall((110,520),(640,520));            
        
         data_centre.add_spawn((620,570));
         

         
         data_centre.add_bullet(0,500,8,80,0,0,True,False); 
         
         
         data_centre.add_bullet(100,500,6,600,500,0,True,True);
         data_centre.add_bullet(60,600,6,600,500,0,True,True);
         data_centre.add_bullet(40,500,6,600,500,0,True,True);
         data_centre.add_bullet(0,600,6,600,500,0,True,True);
         data_centre.add_bullet(130,590,8,600,130,0,True,False); 

         data_centre.add_wall((-20,200),(500,200));
         
         data_centre.add_bullet(130,230,8,600,130,0,True,False); 
         data_centre.add_bullet(130,240,8,600,130,0,True,False);
         data_centre.add_bullet(130,280,8,600,130,0,True,False); 
         data_centre.add_bullet(130,300,8,600,130,0,True,False); 
         data_centre.add_bullet(130,320,8,600,130,0,True,False);
         data_centre.add_bullet(130,340,8,600,130,0,True,False); 
         data_centre.add_bullet(130,380,8,600,130,0,True,False); 
         data_centre.add_bullet(130,420,8,600,130,0,True,False); 
         data_centre.add_bullet(130,440,8,600,130,0,True,False); 
         data_centre.add_bullet(130,470,8,600,130,0,True,False); 
         
         data_centre.add_win_spot((470,160));
         data_centre.add_win_spot((470,120));
         data_centre.add_win_spot((470,80));
         data_centre.add_win_spot((470,60));
         data_centre.add_win_spot((470,40));
         data_centre.add_win_spot((470,0));

      when others =>
      null;
      end case;
      data_centre.Reset_level;
   end change_to_level;
   
   procedure restart_game is
   begin
      logwriter_task.write(To_Unbounded_String("No lives left, restarting game..."));

      data_centre.clear;
      data_centre.set_level(1);
      data_centre.set_nof_lives(base_lives);           
      change_to_level(1);
   end restart_game;
   

end levels;
