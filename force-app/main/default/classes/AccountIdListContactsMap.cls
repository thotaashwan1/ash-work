// Prepare account contact map

global class AccountIdListContactsMap implements Database.batchable<sObject>, Database.stateful{
    
    global Map<Id, List<Contact>> ActContactsMap = new Map<Id, List<Contact>>();
    global List<Contact> start(Database.BatchableContext bc){
        List<Contact> lstContact = [SELECT Id,Name,AccountId from Contact where AccountId != null];
        return lstContact;
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> lstContact){
        for(Contact ct : lstContact){
            if(ActContactsMap.get(ct.AccountId) == null){
                List<Contact> lstCont = new List<Contact>();
                lstcont.add(ct);
                ActContactsMap.put(ct.AccountId, lstCont);
            }else{
                List<Contact> lstCont = ActContactsMap.get(ct.AccountId);
                lstCont.add(ct);
                ActContactsMap.put(ct.AccountId, lstCont);
            }
            
        }
        system.debug('**Account and Contacts List map: **'+ActContactsMap);
        
    }
    
    global void finish(Database.Batchablecontext bc){
        system.debug('**Account and Contacts List map in Finish method: **'+ActContactsMap);
        
    }
    
}