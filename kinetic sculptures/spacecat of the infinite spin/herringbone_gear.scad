// Planetary gear bearing (customizable)

use <pin2.scad>;
//----------------------------------------------------------------------------
//PARAMETERS------------------------------------------------------------------
//----------------------------------------------------------------------------

object=8; //[0=planetary gear:1=carrier:2=both:4=sun pin:5=long sun pin::8=motor attachment pin:9=motor clamp]

gear_chamfer = .250;
gear_chamfer_b = -.50;

//cube([50,10,10]);

//Planetary gear--------------------------------------------------------------

approximate_gear_ratio=5; 
//The actual acheived gear ratio is influenced by the number_of_teeth_on_planets and number_of_planets
number_of_teeth_on_planets=19; 
number_of_planets=4;

// outer diameter of ring
D=100;
// thickness
T=15;
// clearance b
tol=0.2;

// pressure angle between gears
P=30;//[30:60] 
// number of teeth to twist across
nTwist=1;
// width of hexagonal hole
w=6.2;
// maximum depth ratio of teeth
DR=0.5;

//Planetary gear bearings-------------------------------------------------------

number_of_planets_b=4;
number_of_teeth_on_planets_b=9;
approximate_number_of_teeth_on_sun_b=11;
wall_thickness=3;
// pressure angle between gears
P_b=34;//[30:60] 
// number of teeth to twist across
nTwist_b=2;
w_b=4.2;// width of gear bearing hexagonal hole
DR_b=0.5;// maximum depth ratio of teeth

pin_diameter=-1; //[0=no pin:-1=auto. max:else=diameter]
pin_lip_height=3;
pin_lip_thickness=1;
pin_tolerance=0.2;

//Carrier-------------------------------------------------------

bearing_rad = 14.3/2;
bearing_thick = 5.2;

carrier_thickness=bearing_thick+3;
carrier_gear_gap=2;
carrier_arm_width=18;
carrier_outer_fillet_radius=5;
carrier_inner_fillet_radius=20;
carrier_extra_length=10;
carrier_cylinder_radius=10;
carrier_cylinder_height=11;
w_c=6.2; //width of carrier hexagonal hole

//Sun Pin Variables
//pinhole(r=spinrad,l=spinlen,nub=spinnub,fixed=true,fins=false);
spinrad = 6;
spinlen = 17;
spinnub = .4;
spinthick = 3;

//Carrier Pin Variables
//pinhole(r=cpinrad,l=cpinlen,nub=cpinnub,fixed=true,fins=false);
cpinrad = 3.5;
cpinlen = 13;
cpinnub = .4;


if(object == 3){
    pinpeg(r=cpinrad,l=cpinlen,nub=cpinnub,fixed=true,fins=false);
}

if(object == 4){
    pinpeg(r=spinrad,l=spinlen,nub=spinnub,t=spinthick,fixed=true,fins=false);
}


if(object == 5){
    length = 50;
    difference(){
        union(){
            for(i=[0,1]) mirror([0,i,0]) translate([0,length/2,0])
                pinpeg(r=spinrad,l=spinlen,nub=spinnub,t=spinthick,fixed=true,fins=false);
    
            translate([0,0,4]) rotate([90,0,0]) cylinder(r=spinrad-.29, h=length, center=true, $fn=20);
        }
        for(i=[0,1]) mirror([0,i,0]) translate([0,length/2,0]){
            hull(){
                cylinder(r=2.7, h=30, center=true, $fn=72);
                translate([0,-6,0]) cylinder(r=2, h=30, center=true, $fn=72);
            }
        }
        
        translate([0,0,-100]) cube([200,200,200], center=true);
        translate([0,0,100+7.8855]) cube([200,200,200], center=true);
    }
}

