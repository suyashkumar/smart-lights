servoInnerDiameter = 6.7;
extensionLength = 11.0;
screwDiameter = 3;
barWidth = 5;
barAngle = 55;
$fn = 100;
module servoMount(){
    difference(){
        cylinder(d=servoInnerDiameter+10, h=10);
        cylinder(d=servoInnerDiameter, h=5);
        cylinder(d=screwDiameter, h=10);
    }
}
module armBase(){
    rotate([0,0,-barAngle/2])translate([(servoInnerDiameter+1)/2,-barWidth/2,0]) union(){
    cube([extensionLength+5, barWidth, 10]);
        translate([extensionLength+5,0,0])rotate([0,0,barAngle/2])cube([extensionLength+5, barWidth, 10]);
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