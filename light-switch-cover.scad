holeDia = 6.15;
baseThickness = 3.8;
wellDepth = baseThickness/2;
servoStrutDia = 4.28;
servoStrutHeightOffset = 22;
servoStrutHeight = 30;
bottomStrutOffset = 32.5;
inlineServoStrutSep = 10.21;
servoWidth = 20.4;
servoStrutsX = 5;
$fn = 80;

module base(){
    difference(){
        cube([70.36, 98, baseThickness], center=true);
        cube([11,24.5, baseThickness+2],center=true);
        translate([0,30.05,(baseThickness/2 - wellDepth)])cylinder(r=(holeDia+1)/2, h=wellDepth, center=true);
        translate([0,30.05,0])cylinder(r=(holeDia-1)/2, h=baseThickness, center=true);
        translate([0,-30.05, (baseThickness/2 - wellDepth)])cylinder(r=(holeDia+1)/2, h=wellDepth, center=true);
        translate([0,-30.05,0])cylinder(r=(holeDia-1)/2, h=baseThickness, center=true);
    }
}

module servoStrut(){
    union(){
        cylinder(d=servoStrutDia, h=servoStrutHeight);
        cylinder(d=(servoStrutDia+4), h=servoStrutHeightOffset);
    }
    
}

module servoStruts(){
    translate([servoWidth+servoStrutsX,-bottomStrutOffset,0])servoStrut();
    translate([servoWidth+servoStrutsX-inlineServoStrutSep,-bottomStrutOffset,0])servoStrut();
    translate([servoWidth+servoStrutsX,-bottomStrutOffset+43.68+servoStrutDia,0])servoStrut();   
    translate([servoWidth+servoStrutsX-inlineServoStrutSep,-bottomStrutOffset+43.68+servoStrutDia,0])servoStrut();  
}

module drawAll(){
    union(){
        base();
        servoStruts();
    }
}

drawAll();