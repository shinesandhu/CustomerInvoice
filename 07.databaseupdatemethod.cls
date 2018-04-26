public class databaseupdatemethod
{
    public static void demo()
    {
           //Check Invoice record Status, and update it to 'Paid' using Database Method
          //Getting all the Invoice records
            List<Invoice__c> invList = [select id, Customer__c, Amount_Paid__c, Status__c from Invoice__c];
      
          //This List will store the updated records
          List<Invoice__c> updateinvList = new List<Invoice__c>();
      
          
          for(Invoice__c inv: invList)
          {
              if(inv.Status__c != 'Paid')
              {
                  inv.Status__c = 'Paid';
                  updateinvList.add(inv);
              
              }
                  //Database Method to Update records
                  Database.saveResult[] srList = Database.update(updateinvList, false);
                  
                  for(Database.saveResult sr: srList)
                  {
                      if(sr.isSuccess())
                      {
                          System.debug('This Invoice got successfully updated : '+sr.getid());
                      }
                  }      
          }
             //Developer Console, databaseupdatemethod.demo();
    }
}