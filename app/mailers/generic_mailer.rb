class GenericMailer < ActionMailer::Base

  def privacy_email(contact_form)
    @contact = contact_form
    mail(from: contact_form.email, :to => "support@ibpal.com", :subject => "Privacy Email from IBPAL")
  end

  def support_email(contact_form)
    @contact = contact_form
    mail(from: contact_form.email, :to => "support@ibpal.com", :subject => "Support Email from IBPAL")
  end

  def earning_email(contact_form)
    @contact = contact_form
    mail(from: contact_form.email, :to => "support@ibpal.com", :subject => "Earning Email from IBPAL")
  end

end
