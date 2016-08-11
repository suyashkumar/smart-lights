servoInnerDiameter = 6.0;
extensionLength = 30.0;
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


module drawAll(){
    union(){
        servoMount();
        translate([(servoInnerDiameter+1)/2,-barWidth/2,0])cube([extensionLength+10, barWidth, 10]);
        rotate([0,0,barAngle])translate([(servoInnerDiameter+1)/2,-barWidth/2,0])cube([extensionLength+10, barWidth, 10]);
    }
}

drawAll();