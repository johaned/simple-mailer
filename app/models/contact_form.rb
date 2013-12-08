class ContactForm
  include ActiveAttr::Model

  attribute :rol, default: 'attendees'
  attribute :message
  attribute :email_subject

  validates_presence_of :message, :rol, :email_subject

  def format_sender
    %("#{name}" <#{email}>)
  end

  def send_it
    if valid?
      GenericMailer.common_email(self).deliver
    end
  end
end
