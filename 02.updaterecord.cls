public class updaterecord
{
    public static void demo()
    {
      //Check Invoice records Status, and change it's status to Paid
      //What will be the SOQL query? 
      List<Invoice__c> invList = [select id, Customer__c, Amount_Paid__c, Status__c from Invoice__c];
      
      //We need the second list to update records
      List<Invoice__c> updateinvList = new List<Invoice__c>();
      
      //Passing all values from List1 and adding updated values to List2
      for(Invoice__c inv: invList)
      {
          if(inv.Status__c != 'Paid')
          {
              inv.Status__c = 'Paid';
              updateinvList.add(inv);
              
          }
              update updateinvList;
      }
          System.debug('Updated Invoice record values are : '+updateinvList);
          //Open Execute Anonymous Window, updaterecord.demo();
    }
}