public class UpdateContactRecords {
    
    
    public static void updateConts(List<Account> acts ){
        
        Map<Id, List<Contact>> actIdListOfConts= new Map<Id, List<Contact>>();
        List<Contact> listContacts = new List<Contact>();
        List<Contact> updateConts = new List<Contact>();
        List<Contact> listConts = [select id, name, phone, email, Account.phone, Account.Account_Email__c from Contact where AccountId = :acts];
        
        for(Contact ct : listConts){
            listContacts.add(ct);
            system.debug('**listContacts**'+listContacts);
            actIdListOfConts.put(ct.AccountId, listContacts);
            system.debug('**actIdListOfConts**'+actIdListOfConts);
        }
        
        for(Id actId : actIdListOfConts.keyset()){
            for(Contact c : actIdListOfConts.get(actId)){
                c.phone = c.Account.phone;
                c.Email = c.Account.Account_Email__c;
                updateConts.add(c);
            }
        }
        if(!updateConts.isEmpty()){
            update updateConts;
        }
    }

}