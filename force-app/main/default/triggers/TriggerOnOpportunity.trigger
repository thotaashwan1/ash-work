trigger TriggerOnOpportunity on Opportunity (after insert, after update, after Delete) {
    Set<Id> AccountIds = new Set<Id>();
    List<Account> lstAct = new List<Account>();
    decimal sum = 0;
    
    if(Trigger.isAfter && ( Trigger.isInsert || Trigger.isUpdate)){
        boolean isInsert = Trigger.OldMap == null;
        List<Opportunity> lstOpportunity = new List<Opportunity>();
        for(Opportunity opp : Trigger.new){
            if(isInsert && (string.valueOf(opp.Amount) != null)){
                lstOpportunity.add(opp);
            }
            if(!isInsert && Trigger.OldMap.get(opp.Id).Amount != opp.Amount){
                lstOpportunity.add(opp);
            }
        }
        for(Opportunity lstOpps : lstOpportunity){
            AccountIds.add(lstOpps.AccountId);
        }
    }

    if(Trigger.isAfter && Trigger.isDelete){
        
        for(Opportunity op: Trigger.OldMap.values()){
            AccountIds.add(op.AccountId);
        }
    }
    
    if(AccountIds.size()>0){
        List<Account> lstAccounts = [select Id,Name,OpportunityAmount__c, (select Id,name,Amount,AccountId from Opportunities)  from Account where Id IN:AccountIds];
        for(Account acc:lstAccounts){
            for(Opportunity op : acc.Opportunities){
                if(op.Amount != null){
                    sum = sum + op.Amount;
                }
            }
            acc.OpportunityAmount__c = sum;
            lstAct.add(acc);
        }
        if(!lstAct.isEmpty()){
            update lstAct;
        }
    }

}