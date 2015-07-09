//global definitions
left = -1;
right = 1;
bottom = -1;
top = 1;

//parameters definition
handleBaseWidth = 40;
handleBaseDepth = 80;
handleBaseHeight = 10;
handleBaseDistance = 140;
handleLength = 120;
handleHeight = 35;
handleDiameter = 20;
handleSupportWidth = 30;
handleSupportExternalHeight = 1;
handleSupportHullDiam = 5;

module base()
{
  translate([(-handleBaseWidth/2),-handleBaseDepth/2,0])
    cube([handleBaseWidth,handleBaseDepth,handleBaseHeight]);
  
  hull()
  {
      translate([handleBaseWidth/2-handleSupportHullDiam/2,handleSupportWidth/2,handleBaseHeight])
        cylinder(h=handleSupportExternalHeight,d=handleSupportHullDiam);   
        
      translate([handleBaseWidth/2-handleSupportHullDiam/2,-handleSupportWidth/2,handleBaseHeight])
        cylinder(h=handleSupportExternalHeight,d=handleSupportHullDiam);   
     
      translate([-handleBaseWidth/2+handleSupportHullDiam/2,handleSupportWidth/2,handleBaseHeight])
        cylinder(h=handleSupportExternalHeight,d=handleSupportHullDiam);     
        
      translate([-handleBaseWidth/2+handleSupportHullDiam/2,-handleSupportWidth/2,handleBaseHeight])
        cylinder(h=handleSupportExternalHeight,d=handleSupportHullDiam);     

      translate([handleBaseDistance/2 - handleLength/2 + handleBaseWidth/2,0,handleHeight-handleBaseHeight/2])
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
  translate([-handleBaseDistance/2 - handleBaseWidth/2,0,handleBaseHeight/2])
    base();  
  
  //right base
  translate([handleBaseDistance/2 + handleBaseWidth/2,0,handleBaseHeight/2])
    rotate([0,0,180])
      base();  
  
  //handle
  handleTop();

}

handle();