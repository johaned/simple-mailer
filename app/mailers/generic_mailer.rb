class GenericMailer < ActionMailer::Base

  def self.send_common_email(contact_form)
    @contact = contact_form
    recipients = Person.by_rol(@contact.rol)
    recipients.each do |recipient|
      common_email(recipient, @contact).deliver
    end
  end

  def common_email(recipient, contact)
    @recipient = recipient
    @contact = contact
    mail(from: 'rails.girls@codescrum.com', :to => @recipient.email, :subject => @contact.subject)
  end

end
