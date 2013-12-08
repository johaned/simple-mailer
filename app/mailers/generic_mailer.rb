class GenericMailer < ActionMailer::Base

  def common_email(contact_form)
    @contact = contact_form
    emails = Person.by_rol(@contact.rol).map{|person| person.email}
    mail(from: 'rails.girls@codescrum.com', :to => emails, :subject => @contact.subject)
  end

end
