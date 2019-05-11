Global class AccountSendEmailBatchable implements database.Batchable<sObject> {
    
    
    global list<Account> start(database.BatchableContext bc){
        list<Account> lstAccount = [select id,name,Account_Email__c from Account where Account_Email__c = 't.ashwan@gmail.com'];
        return lstAccount;
    }
    global void execute(database.BatchableContext bc, list<Account> accountList){
        list<Messaging.SingleEmailMessage> lstEmail = new list<Messaging.SingleEmailMessage>();
    //    String[] addresses = new String[]{'t.ashwan@gmail.com','thotaashwan1@gmail.com'};
        for(Account act : accountList){
            Messaging.SingleEmailMessage myEmail = new Messaging.SingleEmailMessage();
            EmailTemplate tempId = [select Id from EmailTemplate where name='Sample Letter' Limit 1];
            Contact cnt = [select id, Email from Contact where email != null limit 1];
            myEmail.setTargetObjectId(cnt.Id);
            myEmail.setWhatId(act.Id);
            
            myEmail.setToAddresses(new List<String>{act.Account_Email__c});
            myEmail.setTemplateId(tempId.Id);
           // myEmail.setSubject('Hello!');
            lstEmail.add(myEmail);
        }
        if(lstEmail.size()>0){
                Savepoint sp = Database.setSavepoint();
                Messaging.SendEmail(lstEmail);
                Database.rollback(sp);

                    system.debug('**List of Emails**'+lstEmail);
                    List<Messaging.SingleEmailMessage> msgListToBeSend = new List<Messaging.SingleEmailMessage>();
                    for (Messaging.SingleEmailMessage email : lstEmail) {
                        Messaging.SingleEmailMessage emailToSend = new Messaging.SingleEmailMessage();
                        emailToSend.setToAddresses(email.getToAddresses());
                        emailToSend.setPlainTextBody(email.getPlainTextBody());
                        emailToSend.setHTMLBody(email.getHTMLBody());
                        emailToSend.setSubject(email.getSubject());
                        msgListToBeSend.add(emailToSend);
                    }
                        Messaging.sendEmail(msgListToBeSend);
            }
    }
    global void finish(database.BatchableContext bc){
       
        }
    }