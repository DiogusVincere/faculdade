#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

const char* ssid = "Wokwi-GUEST";
const char* password = "";

const char* contentfulURL = "https://cdn.contentful.com/spaces/tqsnwogyan0s/environments/master/entries?content_type=device&select=fields.pin,fields.state";
const char* accessToken = "COLOQUE_SEU_TOKEN_CDA_AQUI"; // token de leitura (CDA) do Contentful, o mesmo VITE_CONTENTFUL_CDN_TOKEN do .env

void setup()
{
   Serial.begin(115200);
   WiFi.begin(ssid, password);
   Serial.println("Starting Wifi Connection...");
   while(WiFi.status() != WL_CONNECTED){
       delay(100);
       Serial.print("*");
    }   
   Serial.println("\n Successfully Connected with: ");
   Serial.println(ssid);
}

void loop()
{    
    if( (millis() - timerScan) >= SCAN_DELAY){
        Serial.println("\n **** SCAN START **** \n")
        scanRoutine();
        timerScan = millis();
        Serial.println("\n **** SCAN END **** \n")
    }
}


void scanRoutine(){
    
    HTTPClient http;
    http.begin(contentfulURL);
    http.addHeader("Authorization", accessToken);

    int httpResponseStatus = http.GET();

    if(httpResponseStatus > 0){
        String response = http.getString();

        const int responseSize = response.length() * 1.1;
        DynamicJsonDocument json(responseSize);
        deserializeJson(json, response);

        JsonArray items = json["items"];

        for(JsonObject item : items){
            int pin = item["fields"]["pin"] | -1;
            bool state = item["fields"]["state"] | false;

            if(pin >= 0){
                pinMode(pin, OUTPUT);
                digitalWrite(pin, state);
                Serial.println("PIN: %d, STATE: %d", pin, state ? "ON": "OFF");
            }
        }
    }
    else{
        Serial.println("\n Error when calling backend: %d",httpResponseStatus);
    }

    http.end();
}

