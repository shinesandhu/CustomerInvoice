//Batch Job for Account name update
global class AccountBatchJob implements Database.Batchable<sobject>
{

        //Start Method
      global Database.Querylocator start (Database.BatchableContext bc) 
      {
      //return Database.getQueryLocator(Write your soql query here);
        return Database.getQueryLocator('select id, name from account');
      }
  
  
      //Execute method
      //Passing a List called scope (sObject elements)
      global void execute (Database.BatchableContext bc, List<sobject> scope) 
      {
          //This List will store the updated Account records
            List<Account> accList = new List<Account>();
    
            for(sObject objScope: scope) 
            { 
                //We're casting SObject with Account object here
                Account newscope = (Account)objScope;
                newscope.name = newscope.name + '!!';
                accList.add(newscope);
            } 
            
            if (accList != null && accList.size()>0) 
            {
            //We do not want to update an empty list
            Database.update(accList); 
            System.debug('Records updated by batch job '+accList);
            }
      }
      
      /* Second Approach - Easy one
      //Execute method
      global void execute (Database.BatchableContext bc, List<Account> scope) 
      {
      
            for (Account acc: scope) 
            { 
                acc.name = acc.name + '!!';
                   
            } 
            update scope;
       }  
       */   
      
        //Finish Method
      global void finish(Database.BatchableContext bc)
     {
       //Nothing is needed here
     }
     //Open Executive Anonymous Window
      //AccountBatchJob b = new AccountBatchJob();
      //Database.ExecuteBatch(b);
}