if(object == 9){    //motor attachment
    flange_rad = 22/2;
    screw_circle_rad = 16/2;
    
    motor_shaft = 4.3/2;
    
    extra = 2;
    
    
    length = 13;
    difference(){
        union(){
    
            //motor cylinder
            rotate([90,0,0]) cylinder(r1=spinrad-.29+extra, r2=spinrad+1+extra, h=length, center=true, $fn=20);
            
            //motor side
            translate([0,-length/2,0]) rotate([90,0,0]) {
                cylinder(r=flange_rad, h=3, center=true, $fn=72);
                translate([0,0,-1.49-2]) cylinder(r2=spinrad+2+extra, r1=spinrad-.29+extra, h=2);
            }
        }
        
        //motor shaft
        rotate([90,0,0]) cylinder(r=motor_shaft, h=50, center=true, $fn=72);
        
        //screwholes to the motor
        translate([0,-length/2,0]) rotate([90,0,0]) {
            for(i=[0:90:359]) rotate([0,0,i]) translate([screw_circle_rad,0,0]) {
                cylinder(r=1.7, h=10, center=true, $fn=72);
                translate([0,0,-20-1.5]) cylinder(r2=3.5, r1=1.5, h=20, $fn=72);
            }
            }
        
        //set screw shaft
        rotate([0,0,0]) translate([0,1,0]) {
            cylinder(r=3/2, h=50, center=true, $fn=72);
            translate([0,0,4]) hull() {
                cube([5.7,5.7,2.5], center=true);
                translate([0,5,0]) cube([5.9,5.9,2.5], center=true);
            }
        }
            
    }
}

if(object == 8){    //motor attachment
    flange_rad = 22/2;
    screw_circle_rad = 16/2;
    
    
    length = 50;
    difference(){
        union(){
            //peg side
            translate([0,length/2,0])
                pinpeg(r=spinrad,l=spinlen,nub=spinnub,t=spinthick,fixed=true,fins=false);
    
            //joining cylinder
            translate([0,0,4]) rotate([90,0,0]) cylinder(r1=spinrad-.29, r2=spinrad+1, h=length, center=true, $fn=20);
            
            //motor side
            translate([0,0,4]) translate([0,-length/2,0]) rotate([90,0,0]) {
                cylinder(r=flange_rad, h=3, center=true, $fn=72);
                translate([0,0,-1.49-2]) cylinder(r2=spinrad+2, r1=spinrad-.29, h=2);
            }
        }
        translate([0,length/2,0]){
            hull(){
                cylinder(r=2.7, h=30, center=true, $fn=72);
                translate([0,-6,0]) cylinder(r=1, h=30, center=true, $fn=72);
            }
        }
        
        //screwholes to the motor
        translate([0,0,4]) translate([0,-length/2,0]) rotate([90,0,0]) {
            for(i=[0:90:359]) rotate([0,0,i]) translate([screw_circle_rad,0,0]) {
                cylinder(r=1.7, h=10, center=true, $fn=72);
                translate([0,0,-20-1.5]) cylinder(r2=3.5, r1=1.5, h=20, $fn=72);
            }
            }
            
        //hole for the motor's long shaft
        translate([0,0,4]) translate([0,-length/2,0]) rotate([90,0,0]) {
            #cylinder(r=2.25, h=75, center=true, $fn=72);
        } 
        
        //translate([0,0,-100]) cube([200,200,200], center=true);
        translate([0,0,100+7.8855]) cube([200,200,200], center=true);
    }
}

if(object == 82){    //motor attachment
    flange_rad = 22/2;
    screw_circle_rad = 16/2;
    shaft_len = 23;
    $fn=36;
    
    length = 50;
    difference(){
        union(){
            //peg side
            translate([0,length/2,0])
                pinpeg(r=spinrad,l=spinlen,nub=spinnub,t=spinthick,fixed=true,fins=false);
                
            //joining cylinder
            translate([0,6,4]) rotate([90,0,0]) cylinder(r1=spinrad-.29, r2=spinrad+1, h=length-12, center=true, $fn=20);
            translate([0,-6-7+.1,4]) rotate([90,0,0]) cylinder(r2=4, r1=spinrad+1, h=12.1, $fn=20);
            
            //flange for clamp screws
            translate([-.75-3,-length/4,4-5]) rotate([0,90,0]) cylinder(r=5, h=6+1.5);
            
        }
        translate([0,length/2,0]){
            hull(){
                cylinder(r=2.7, h=30, center=true, $fn=72);
                translate([0,-6,0]) cylinder(r=1, h=30, center=true, $fn=72);
            }
        }
        
        //motor shaft hole
        translate([0,-length/2,4]) rotate([90,0,0]) {
            cylinder(r=4.1/2, h=shaft_len*2, center=true, $fn=36);
            cylinder(r=3.3/2, h=shaft_len*2+15, center=true, $fn=36);
        }
        
        //slit
        translate([-.75,-length/2-.1,4-10.1]) cube([1.5,shaft_len+2.5,10.1]);
        
        //screwholes for the clamp
        translate([-.75-3-5,-length/4,4-5]) rotate([0,90,0]) {
            cylinder(r=1.6, h=6+1.5+10);
            translate([0,0,-4]) cylinder(r=3.1, h=10);
            translate([0,0,2+10]) cylinder(r=7.1/2, h=10, $fn=4);
        }
        
        //translate([0,0,-100]) cube([200,200,200], center=true);
        translate([0,0,100+7.8855]) cube([200,200,200], center=true);
    }
}

