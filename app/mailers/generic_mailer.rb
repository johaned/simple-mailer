class GenericMailer < ActionMailer::Base

  def common_email(contact_form)
    @contact = contact_form
    emails = Person.by_rol(@contact.rol)
    mail(from: 'rails.girls@codescrum.com', :to => emails, :subject => @contact.email_subject)
  end

end
