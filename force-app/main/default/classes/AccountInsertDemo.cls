public class AccountInsertDemo {
 public Account objaccount{get;set;}
 public AccountInsertDemo(){
     objaccount = new Account();
 }
 public void insertAcc(){
     try{
         insert objaccount;
         objaccount = new Account();
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.info,'inserted successfully');
         ApexPages.addMessage(myMsg);
     }catch(exception ex){
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,ex.getmessage());
        ApexPages.addMessage(myMsg);
     }
 }
 
}