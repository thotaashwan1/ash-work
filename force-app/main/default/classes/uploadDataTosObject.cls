public with sharing class uploadDataTosObject {
    public list<ExcelSheetWrap> lstExcelSheetWrap {get;set;}
    public list<Sheet1> lstSheet1Wrap {get;set;}
    public list<Sheet2> lstSheet2Wrap {get;set;}
    List<Account> forInsert = new List<Account>();
    public Integer size {get;set;}
    public String myString {get;set;}
    public Boolean status {get;set;}
    public String message {get;set;}
    public uploadDataTosObject(){
        lstSheet1Wrap = new list<Sheet1>();
        lstSheet2Wrap = new list<Sheet2>();
        myString= '';
        size = 0;
        status= false;
    }
    public PageReference parseData(){
        system.debug('****************myString'+myString);
        String jsonStr = '['+myString+']';
        system.debug('****************8jsonStr'+jsonStr);
        List<ExcelSheetWrap> deserializedData = (List<ExcelSheetWrap>)JSON.deserialize(jsonStr, List<ExcelSheetWrap>.class);
        system.debug('****************deserializedData'+deserializedData);
        if(deserializedData!=null && deserializedData.size () >0){
            ExcelSheetWrap objExcelSheetWrap = deserializedData[0];
            
            system.debug('****************objExcelSheetWrap'+objExcelSheetWrap);
            system.debug('****************objJSON2Apex'+objExcelSheetWrap.Sheet1);
            system.debug('****************objJSON2Apex'+objExcelSheetWrap.Sheet2);
            
            lstSheet1Wrap = objExcelSheetWrap.Sheet1;
            lstSheet2Wrap = objExcelSheetWrap.Sheet2;
            
            for(Sheet1 objSheet1:lstSheet1Wrap){
                system.debug('****************objSheet1.StudentName'+objSheet1.StudentName);
                system.debug('****************objSheet1.StudentEmail'+objSheet1.StudentEmail);
            }
            
            for(Sheet2 objsheet2:lstSheet2Wrap){
                system.debug('***objsheet2.EmployeeName*******'+objsheet2.EmployeeName);
                system.debug('*********objsheet2.EmployeeEmail******'+objsheet2.EmployeeEmail);
            }
        }
        return null;
    }
    public class ExcelSheetWrap {
		public List<Sheet1> Sheet1;
		public List<Sheet2> Sheet2;
	}
	public class Sheet1 {
		public String StudentName {get;set;}
		public String StudentEmail {get;set;}
	}
	public class Sheet2 {
		public String EmployeeName {get;set;}
		public String EmployeeEmail {get;set;}
	}
	
}