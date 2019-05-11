public class ActOppAndLineItemsAmount {
    
    Public Map<ID, List<Opportunity>> actOppMap = new Map<ID, List<Opportunity>>();
    public Map<Id, List<OpportunityLineItem>> oppLineitemsMap = new Map<Id, List<OpportunityLineItem>>();
    public List<Account> lstAccounts = [select Id, (select Id,AccountId,Amount from Opportunities) from Account];
    
 /*   for(Account act : lstAccounts){
        actOppMap.put(act.Id, act.Opportunities);
        system.debug('**actOppMap: **'+actOppMap);
        for(Opportunity opp: act.Opportunities){
            oppLineitemsMap.put(opp.Id, opp.OpportunityLineItems);
            system.debug('**oppLineitemsMap: **'+oppLineitemsMap);
        }
    }  */

}