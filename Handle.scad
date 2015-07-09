//global definitions
left = -1;
right = 1;
bottom = -1;
top = 1;

//parameters definition
baseWidth = 40;
baseDepth = 80;
baseHeight = 10;
baseDistance = 140;
handleLength = 120;
handleHeight = 35;
handleDiameter = 20;
supportWidth = 30;
supportExternalHeight = 1;
supportHullDiam = 5;
slotsDistance = 60;
slotsDiameter = 8;
slotDepth = 5.5;


module base()
{
  //base
  difference()
  {
    translate([(-baseWidth/2),-baseDepth/2,0])
      cube([baseWidth,baseDepth,baseHeight]);

    for(side=[top,bottom])
    {
      translate([-baseWidth/2-1,side * slotsDistance/2,baseHeight-slotDepth+slotsDiameter/2])
        rotate([0,90,0])
          cylinder(baseWidth+2,d=slotsDiameter);
    }
  }
  
  //handle support
  hull()
  {
      translate([baseWidth/2-supportHullDiam/2,supportWidth/2,baseHeight])
        cylinder(h=supportExternalHeight,d=supportHullDiam);   
        
      translate([baseWidth/2-supportHullDiam/2,-supportWidth/2,baseHeight])
        cylinder(h=supportExternalHeight,d=supportHullDiam);   
     
      translate([-baseWidth/2+supportHullDiam/2,supportWidth/2,baseHeight])
        cylinder(h=supportExternalHeight,d=supportHullDiam);     
        
      translate([-baseWidth/2+supportHullDiam/2,-supportWidth/2,baseHeight])
        cylinder(h=supportExternalHeight,d=supportHullDiam);     

      translate([baseDistance/2 - handleLength/2 + baseWidth/2,0,handleHeight-baseHeight/2])
        rotate([0,90,0])
          cylinder(h=1,d=handleDiameter);
  }
}
module handleTop() 
{
  translate([-handleLength/2,0,handleHeight])
    rotate([0,90,0])
      cylinder(h=handleLength,d=handleDiameter);
}

module handle()
{
  //bases
  //-------
  //Left base
  translate([-baseDistance/2 - baseWidth/2,0,baseHeight/2])
    base();  
  
  //right base
  translate([baseDistance/2 + baseWidth/2,0,baseHeight/2])
    rotate([0,0,180])
      base();  
  
  //handle
  handleTop();

}

handle();