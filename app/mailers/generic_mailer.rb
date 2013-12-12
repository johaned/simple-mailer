class GenericMailer < ActionMailer::Base

  def self.send_common_email(contact_form)
    recipients = Person.by_rol(contact_form.rol)
    recipients.each do |recipient|
      common_email(recipient, contact_form).deliver
    end
  end

  def common_email(recipient, contact)
    @recipient = recipient
    @contact = contact
    mail(from: 'rails.girls@codescrum.com', :to => @recipient.email, :subject => @contact.subject)
  end

end
