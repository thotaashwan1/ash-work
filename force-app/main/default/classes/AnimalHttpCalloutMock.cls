Global class AnimalHttpCalloutMock implements HttpCalloutMock {
    
    global HttpResponse respond(HttpRequest request){
        
        HttpResponse response = new HTTPResponse();
        response.setHeader('Content-Type','Application/json');
        response.setBody('{"animals":["Majestic Badger","fluffy bunny","scary bear","mighty moose","chicken"]}');
        response.setStatusCode(200);
        return response;
        
    }

}