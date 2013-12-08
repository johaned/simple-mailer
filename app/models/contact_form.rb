class ContactForm
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :message
  attribute :email_subject, default: "support"

  validates_presence_of :message, :name
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  with_options tokenizer: lambda { |str| str.scan(/\w+/) }, too_long: "Please limit your text to %{count} words"  do |contact|
    contact.validates_length_of :message, maximum: 500
  end

  def format_sender
    %("#{name}" <#{email}>)
  end

  def send_it
    puts '--> subject email', email_subject
    if valid?
      case email_subject
        when "privacy"
          IbPalMailer.privacy_email(self).deliver
        when "earning"
          IbPalMailer.earning_email(self).deliver
        else
          IbPalMailer.support_email(self).deliver
      end
    end
  end
end
