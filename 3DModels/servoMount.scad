servoInnerDiameter = 6;
extensionLength = 11.0;
screwDiameter = 3;
barWidth = 5;
barAngle = 55;
armLength = 15;
componentHeight = 7;
$fn = 100;
module servoMount(){
    difference(){
        cylinder(d=servoInnerDiameter+10, h=componentHeight);
        cylinder(d=servoInnerDiameter, h=componentHeight/1.5);
        cylinder(d=screwDiameter, h=componentHeight);
    }
}
module armBase(){
    rotate([0,0,-barAngle/2])translate([(servoInnerDiameter+1)/2,-barWidth/2,0]) union(){
    cube([extensionLength+5, barWidth, componentHeight]);
        translate([extensionLength+5,0,0])rotate([0,0,barAngle/2])cube([armLength, barWidth, componentHeight]);
    }
}
module arms(armType=0){
   union(){
       armBase();
       mirror([0,1,0])armBase();
   }
}
module drawAll(){
    union(){
        servoMount();
        arms();

    }
}
rotate([180,0,0])
drawAll();