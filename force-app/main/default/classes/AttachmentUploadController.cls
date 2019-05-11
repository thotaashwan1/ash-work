public with sharing class AttachmentUploadController {

  public Attachment attachment {
  get {
      if (attachment == null)
        attachment = new Attachment();
      return attachment;
    }
  set;
  }
  private ApexPages.StandardController ctrl;    
  public AttachmentUploadController(ApexPages.StandardController controller){
      ctrl = controller;
  }
  public PageReference upload() {
    Lead c = (Lead)ctrl.getRecord();
    insert c;
    attachment.OwnerId = UserInfo.getUserId();
    attachment.ParentId = c.Id; // the record the file is attached to
    attachment.IsPrivate = true;

    try {
      insert attachment;
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
      return null;
    } finally {
      attachment = new Attachment(); 
    }

    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    return null;
  }

}