public class SendingEmail
{
//We've to first setup From Address: youremail@gmail.com
//Setup > Organization-Wide Address
//We're using Salesforce Inbuilt class SingleEmailMessage here

    public static void demo()
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        string[] sendingto = new string[]{'destinationemail@gmail.com'};
        mail.setToAddresses(sendingto);
        mail.setSubject('Testing Email!!');
        mail.setPlainTextBody('This is a test email');
        //This command will send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage [] {mail});
    }
    //Developer Console
    //SendingEmail.demo();
 }