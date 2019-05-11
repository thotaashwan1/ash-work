public class ContExt {
    
    public id relcont{get;set;}
    public ContExt(ApexPages.StandardSetController controller) {

    }
    

    public List<contact> getrelatedContacts(){
        List <contact> contList = New List<Contact>();
        for(Account acc: [select id, name, (select id, name,Birthdate,Department,Description from contacts) from Account where id = :relcont]) {
            for(contact con: acc.contacts){
                contList.add(con);
               
            }
        }
        system.debug('contact list: '+contList);
        return contList;   
    
    
    }
    

}