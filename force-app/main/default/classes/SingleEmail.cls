public class SingleEmail {

    Public String Subject{get;set;}
    Public String Email_Body{get;set;}
    
    List<String> emails = new List<String>{'t.ashwan@gmail.com'};
    
    Public PageReference send(){
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    email.setSubject(Subject);
    email.setHtmlBody(Email_Body);
    email.setToAddresses(emails);
    
    Messaging.SendEmailResult[] Result = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    
    return null;
    
    }
}