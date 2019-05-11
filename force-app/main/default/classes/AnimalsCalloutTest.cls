@isTest
public class AnimalsCalloutTest {
    
    @isTest public static void testGetCallout(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'Json/application;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse results = AnimalsCallout.makeGetCallout();
        system.assertEquals(200, results.getStatusCode(),'The response status code is not 200');
        Map<String, object> response = (Map<String, Object>) Json.deserializeUntyped(results.getBody());
        List<Object> animals = (List<Object>) response.get('animals');
        system.assertEquals(3, animals.size());
    }
    
    @isTest public static void testPostCallout(){
        
        Test.setMock(HttpCalloutMock.Class, new AnimalHttpCalloutMock());
        HttpResponse response = AnimalsCallout.makePostCallout();
        String expectedValue = '{"animals":["Majestic Badger","fluffy bunny","scary bear","mighty moose","chicken"]}';
        system.assertEquals(expectedValue, response.getBody());
        system.assertEquals(200, response.getStatusCode());
    }

}