#include <Arduino.h> 
// #include <wifi_info.h> 
#include <Conduit.h>
#include <Servo.h>

#define LED 4
#define servo D6
#define servo_power D5
#define OFF_STATUS 0
#define ON_STATUS 1
#define LIGHTS_ON_ANGLE 65
#define LIGHTS_OFF_ANGLE 25

// Fill out the below Github peeps:
const char* ssid = "mywifi";
const char* password = "";
const char* deviceName = "suyash";
const char* apiKey = "your-api-key-here";
const char* serverUrl = "conduit.suyash.io"; 

Conduit conduit(deviceName, serverUrl, apiKey); // init Conduit 

// Global state
int ledStatus = OFF_STATUS; 
int lightsStatus = ON_STATUS; 

Servo servo1; 

// Toggle attached signal LED
int ledToggle(){
  digitalWrite(LED, (ledStatus) ? LOW : HIGH);
  ledStatus = (ledStatus) ? OFF_STATUS : ON_STATUS;
  Serial.println("Toggled");
  conduit.publishMessage((ledStatus) ? "LED ON" : "LED OFF");
}

// Get a sanity check message (to check conduit communication)
int publishMessage(){
    conduit.publishMessage("hey there, things are working");
}

// Turn lights on
int lightsOn(){
	digitalWrite(servo_power, HIGH);
	servo1.write(LIGHTS_ON_ANGLE);
	delay(500);
	conduit.publishMessage("ON");
	digitalWrite(servo_power, LOW);
	lightsStatus = ON_STATUS;
}

// Turn lights off
int lightsOff(){
	digitalWrite(servo_power, HIGH);
	servo1.write(LIGHTS_OFF_ANGLE);
	delay(500); 
	conduit.publishMessage("OFF");
	digitalWrite(servo_power, LOW);
	lightsStatus = OFF_STATUS;
}

int lightsStatusFunc(){
	conduit.publishMessage((lightsStatus) ? "ON" : "OFF"); 
}

int lightsToggle() {
	(lightsStatus) ? lightsOff() : lightsOn();
}

void setup(void){
  Serial.begin(115200); // Start serial
  pinMode(LED, OUTPUT); // Set LED pin to output
  pinMode(servo, OUTPUT); // Set up servo output
  pinMode(servo_power, OUTPUT); 
  
  // Servo initialization
  digitalWrite(servo_power, HIGH); 
  servo1.attach(servo); 
  servo1.write(LIGHTS_ON_ANGLE);
  delay(500);
  digitalWrite(servo_power, LOW); 

  // Conduit initialization  
  conduit.startWIFI(ssid, password); // Config/start wifi
  conduit.init();

  // Conduit bindings
  conduit.addHandler("ledToggle", &ledToggle);
  conduit.addHandler("hello", &publishMessage); 
  conduit.addHandler("lightsOn", &lightsOn);
  conduit.addHandler("lightsOff", &lightsOff);
  conduit.addHandler("lightsStatus", &lightsStatusFunc); 
  conduit.addHandler("lightsToggle", &lightsToggle); 

}

void loop(void){
  conduit.handle(); 
}
