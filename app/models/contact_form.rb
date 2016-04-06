class ContactForm
  include ActiveAttr::Model
  include ActiveAttr::TypecastedAttributes

  attribute :rol, default: 'attendees'
  attribute :message
  attribute :subject
  attribute :welcome, type: Boolean

  validates_presence_of :message, :rol, :subject

  def send_it
    if valid?
      GenericMailer.send_common_email(self)
    end
  end
end