if(object == 6){
    length = 50;
    difference(){
        union(){
            translate([0,length/2,0])
                pinpeg(r=spinrad,l=spinlen,nub=spinnub,t=spinthick,fixed=true,fins=false);
    
            translate([0,0,3.25]) rotate([90,0,0]) cylinder(r=spinrad-.28, h=length, center=true, $fn=20);
        }
        translate([0,length/2,0]){
            hull(){
                cylinder(r=2.2, h=30, center=true, $fn=72);
                translate([0,-5,0]) cylinder(r=2.2, h=30, center=true, $fn=72);
            }
        }
        
        translate([0,-length/2,3.25]) rotate([90,0,0]) {
            intersection(){
                cylinder(r=1.6, h=25, center=true, $fn=72);
                translate([0,2.5-1,0]) cube([5,5,25], center=true);
            }
        }
        
        translate([0,0,-100]) cube([200,200,200], center=true);
        translate([0,0,100+6.472]) cube([200,200,200], center=true);
    }
}


//----------------------------------------------------------------------------
//DERIVED VALUES--------------------------------------------------------------
//----------------------------------------------------------------------------

//Planetary gear--------------------------------------------------------------
approximate_number_of_teeth_on_sun=(2*number_of_teeth_on_planets)/(approximate_gear_ratio-2);
m=round(number_of_planets);
np=round(number_of_teeth_on_planets);
ns1=approximate_number_of_teeth_on_sun;
k1=round(2/m*(ns1+np));
k= k1*m%2!=0 ? k1+1 : k1;
ns=k*m/2-np;
nr=ns+2*np;
pitchD=0.9*D/(1+min(PI/(2*nr*tan(P)),PI*DR/nr));
pitch=pitchD*PI/nr;
helix_angle=atan(2*nTwist*pitch/T);
gear_ratio=(nr+ns)/ns;
echo("gear_ratio=",gear_ratio);
echo("Number of teeth on planets",np);
echo("Number of teeth on sun",ns);
echo("Number of teeth on annular",nr);
echo("pitch",pitch);
echo("helix_angle",helix_angle);

phi=$t*360/m;

//Gear bearing--------------------------------------------------------------
Gear_planet_pitch_radius=np*pitch/(2*PI);
Gear_planet_inner_radius=Gear_planet_pitch_radius-DR/2-tol;
echo("Gear planet inner radius=",Gear_planet_inner_radius);
D_b=2*Gear_planet_inner_radius-2*wall_thickness;

m_b=round(number_of_planets_b);
np_b=round(number_of_teeth_on_planets_b);
ns1_b=approximate_number_of_teeth_on_sun_b;
k1_b=round(2/m_b*(ns1_b+np_b));
k_b= k1_b*m_b%2!=0 ? k1_b+1 : k1_b;
ns_b=k_b*m_b/2-np_b;
echo(ns_b);
nr_b=ns_b+2*np_b;
pitchD_b=D_b/(1+min(PI/(2*nr*tan(P_b)),PI*DR_b/nr_b));
pitch_b=pitchD_b*PI/nr_b;
echo(pitch_b);
helix_angle_b=atan(2*nTwist_b*pitch_b/T);
echo(helix_angle_b);

