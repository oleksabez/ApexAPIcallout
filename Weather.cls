public class Weather {
    @future(callout=true)
    public static void current(String location) {
        httpRequest req = new httpRequest();
        req.setEndpoint('http://api.weatherstack.com/current?access_key=899532d9d1dac46fce4e7b0aa3ef92d3&query=' + location + '&hourly=1');
        req.setMethod('GET');
        http h = new http();
        httpResponse res = h.send(req);
        Map<String, Object> objMap = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        Map<String, Object> description;
        WeatherHolder__c wh = new WeatherHolder__c();
        wh.Location__c = location;
        for(String key: objMap.keySet()) {
            description = (Map<String, Object>)objMap.get(key);
            if(description.containsKey('cloudcover')) {
                for(String sub_key: description.keySet()) {
                    System.debug(sub_key);
                    System.Debug(description.get(sub_key));
                }
                wh.Temperature__c = Double.valueOf(description.get('temperature'));
                wh.Humidity__c = Double.valueOf(description.get('humidity'));
                wh.Sky_state__c = String.valueOf(description.get('weather_descriptions'));
                wh.Wind_speed__c = Double.valueOf(description.get('wind_speed'));
                wh.Wind_direction__c = String.valueOf(description.get('wind_dir'));
                wh.Pressure__c = Double.valueOf(description.get('pressure'));
            }
            wh.Id = null;
            insert wh;
        }
    }
}