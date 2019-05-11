public class EmailManager {
    
    public static void sendMail(string address, string subject, string body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddress = new List<String>{address};
        mail.setSubject(subject);
        mail.setToAddresses(toAddress);
        mail.setPlainTextBody(body);
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        inspectResults(results);    
    }
    public static void inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;
        for(Messaging.SendEmailResult res : results){
            if(res.isSuccess()){
                system.debug('Email has been delivered successfully!!');
            }
            else{
                sendResult = false;
                system.debug('The following error occured: '+res.getErrors());
            }
        }
    }
}