depth_val=pitch_b/(2*tan(P_b));
echo("depth_val",depth_val);
Bearing_sun_pitch_radius=ns_b*pitch_b/(2*PI);
echo("Bearing_sun_pitch_radius",Bearing_sun_pitch_radius);
Bearing_sun_root_radius = Bearing_sun_pitch_radius-depth_val/2-tol/2;
echo("Bearing_sun_root_radius",Bearing_sun_root_radius);

//carrier------------------------------------------------------------------
cl=pitchD/2*(ns+np)/nr+carrier_extra_length-carrier_outer_fillet_radius;
cw=carrier_arm_width-2*carrier_outer_fillet_radius;
carrier_translate_distance=(T+carrier_gear_gap)*(object-1);


//----------------------------------------------------------------------------
//MODEL-----------------------------------------------------------------------
//----------------------------------------------------------------------------

//Planetary gear--------------------------------------------------------------
if (object==0 || object==2){
	//Annuler 
	translate([0,0,T/2]){
		difference(){
			union(){
                cylinder(r=D/2,h=T-4,center=true,$fn=100);
                for(i=[0,1]) mirror([0,0,i]) translate([0,0,T/2-2.01]) cylinder(r1=D/2, r2=D/2-2, h=2.01, $fn=100);
                    
                //mountable base
                translate([D/2-8, 0, 0]) rotate([0,90,0]) hull(){
                    for(i=[0,1]) mirror([0,i,0]) translate([0,50,0]) {
                        translate([0,0,4]) cylinder(r=T/2, h=4.01);
                        translate([0,0,2]) cylinder(r=T/2-3, h=2, center=true);
                    }
                }
            }
            
			union(){
				herringbone(nr,pitch,P,DR,-tol,helix_angle,T+0.2);
                translate([D/2-8, 0, 0]) rotate([0,90,0])
                for(i=[0,1]) mirror([0,i,0]) translate([0,50,0]) {
                    cylinder(r=2.5, h=20, $fn=72);
                    cylinder(r1=6, r2=2, h=3, $fn=72);
                }
			}
		}
	//sun
	rotate([0,0,(np+1)*180/ns+phi*(ns+np)*2/ns]){
		difference(){
			mirror([0,1,0]){
				herringbone(ns,pitch,P,DR,tol,helix_angle,T, gear_chamfer=gear_chamfer);
            }
			//pinhole();
            translate([0,0,T/2]) rotate([180,0,0])
                pinhole(r=spinrad,l=spinlen,nub=spinnub,fixed=true,fins=false);
		}
	}
//planets (gear bearings)-----------------------------------------------------
	for(i=[1:m])rotate([0,0,i*360/m+phi])translate([pitchD/2*(ns+np)/nr,0,0]){
		rotate([0,0,i*ns/m*360/np-phi*(ns+np)/np-phi]){
		//planets
        union(){
            difference(){
                herringbone(np,pitch,P,DR,tol,helix_angle,T, gear_chamfer=gear_chamfer);
                
                //this is to hollow out the center a bit
                radius = pitch*np/PI/2;
                difference(){
                    union(){
                        cylinder(r=radius-3, h=T+1, center=true, $fn=36);
                        //chamfer the top and bottom
                        for(i=[0,1]) mirror([0,0,i]) translate([0,0,T/2-.5]){
                            cylinder(r1=radius-3, r2 = radius-1, h=2);
                        }
                    }
                    
                    
                    for(i=[0:360/3:359]) rotate([0,0,i]) translate([0,5,0]) {
                        hull(){
                            cube([radius*2-5, 1, T], center=true);
                            cube([radius*2-5, 2, T-1], center=true);
                        }
                        
                    }
                }
            }

            //axle
            difference(){
                translate([0,0,-.5]) cylinder(r=5, h=16, center=true, $fn=36);
                cylinder(r=5.5/2, h=18, center=true, $fn=36);
            }
        }

	}
	} 
}
}

