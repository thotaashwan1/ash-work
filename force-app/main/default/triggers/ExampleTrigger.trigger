trigger ExampleTrigger on Contact (after insert, after delete) {
    
    if(Trigger.isInsert){
        Integer recordCount = Trigger.New.size();
        EmailManager.sendMail('c-ashwankumar.thota@charter.com', 'Trailhead Trigger Tutorial', recordCount+' contact(s) were inserted');
        
    }
    else if(Trigger.isDelete){
        system.debug('Contact deleted');
    }

}