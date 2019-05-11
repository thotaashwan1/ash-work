global class ActIdListOpportunities implements Database.Batchable<sObject>, Database.stateful {
    
    global Map<Id, List<Opportunity>> ActOpportunityMap = new Map<Id, List<Opportunity>>();
    global List<Opportunity> start(Database.BatchableContext bc){
        List<Opportunity> lstOpportunity = [SELECT Id,Name,AccountId FROM Opportunity where AccountId != null];
        return lstOpportunity;
        
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> lstOpportunity){
        for(Opportunity opp : lstOpportunity){
            if(ActOpportunityMap.get(opp.AccountId) == null){
                List<Opportunity> lstOpp = new List<Opportunity>();
                lstOpp.add(opp);
                ActOpportunityMap.put(opp.AccountId, lstOpp);
            }else{
                List<Opportunity> lstOpp = ActOpportunityMap.get(opp.AccountId);
                lstOpp.add(opp);
                ActOpportunityMap.put(opp.Accountid, lstOpp);
                
            }
            
        }
        system.debug('**Account and Opportunity Map**'+ActOpportunityMap);
        
    }
    global void finish(Database.BatchableContext bc){
        system.debug('**Account and Opportunity Map in finish method**'+ActOpportunityMap);
        
    }

}