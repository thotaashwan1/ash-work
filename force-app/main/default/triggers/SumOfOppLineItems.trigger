trigger SumOfOppLineItems on OpportunityLineItem (After insert, After update) {
    
    List<Id> lstOppId = new List<Id>();
    List<Id> lstActId = new List<Id>();
    List<Account> lstAccts = new List<Account>();
    list<Opportunity> listOfOpps = new list<Opportunity>();
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        for(OpportunityLineItem oli : Trigger.new){
            List<OpportunityLineItem> listOli = new List<OpportunityLineItem>();
            boolean isInsert = Trigger.oldMap == null;
            if(isInsert && (string.valueOf(oli.TotalPrice)!= null)){
                listOli.add(oli);
            }else if(!isInsert && Trigger.OldMap.get(oli.Id).TotalPrice != oli.TotalPrice){
                listOli.add(oli);
            }
            for(OpportunityLineItem ol : listOli){
                lstOppId.add(ol.OpportunityId);    
            }
            
        }
        if(Trigger.isAfter && Trigger.isDelete){
            
        }
        
        decimal sumOfOli = 0;
        List<Opportunity> lstOpps = [select Id,name from Opportunity where Id IN :lstOppId];
        for(Opportunity opp:lstOpps){
            for(OpportunityLineItem oppli : opp.OpportunityLineItems){
                if(oppli.TotalPrice!=null) sumOfOli = sumOfOli+oppli.TotalPrice;
            }
                opp.Amount = sumOfOli; 
                listOfOpps.add(opp);
        }
        if(listOfOpps!=null) update listOfOpps;

        for(Opportunity o:listOfOpps){
            lstActId.add(o.AccountId);
        }
        decimal sumOfOpps = 0;
        List<Account> lstAcc = [select id,name from Account where Id IN :lstActId];
        for(Account acc: lstAcc){
            for(Opportunity op : acc.Opportunities){
                if(op.Amount!=null) sumOfOpps = sumOfOpps+op.Amount;
            }
            acc.OpportunityAmount__c = sumOfOpps;
            lstAccts.add(acc);
            system.debug('**lstAccts:**'+lstAccts);
        }
        if(!lstAccts.isEmpty()){
            update lstAccts;
            system.debug('**after update lstAccts:**'+lstAccts);
        }
    }
}