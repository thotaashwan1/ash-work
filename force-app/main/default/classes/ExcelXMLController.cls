public class ExcelXMLController {

    public String getExcelData() {
        return '<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?>';
    }
    public String getEOF() {
        return '</Workbook>';
    }

}