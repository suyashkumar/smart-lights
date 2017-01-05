#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <wifi_info.h> // comment this out and fill in the below two lines
#include <PubSubClient.h>
#include <Conduit.h>
#include <Servo.h>

Servo servo1;

#define LED 4
#define servo D6
#define servo_power D5

// Fill out the below Github peeps:
//const char* ssid = "mywifi";
//const char* password = "";

WiFiClient client;
PubSubClient pClient(client); 
Conduit conduit("suyash", "conduit.suyash.io", "my-api-secret"); // or "suyash", "home.suyash.io"
int ledStatus = 0; 
int lightsStatus = 0;
int lightsOnAngle = 65;
int lightsOffAngle = 25;

void startWIFI(){
  WiFi.begin(ssid, password);
  Serial.println("");

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

}

int ledToggle(){
  digitalWrite(LED, (ledStatus) ? LOW : HIGH);
  ledStatus = (ledStatus) ? 0 : 1;
  Serial.println("Toggled");
  conduit.publishMessage((ledStatus) ? "LED ON" : "LED OFF");
}

int publishMessage(){
    conduit.publishMessage("hey there");
}
/*
int addTen(){
	currentAngle = currentAngle + 10;
	servo1.write(currentAngle);
	char angleStr[20];
	sprintf(angleStr, "%d", currentAngle);
	const char* angleStrPublish = angleStr;
	conduit.publishMessage(angleStrPublish);
}
int subtractTen(){
	currentAngle = currentAngle - 10;
	servo1.write(currentAngle);
	char angleStr[20];
	sprintf(angleStr, "%d", currentAngle);
	const char* angleStrPublish = angleStr;
	conduit.publishMessage(angleStrPublish); 
}
*/
int lightsOn(){
	digitalWrite(servo_power, HIGH);
	servo1.write(lightsOnAngle);
	delay(700);
	conduit.publishMessage("ON");
	digitalWrite(servo_power, LOW);
	lightsStatus = 1;
}

int lightsOff(){
	digitalWrite(servo_power, HIGH);
	servo1.write(lightsOffAngle);
	delay(700);
	conduit.publishMessage("OFF");
	digitalWrite(servo_power, LOW);
	lightsStatus = 0;
}

int lightsStatusFunc(){
	conduit.publishMessage((lightsStatus) ? "ON" : "OFF"); 
}

void setup(void){
  Serial.begin(115200); // Start serial
  pinMode(LED, OUTPUT); // Set LED pin to output
  pinMode(servo, OUTPUT); // Set up servo output
  pinMode(servo_power, OUTPUT); 
  
  startWIFI(); // Config/start wifi
  
  digitalWrite(servo_power, HIGH); 
  servo1.attach(servo); 
  servo1.write(lightsOnAngle);
  delay(500);
  digitalWrite(servo_power, LOW); 

  // Conduit bindings
  conduit.addHandler("ledToggle", &ledToggle);
  conduit.addHandler("hello", &publishMessage); 
  conduit.addHandler("lightsOn", &lightsOn);
  conduit.addHandler("lightsOff", &lightsOff);
  conduit.addHandler("lightsStatus", &lightsStatusFunc);
  conduit.setClient(pClient);

}

void loop(void){
  conduit.handle(); 
}
