package com.mysms.utility;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
    public void mail(String selectedFriend, String myMessage)
    {
        try {
            Properties p=System.getProperties();
            p.put("mail.smtp.starttls.enable",true);
            p.put("mail.smtp.host,", "smtp.gmail.com");
            p.put("mail.smtp.user","SenderGmailId");
            p.put("mail.smtp.password", "SenderGmailPassword");
            p.put("mail.smtp.port","587");
            p.put("mail.smtp.auth","true");
            Session ss=Session.getDefaultInstance(p);
            MimeMessage aa=new MimeMessage(ss);
            aa.setFrom(new InternetAddress("SenderGmailId"));
            aa.addRecipient(Message.RecipientType.TO,new InternetAddress("ReceiverGmailId"));
            aa.setSubject("MySMS Message");
            aa.setText(myMessage);
            Transport tt=ss.getTransport("smtp");
            tt.connect("smtp.gmail.com","SenderGmailId","SenderGmailPassword");
            tt.sendMessage(aa,aa.getAllRecipients());
            tt.close();
        }
        catch(Exception e) {
	    	e.printStackTrace();
        }
    }
}

