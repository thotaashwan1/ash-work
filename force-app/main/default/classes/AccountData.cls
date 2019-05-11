public class AccountData{
    public List<Account> accList{get;set;}
    public Integer excelRowCnt {get;set;}
    public AccountData(){
        accList = [Select Name,Type,SLA__c from Account];
        excelRowCnt = 4 + accList.size();
    }
}