if (object == 7){
		rotate([0,0,i*ns/m*360/np-phi*(ns+np)/np-phi]){
		//Annuler 
			difference(){
				herringbone(np,pitch,P,DR,tol,helix_angle,T, gear_chamfer=gear_chamfer);
				herringbone(nr_b,pitch_b,P_b,DR_b,-tol,helix_angle_b,T+0.2);
			}
		//sun
		difference(){
			rotate([0,0,(np_b+1)*180/ns_b+phi*(ns_b+np_b)*2/ns_b])
				mirror([0,1,0])
					herringbone(ns_b,pitch_b,P_b,DR_b,tol,helix_angle_b,T, gear_chamfer=gear_chamfer_b, extra_h=1);
			translate([0,0,-T/2-1])
				pinhole(r=cpinrad,l=cpinlen,nub=cpinnub,fixed=true,fins=false);
                //cylinder(r=w_b/sqrt(3),h=T,center=true,$fn=6);
		}	
		//planets
		for(i=[1:m_b])rotate([0,0,i*360/m_b+phi])translate([pitchD_b/2*(ns_b+np_b)/nr_b,0,0])
			rotate([0,0,i*ns_b/m_b*360/np_b-phi*(ns_b+np_b)/np_b-phi])
			herringbone(np_b,pitch_b,P_b,DR_b,tol,helix_angle_b,T, gear_chamfer=gear_chamfer_b);

	}
}


//Carrier
if (object==1 || object==2){
translate([0,0,carrier_translate_distance])
	difference(){
		union(){
			translate([0,0,carrier_thickness])
			cylinder(h=carrier_cylinder_height,r1=carrier_cylinder_radius+3, r2=carrier_cylinder_radius-2,$fn=50);
            
            for(i=[1:m]){
                    *rotate([0,0,i*360/m+phi]) translate([pitchD/2*(ns+np)/nr,0,carrier_thickness-.01]) cylinder(r1=9, r2=5, h=cpinlen+.01-carrier_thickness); 
            
			linear_extrude(height = carrier_thickness, center = false, convexity = 10, twist = 0){
				minkowski(){
					circle(r = carrier_outer_fillet_radius,$fn=50);
					union(){
						for(i=[1:m])
							rotate([0,0,i*360/m+phi]){
								translate([(pitchD/2*(ns+np)/nr+carrier_extra_length-carrier_outer_fillet_radius)/2,0,0])
                                square ([cl,cw],center = true);
                            }
					}
				}

				//Fillet
					difference(){
					polygon(points=[[-((carrier_inner_fillet_radius+carrier_arm_width/2)*(cos(i*360/m+phi)*cos(i*360/m+180/m+phi)+sin(i*360/m+phi)*sin(i*360/m+180/m+phi))/(sin(i*360/m+phi)*cos(i*360/m+180/m+phi)-cos(i*360/m+phi)*sin(i*360/m+180/m+phi)))*cos(i*360/m+phi)-(carrier_arm_width/2)*sin(i*360/m+phi),-((carrier_inner_fillet_radius+carrier_arm_width/2)*(cos(i*360/m+phi)*cos(i*360/m+180/m+phi)+sin(i*360/m+phi)*sin(i*360/m+180/m+phi))/(sin(i*360/m+phi)*cos(i*360/m+180/m+phi)-cos(i*360/m+phi)*sin(i*360/m+180/m+phi)))*sin(i*360/m+phi)+(carrier_arm_width/2)*cos(i*360/m+phi)],[-((carrier_inner_fillet_radius+carrier_arm_width/2)*(cos(i*360/m+phi)*cos(i*360/m+180/m+phi)+sin(i*360/m+phi)*sin(i*360/m+180/m+phi))/(sin(i*360/m+phi)*cos(i*360/m+180/m+phi)-cos(i*360/m+phi)*sin(i*360/m+180/m+phi)))*cos((i+1)*360/m+phi)+(carrier_arm_width/2)*sin((i+1)*360/m+phi),-((carrier_inner_fillet_radius+carrier_arm_width/2)*(cos(i*360/m+phi)*cos(i*360/m+180/m+phi)+sin(i*360/m+phi)*sin(i*360/m+180/m+phi))/(sin(i*360/m+phi)*cos(i*360/m+180/m+phi)-cos(i*360/m+phi)*sin(i*360/m+180/m+phi)))*sin((i+1)*360/m+phi)-(carrier_arm_width/2)*cos((i+1)*360/m+phi)],[0,0]],paths=[[0,1,2]]);

					translate([((carrier_inner_fillet_radius+carrier_arm_width/2)*(pow(sin(i*360/m+phi),2)+pow(cos(i*360/m+phi),2))/(sin((i*360/m+phi)+180/m)*cos(i*360/m+phi)-cos((i*360/m)+180/m+phi)*sin(i*360/m+phi)))*cos(i*360/m+180/m+phi),((carrier_inner_fillet_radius+carrier_arm_width/2)*(pow(sin(i*360/m+phi),2)+pow(cos(i*360/m+phi),2))/(sin((i*360/m)+180/m+phi)*cos(i*360/m+phi)-cos((i*360/m)+180/m+phi)*sin(i*360/m+phi)))*sin(i*360/m+180/m+phi),0])
						circle(r = carrier_inner_fillet_radius,$fn=50);

					}
				}
			}
		}
		union(){
			for(i=[1:m])
				rotate([0,0,i*360/m+phi])
					translate([pitchD/2*(ns+np)/nr,0,0])
					{
						//bearing slot
                        translate([0,0,carrier_thickness/2]){
                            hull(){ for(i=[0,15]) translate([i,0,0]) {
                                cylinder(r=bearing_rad-2.5, h=bearing_thick+4, $fn=72, center=true);
                                
                                cylinder(r=bearing_rad, h=bearing_thick-1, $fn=72, center=true);
                            }
                        }
                    }
					}
			//cylinder(r=w_c/sqrt(3),h=carrier_thickness+carrier_cylinder_height+1,center=false,$fn=6);
                mirror([0,0,1]) translate([0,0,-carrier_cylinder_height-carrier_thickness])  pinhole(r=spinrad,l=spinlen,nub=spinnub,fixed=true,fins=false);    
                
                
		}
	}

}



