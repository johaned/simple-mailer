class GenericMailer < ActionMailer::Base

  def common_email(contact_form)
    @contact = contact_form
    mail(from: contact_form.email, :to => "support@ibpal.com", :subject => "Privacy Email from IBPAL")
  end

end
