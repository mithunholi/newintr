package com.eoxys.Email;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class Email {
	/*
	 * static final String FROM = "goutham.eoxys@yahoo.com"; // Replace with
	 * your "From" address. This address must be verified. static final String
	 * TO = "goutham.eoxys@yahoo.com"; // Replace with a "To" address. If your
	 * account is still in the // sandbox, this address must be verified. static
	 * final String BODY =
	 * "This email was sent through the Amazon SES SMTP interface by using Java."
	 * ; static final String SUBJECT =
	 * "Amazon SES test (SMTP interface accessed using Java)";
	 * 
	 * // Supply your SMTP credentials below. Note that your SMTP credentials
	 * are different from your AWS credentials. static final String
	 * SMTP_USERNAME = "AKIAIH6IILJPPKPGXHIQ"; // Replace with your SMTP
	 * username. static final String SMTP_PASSWORD =
	 * "AsXHe5cGE4WDvga9Eke4h4L01A9R596wMoroS1YIc3fU"; // Replace with your SMTP
	 * password.
	 * 
	 * // Amazon SES SMTP host name. This example uses the US West (Oregon)
	 * region. static final String HOST = "email-smtp.us-west-2.amazonaws.com";
	 * 
	 * // Port we will connect to on the Amazon SES SMTP endpoint. We are
	 * choosing port 25 because we will use // STARTTLS to encrypt the
	 * connection. static final int PORT = 25;
	 */

	public String main(String TO) throws Exception {
		Properties properties = new Properties();
		System.out.println("resource "
				+ this.getClass().getResource("smtp.properties").getFile());
		File file = new File(this.getClass().getResource("smtp.properties")
				.getFile());
		System.out.println("File " + file.getAbsolutePath());
		FileInputStream in = new FileInputStream(file.getAbsolutePath());
		properties.load(in);
		System.out
				.println("smtp_un " + properties.getProperty("smtp_username"));
		System.out
				.println("smtp_un " + properties.getProperty("smtp_password"));
		System.out.println(in);
		properties.load(in);
		String FROM = properties.getProperty("from"); // Replace with your
														// "From" address. This
														// address must be
														// verified.
		/*
		 * String TO = "goutham.eoxys@yahoo.com"; // Replace with a "To"
		 * address. If your account is still in the // sandbox, this address
		 * must be verified.
		 */String BODY = "This email was sent through the Amazon SES SMTP interface by using Java.";
		String SUBJECT = properties.getProperty("subject");

		// Supply your SMTP credentials below. Note that your SMTP credentials
		// are different from your AWS credentials.
		String SMTP_USERNAME = properties.getProperty("smtp_username"); // Replace
																		// with
																		// your
																		// SMTP
																		// username.
		String SMTP_PASSWORD = properties.getProperty("smtp_password"); // Replace
																		// with
																		// your
																		// SMTP
																		// password.

		// Amazon SES SMTP host name. This example uses the US West (Oregon)
		// region.
		String HOST = properties.getProperty("host");
		System.out.println("host = "+properties.getProperty("host"));

		// Port we will connect to on the Amazon SES SMTP endpoint. We are
		// choosing port 25 because we will use
		// STARTTLS to encrypt the connection.
		System.out.println("port = "+properties.getProperty("port"));
		int PORT = Integer.parseInt(properties.getProperty("port"));
		String eMsg = "";
		System.out.println("Email executed");
		// Create a Properties object to contain connection configuration
		// information.
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.port", PORT);

		// Set properties indicating that we want to use STARTTLS to encrypt the
		// connection.
		// The SMTP session will begin on an unencrypted connection, and then
		// the client
		// will issue a STARTTLS command to upgrade to an encrypted connection.
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.starttls.required", "true");

		// Create a Session object to represent a mail session with the
		// specified properties.
		Session session = Session.getDefaultInstance(props);

		// Create a message with the specified information.
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(FROM));
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
		msg.setSubject(SUBJECT);
		msg.setContent(BODY, "text/plain");

		// Create a transport.
		Transport transport = session.getTransport();

		// Send the message.
		try {
			System.out
					.println("Attempting to send an email through the Amazon SES SMTP interface...");

			// Connect to Amazon SES using the SMTP username and password you
			// specified above.
			transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);

			// Send the email.
			transport.sendMessage(msg, msg.getAllRecipients());
			System.out.println("Email sent!");
		} catch (Exception ex) {
			System.out.println("The email was not sent.");
			System.out.println("Error message: " + ex.getMessage());
			eMsg = ex.getMessage();
		} finally {
			// Close and terminate the connection.
			transport.close();
		}
		return eMsg;
	}
}

/*
 * import java.io.FileInputStream; import java.io.IOException; import
 * java.util.Properties;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.ui.ModelMap; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod;
 * 
 * import com.amazonaws.auth.AWSCredentials; import
 * com.amazonaws.auth.BasicAWSCredentials; import
 * com.amazonaws.services.identitymanagement.model.AccessKey; import
 * com.amazonaws.services.identitymanagement.model.CreateAccessKeyRequest;
 * import com.amazonaws.services.identitymanagement.model.CreateAccessKeyResult;
 * import com.amazonaws.services.simpleemail.AmazonSimpleEmailService; import
 * com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClient;
 * 
 * @Controller public class Email { private AWSCredentials
 * createAwsCredentials() throws IOException { Properties properties = new
 * Properties(); FileInputStream in = new
 * FileInputStream("C:\\Users\\Eoxys-011\\Desktop\\sample.properties");
 * System.out.println(in); properties.load(in);
 * 
 * properties.load(getClass().getClassLoader().getResourceAsStream("aws.properties"
 * )); AWSCredentials credentials = new BasicAWSCredentials(properties
 * .getProperty("accessKey"), properties .getProperty("secretKey")); return
 * credentials; } private AmazonSimpleEmailService createSimpleEmailService()
 * throws IOException { return new
 * AmazonSimpleEmailServiceClient(createAwsCredentials()); } public boolean
 * sendTestEmail() throws IOException { System.out.println("bfr sending");
 * PostMan postMan = new AwsPostMan(createSimpleEmailService());
 * System.out.println("aft sending");
 * postMan.withFrom("goutham.eoxys@yahoo.com").withTo("goutham.eoxys@yahoo.com")
 * .withSubject("Email from AWS!!").withBody(
 * "This is a test email from AWS").send(); return true; }
 * 
 * @RequestMapping(value = "/email", method =
 * {RequestMethod.GET,RequestMethod.POST}) public String
 * email(HttpServletRequest req, ModelMap map) throws IOException {
 * System.out.println("emal"); boolean ret=false; ret=new
 * Email().sendTestEmail(); String retView="emailSuccess"; if(ret){
 * map.addAttribute("h1", "Continue"); map.addAttribute("h2",
 * "Request has been sent");
 * map.addAttribute("h3","Your password reset email was sent - check your mail"
 * ); }else{ map.addAttribute("h1", "Retry"); map.addAttribute("h2",
 * "Something went wrong");
 * map.addAttribute("h3","Sorry please retry to request forget password"); }
 * return retView; } }
 */