trigger TriggerOnContact on Contact (After Insert, After Update) {
    
    public string userName = 't.ashwan@gmail.com';
    public string password = 'Password@123';
    public string text = 'Hey there How are you';
    public string phoneNumber = 'Ashwan';
    public string endPointUrl = 'https://api.smsglobal.com/http-api.php';
    public string action = 'sendsms';
    endPointUrl = endPointUrl + '?action='+action+'&user='+userName+'&password='+password+'&&from='+phoneNumber+'&text='+text;
    
    
    for(Contact con: Trigger.new){
        if(con.Phone!=null){
            endPointUrl = endPointUrl + '&to='+con.Phone;
            HttpCalloutSample.getCalloutResponseContents(endPointUrl);
        }
        
        
        
    }

}