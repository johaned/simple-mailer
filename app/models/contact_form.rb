class ContactForm
  include ActiveAttr::Model

  attribute :rol, default: 'attendees'
  attribute :message
  attribute :subject

  validates_presence_of :message, :rol, :subject

  def send_it
    if valid?
      GenericMailer.send_common_email(self)
    end
  end
end
