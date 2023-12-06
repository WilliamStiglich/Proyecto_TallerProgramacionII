/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

/*public class EmailSender {

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;
    private static final String SMTP_USERNAME = "lpviernes9@gmail.com";
    private static final String SMTP_PASSWORD = "tnnatamjmnxrekfw";

    public static void sendEmailWithLink(String recipientEmail) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("RESET DE CONTRASEÑA - TEMPLATE");

            // Aquí puedes construir el contenido del correo
            String link = "http://localhost:8080/SegundoProyectoTemplate/resetPin.jsp";
            String body = "Por favor, haga clic en el siguiente enlace para acceder a la página web de reset: <a href=\"" + link + "\">Enlace</a>";
            message.setContent(body, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Correo enviado con éxito");
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al enviar el correo.");
        }
    }
}*/


public class EmailSender {

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;
    private static final String SMTP_USERNAME = "lpviernes9@gmail.com";
    private static final String SMTP_PASSWORD = "tnnatamjmnxrekfw";

    public static void sendEmailWithLinkAndAttachment(String recipientEmail, String attachmentFilePath) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("RESET DE CONTRASEÑA - TEMPLATE");
            // Construir el contenido del correo
         
            String body = "Estimado Cliente:\n" +
"Le informamos que se ha registrado la operación detallada en el adjunto, que se realizó en Comercial San Sum";
            message.setContent(body, "text/html; charset=utf-8");

            // Adjuntar el archivo PDF
            MimeBodyPart attachmentPart = new MimeBodyPart();
            DataSource source = new FileDataSource(attachmentFilePath);
            attachmentPart.setDataHandler(new DataHandler(source));
            attachmentPart.setFileName("report1.pdf");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(attachmentPart);

            // Agregar el cuerpo del mensaje al multipart
            MimeBodyPart bodyPart = new MimeBodyPart();
            bodyPart.setContent(body, "text/html; charset=utf-8");
            multipart.addBodyPart(bodyPart);

            // Establecer el contenido del mensaje como el multipart
            message.setContent(multipart);

            // Enviar el correo
            Transport.send(message);

            System.out.println("Correo enviado con éxito");
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al enviar el correo.");
        }
    }

    public static void sendEmailWithLink(String recipientEmail) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
