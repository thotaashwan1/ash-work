trigger actOppLineItemsAmountCalculation on OpportunityLineItem (After insert, After Update) {

    Public Map<Id, List<Opportunity>> actOppMap = new Map<Id, List<Opportunity>>();
    Public Map<Id, List<OpportunityLineItem>> oppOLIMap = new Map<Id, List<OpportunityLineItem>>();
   // Public Map<Id, Decimal> oppAmountMap = new Map<Id, Decimal>();
    
    Public List<Opportunity> listOpp = new List<Opportunity>();
    Public List<Account> lstAccountts = new List<Account>();
    Public List<Account> lstActs = new List<Account>();
    List<OpportunityLineItem> lstOli = new List<OpportunityLineItem>();
     List<Id> lstOppId = new List<Id>();
     List<Id> lstActId = new List<Id>();

     List<Account> listAct = new List<Account>();
     List<Opportunity> listOpps = new List<Opportunity>();
     
    if(Trigger.isAfter && ( Trigger.isInsert || Trigger.isUpdate)){
        for(OpportunityLineItem oli: Trigger.new){
            
            boolean isInsert = Trigger.OldMap == null;
            if(isInsert && string.valueOf(oli.TotalPrice) != null){
                lstOli.add(oli);
            }else if(!isInsert && Trigger.OldMap.get(oli.Id).TotalPrice != oli.TotalPrice)
                lstOli.add(oli);
        }
        system.debug('**lstOli: '+lstOli);
        for(OpportunityLineItem ol : lstOli){
            lstOppId.add(ol.OpportunityId);
        }
        
        List<Opportunity> lstOpp = [select Id,AccountId, Amount, (select Id,OpportunityId,TotalPrice from OpportunityLineItems) from Opportunity where Id IN : lstOppId];
        for(Opportunity o : lstOpp){
            lstActId.add(o.AccountId);
        }
        
        
        
        for(Opportunity opp : lstOpp){
            oppOLIMap.put(opp.Id, opp.OpportunityLineItems);
            system.debug('**oppOLIMap: '+oppOLIMap);
        }
        
        
        
        decimal totalLineItemsAmount = 0;
        decimal totalOppsAmount = 0;
        
        for(Id op2 : oppOLIMap.keyset()){
            for(OpportunityLineItem oli2 : oppOLIMap.get(op2)){
                totalLineItemsAmount= totalLineItemsAmount+oli2.TotalPrice ;
            }
            system.debug('**totalLineItemsAmount:'+totalLineItemsAmount);
            Opportunity oppt = new Opportunity(Id=op2);
            oppt.Amount = totalLineItemsAmount;
            
            listOpp.add(oppt);
        }
        if(!listOpp.isEmpty()){
            update listOpp;
            system.debug('**listOpp:'+listOpp);
        }
        
        List<Account> lstAccountts = [select Id,OpportunityAmount__c, (select Id,Amount from Opportunities) from Account where Id IN: lstActId];
        for(Account act : lstAccountts){
            actOppMap.put(act.Id, act.Opportunities);
            system.debug('**actOppMap: '+actOppMap);
        }
        
      /*  for(Opportunity op3 : listOpp){
            oppAmountMap.put(op3.Id, op3.Amount);
            system.debug('**oppAmountMap:'+oppAmountMap);
        }  */
        
        Map<Id, Decimal> oppAmountMap2 = new Map<Id, Decimal>();
        for(Id act3 : actOppMap.keyset()){
            for(Opportunity op4 : actOppMap.get(act3)){
                oppAmountMap2.put(op4.Id, op4.Amount);
            }
        }
        

        for(Id act2 : actOppMap.keyset()){
            for(Opportunity op3 : actOppMap.get(act2)){
                if(oppAmountMap2.get(op3.Id) != null){
                    system.debug('**oppAmountMap2.get(op3.Id: '+oppAmountMap2.get(op3.Id));
                   totalOppsAmount = totalOppsAmount + oppAmountMap2.get(op3.Id); 
                }
                
            }
            system.debug('**totalOppsAmount: '+totalOppsAmount);
            Account accnt = new Account(Id=act2);
            accnt.OpportunityAmount__c = totalOppsAmount ;
            lstActs.add(accnt);
        }
        if(!lstActs.isEmpty()){
            update lstActs;
        }
     
    }  
}