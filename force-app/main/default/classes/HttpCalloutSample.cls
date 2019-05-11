public class HttpCalloutSample {

  // Pass in the endpoint to be used using the string url
  @Future(callout=true)
  public static void getCalloutResponseContents(String url) {

    // Instantiate a new http object
    Http h = new Http();

     // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('GET');

    // Send the request, and return a response
    HttpResponse res = h.send(req);
   system.debug('**Response: **'+res.getBody());
  }
}