module rack(
	number_of_teeth=15,
	circular_pitch=10,
	pressure_angle=28,
	helix_angle=0,
	clearance=0,
	gear_thickness=5,
	flat=false){
addendum=circular_pitch/(4*tan(pressure_angle));

flat_extrude(h=gear_thickness,flat=flat)translate([0,-clearance*cos(pressure_angle)/2])
	union(){
		translate([0,-0.5-addendum])square([number_of_teeth*circular_pitch,1],center=true);
		for(i=[1:number_of_teeth])
			translate([circular_pitch*(i-number_of_teeth/2-0.5),0])
			polygon(points=[[-circular_pitch/2,-addendum],[circular_pitch/2,-addendum],[0,addendum]]);
	}
}

module monogram(h=1)
linear_extrude(height=h,center=true)
translate(-[3,2.5])union(){
	difference(){
		square([4,5]);
		translate([1,1])square([2,3]);
	}
	square([6,1]);
	translate([0,2])square([2,1]);
}

module herringbone(
	number_of_teeth=15,
	circular_pitch=10,
	pressure_angle=28,
	depth_ratio=1,
	clearance=0,
	helix_angle=0,
	gear_thickness=5,
    gear_chamfer = 5, extra_h = 0){
    intersection(){
        union(){
            gear(number_of_teeth,
                circular_pitch,
                pressure_angle,
                depth_ratio,
                clearance,
                helix_angle,
                gear_thickness/2);
            mirror([0,0,1])
                gear(number_of_teeth,
                    circular_pitch,
                    pressure_angle,
                    depth_ratio,
                    clearance,
                    helix_angle,
                    gear_thickness/2+extra_h);
        }
        
        //pitchD=0.9*D/(1+min(PI/(2*nr*tan(P)),PI*DR/nr));
        //pitch=pitchD*PI/nr;
        radius = circular_pitch*number_of_teeth/PI/2;
        //chamfer the gears top and bottom
        //gear_chamfer
        union(){
            cylinder(r1=radius+gear_thickness/2, r2=radius+gear_chamfer, h=gear_thickness/2);
            mirror([0,0,1]) 
            cylinder(r1=radius+gear_thickness/2, r2=radius+gear_chamfer, h=gear_thickness/2+extra_h);
        }
    }
}

