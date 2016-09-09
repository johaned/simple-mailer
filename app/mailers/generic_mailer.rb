class GenericMailer < ActionMailer::Base
  def self.send_common_email(contact_form)
    recipients = Person.by_rol(contact_form.rol)
    recipients.each do |recipient|
      common_email(recipient, contact_form).deliver_now!
    end
  end

  def common_email(recipient, contact)
    @recipient = recipient
    @contact = contact
    email_provider = YAML.load(File.read("#{Rails.root}/config/email_provider.yml"))['development']
    mail(from: email_provider['account'], to: @recipient.email, subject: @contact.subject)
  end
end
