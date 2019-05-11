public class AnimalsCallout {
    
    Public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
             Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
             List<Object> animals = (List<Object>) results.get('animals');
             for(object animal : animals){
                 system.debug(animal);
                 
             }
        } else {
            system.debug('The status code not expected:'+response.getStatusCode()+' '+response.getBody());
        }
        return response;
        
    }
    
    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() != 201){
            system.debug('The status code is not expected:'+response.getStatusCode()+' '+response.getBody());
        }else {
            system.debug(response.getBody());
        }
        return response;
    }
}