module gear (
	number_of_teeth=15,
	circular_pitch=10,
	pressure_angle=28,
	depth_ratio=1,
	clearance=0,
	helix_angle=0,
	gear_thickness=5,
	flat=false){
pitch_radius = number_of_teeth*circular_pitch/(2*PI);
twist=tan(helix_angle)*gear_thickness/pitch_radius*180/PI;

flat_extrude(h=gear_thickness,twist=twist,flat=flat)
	gear2D (
		number_of_teeth,
		circular_pitch,
		pressure_angle,
		depth_ratio,
		clearance);
}

module flat_extrude(h,twist,flat){
	if(flat==false)
		linear_extrude(height=h,twist=twist,slices=twist/6)child(0);
	else
		child(0);
}

module gear2D (
	number_of_teeth,
	circular_pitch,
	pressure_angle,
	depth_ratio,
	clearance){
pitch_radius = number_of_teeth*circular_pitch/(2*PI);
base_radius = pitch_radius*cos(pressure_angle);
depth=circular_pitch/(2*tan(pressure_angle));
outer_radius = clearance<0 ? pitch_radius+depth/2-clearance : pitch_radius+depth/2;
root_radius1 = pitch_radius-depth/2-clearance/2;
root_radius = (clearance<0 && root_radius1<base_radius) ? base_radius : root_radius1;
backlash_angle = clearance/(pitch_radius*cos(pressure_angle)) * 180 / PI;
half_thick_angle = 90/number_of_teeth - backlash_angle/2;
pitch_point = involute (base_radius, involute_intersect_angle (base_radius, pitch_radius));
pitch_angle = atan2 (pitch_point[1], pitch_point[0]);
min_radius = max (base_radius,root_radius);

intersection(){
	rotate(90/number_of_teeth)
		circle($fn=number_of_teeth*1,r=pitch_radius+depth_ratio*circular_pitch/2-clearance/2);
	union(){
		rotate(90/number_of_teeth)
			circle($fn=number_of_teeth*1,r=max(root_radius,pitch_radius-depth_ratio*circular_pitch/2-clearance/2));
		for (i = [1:number_of_teeth])rotate(i*360/number_of_teeth){
			halftooth (
				pitch_angle,
				base_radius,
				min_radius,
				outer_radius,
				half_thick_angle);		
			mirror([0,1])halftooth (
				pitch_angle,
				base_radius,
				min_radius,
				outer_radius,
				half_thick_angle);
		}
	}
}}

module halftooth (
	pitch_angle,
	base_radius,
	min_radius,
	outer_radius,
	half_thick_angle){
index=[0,1,2,3,4,5];
start_angle = max(involute_intersect_angle (base_radius, min_radius)-5,0);
stop_angle = involute_intersect_angle (base_radius, outer_radius);
angle=index*(stop_angle-start_angle)/index[len(index)-1];
p=[[0,0],
	involute(base_radius,angle[0]+start_angle),
	involute(base_radius,angle[1]+start_angle),
	involute(base_radius,angle[2]+start_angle),
	involute(base_radius,angle[3]+start_angle),
	involute(base_radius,angle[4]+start_angle),
	involute(base_radius,angle[5]+start_angle)];

difference(){
	rotate(-pitch_angle-half_thick_angle)polygon(points=p);
	square(2*outer_radius);
}}

// Mathematical Functions
//===============

// Finds the angle of the involute about the base radius at the given distance (radius) from it's center.
//source: http://www.mathhelpforum.com/math-help/geometry/136011-circle-involute-solving-y-any-given-x.html

function involute_intersect_angle (base_radius, radius) = sqrt (pow (radius/base_radius, 2) - 1) * 180 / PI;

// Calculate the involute position for a given base radius and involute angle.

function involute (base_radius, involute_angle) =
[
	base_radius*(cos (involute_angle) + involute_angle*PI/180*sin (involute_angle)),
	base_radius*(sin (involute_angle) - involute_angle*PI/180*cos (involute_angle))
];
