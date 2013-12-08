class ContactForm
  include ActiveAttr::Model

  attribute :rol, default: 'attendees'
  attribute :message
  attribute :subject

  validates_presence_of :message, :rol, :subject

  def send_it
    if valid?
      GenericMailer.common_email(self).deliver
    end
  end
end
