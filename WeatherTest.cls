@isTest
public class WeatherTest {
    private static testMethod void testCall() {
        Test.setMock(HttpCalloutMock.class, new CalloutMock());
        Weather.current('Kiyev');
    }
    public class CalloutMock implements System.HttpCalloutMock {
        public httpResponse respond(httpRequest request) {
            httpResponse res = new httpResponse();
            DescriptionMock description = new DescriptionMock();
            description.temperature = (Object)0;
            description.humidity = (Object)2;
            description.pressure = (Object)100;
            description.wind_speed = (Object)3;
            description.weather_descriptions = (Object)'cool';
            description.wind_dir = (Object)'W';
            description.cloudcover = (Object)18;
            BodyMock body = new BodyMock();
            body.some1 = new SomeMock();
            body.some2 = new SomeMock();
            body.description = description;
            res.setBody(JSON.serialize(body));
            return res;
        }
    }
    private class BodyMock {
        private Object some1;
        private Object some2;
        private DescriptionMock description;
    }
    private class SomeMock {
        private String someField;
    }
    private class DescriptionMock {
        private Object temperature;
        private Object humidity;
        private Object pressure;
        private Object wind_speed;
        private Object weather_descriptions;
        private Object wind_dir;
        private Object cloudcover;
    }
}