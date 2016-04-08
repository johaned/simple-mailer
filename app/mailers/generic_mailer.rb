class GenericMailer < ActionMailer::Base
  def self.send_common_email(contact_form)
    recipients = Person.by_rol(contact_form.rol)
    recipients = contact_form.welcome ? recipients.where(welcome_sent: false) : recipients
    # binding.pry
    recipients.each do |recipient|
      common_email(recipient, contact_form).deliver
      recipient.update_attribute(:welcome_sent, true) if contact_form.welcome
    end
  end

  def common_email(recipient, contact)
    @recipient = recipient
    @contact = contact
    mail(from: 'cali@railsgirls.com', :to => @recipient.email, :subject => @contact.subject)
  end
end
