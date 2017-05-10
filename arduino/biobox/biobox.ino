//Declaramos los pines que vamos a usar
int pinSensor = 13; //Pin donde va conectada la entrasa del sensor

//Varible para guardar el valor que retorne el sensor.
int estadoSensor = 0, val = 0;
void setup() {
  Serial.begin(9600);
  pinMode(pinSensor, INPUT);
}

void loop() {
  val = digitalRead(pinSensor);
  if(val == HIGH) {
    if(estadoSensor == 0) {
      estadoSensor = 1;
      Serial.println(true);
    }
  } else {
    estadoSensor = 0;
  }
  
}
