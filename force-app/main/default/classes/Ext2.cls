public class Ext2 {

    public Ext2(ApexPages.StandardController abc) {

    }
    List<Campaign> camps = [Select Name,status,StartDate,EndDate from campaign ];
    
    public List<Campaign> getcamps(){
    return camps;      
    }

    List<Contact> cont=[Select Name,Phone, Email from Contact];
    public List<Contact> getcont(){
        return cont;
    }

}