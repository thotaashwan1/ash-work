Trigger FindDupes on Lead(before insert, before update){
    FOR(Lead myLead : Trigger.New){
        IF(myLead.Email != null){
            List<Contact> dupes = [SELECT Id from Contact
                                  	WHERE Email = :myLead.Email];
            IF(dupes.size()>0){
                myLead.addError('A Contact with this emil already exists, cannot created duplicate Lead');
            }
        }
    }
}