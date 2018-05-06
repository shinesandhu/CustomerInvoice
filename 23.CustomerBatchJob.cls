//Scenario: Doing Batch Jobs
//On Customer object, when Active checkbox is selected, and when batch job is run
//We want Customer_Status__c = 'Paid' and Description__c message = 'This record is updated by Batch Job'

//Batch Jobs have global class and methods and their interface is database.batchable
//We're passing object as SObject (generic) which we'll be casting it with correct object later on

global class CustomerBatchJob implements Database.Batchable<sobject>
{
      //When Batch Job finishes, email will be sent to this address  
      global String [] email = new String[] {'emailsend@gmail.com'};
  
  
  //Start Method
  global Database.Querylocator start (Database.BatchableContext bc) 
  {
      //return Database.getQueryLocator(Write your soql query here);
    return Database.getQueryLocator('Select id, name, Customer_Status__c, Customer_Description__c From Customer__c WHERE  Active__c = true');
    
  }

  //Execute method
  //Passing a List called scope (sObject elements)
  //newscope (sObject > Customer__c) casting object
  global void execute (Database.BatchableContext bc, List<sobject> scope) 
  {
      //This List will store the updated Customer records
    List<customer__c> custList = new List<customer__c>();
    
    for (sObject objScope: scope) 
    { 
        //We're casting SObject with Customer__c object here
        Customer__c newscope = (Customer__c)objScope;
        newscope.Customer_Description__c = 'This record is updated by Batch Job';
        newscope.Customer_Status__c = 'Paid';
        custList.add(newscope);
    } 
        if (custList != null && custList.size()>0) 
        {
            //We do not want to update an empty list
            Database.update(custList); 
            System.debug('Records updated by batch job '+custList);
        }
  }

  //Finish Method
  global void finish(Database.BatchableContext bc)
  {
  //In finish we're using inbuilt classes to send email and AsyncApexJob to collect job related information
  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

  //Below code will fetch the job Id
  AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors, a.JobType, 
  a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById, a.CompletedDate From AsyncApexJob a WHERE id = :bc.getJobId()];
  System.debug('Jobid is'+bc.getJobId());

  //Information for sending email
  mail.setToAddresses(email);
  //Salesforce Admin email
  mail.setReplyTo('whosmanagingyourorg@gmail.com');
  mail.setSenderDisplayName('Apex Batch Job Result');
  mail.setSubject('Batch Processing '+a.Status);
  mail.setPlainTextBody('Batches processed: '+a.TotalJobItems+' with errors '+a.NumberOfErrors+' and job items processed '+a.JobItemsProcessed);
  Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
  }
  //Executing in Developer Console
  //CustomerBatchJob b = new CustomerBatchJob();
  //Database.ExecuteBatch(b);
}