
night_light();

//translate([0,50,0]) night_light();
//translate([0,100,0]) night_light();

module night_light()
{
    //battery bank approx 96 x 24 x 22
    length = 99;    //battery bank - tight fit + 1mm for tab
    width = 26;     //battery bank - tight fit
    bat_height = 28;
    spacer_height = 1;
    board_height = 10;
    wall_th = 1.2;
    spacer_th = 1.2;
    window_border_x = 20;
    window_border_y = 5;
    bat_cutout_height = 28;
    
    
    ///////////////////////////////////
    //Derived
    height = bat_height + spacer_height + board_height;
    
    union()
    {
        difference() {
            cube([length+(wall_th*2),
                    width+(wall_th*2),
                    height+wall_th]);
            
            //battery compartment cut out
            translate([wall_th, wall_th, -10])
                cube([length,width,bat_height+10]);
            
            //board compartment cut out
            translate([wall_th+spacer_th, 
                    wall_th+spacer_th, 
                    bat_height-1])
                cube([length-(spacer_th*2),
                    width-(spacer_th*2),
                    board_height+1]);
            
            //spacer cut out
            /*translate([wall_th + spacer_th, 
                    wall_th + spacer_th, 
                    bat_height-5])
                cube([length - (spacer_th*2),
                    width - (spacer_th*2),
                    spacer_height+10]);*/
            
            //cut out window
            translate([window_border_x+wall_th,
                    window_border_y+wall_th,
                    10])
                cube([length-(window_border_x*2),
                    width-(window_border_y*2),
                    height+10]);
            
            //battery connectors
            translate([(wall_th+length-5), wall_th, -10])
                cube([length,
                    width,
                    bat_cutout_height+10]);
        }
        /*
        //bottom tabs for battery
        for (x_pos = [20,40,60,80])
        {
            translate([x_pos, wall_th, 0]) cube([2,2,1]);
            translate([x_pos, (wall_th+width-2), 0]) cube([2,2,1]);
        }
        
        //end tabs for battery
        translate([length+(wall_th*2)-1, wall_th, 0])
            cube([1,1,3]);
        translate([length+(wall_th*2)-1, (wall_th+width-1), 0])
            cube([1,1,3]);
        */
    }
}