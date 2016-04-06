class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :rol, type: String, default: 'assistant'
  field :email, type: String
  field :gender
  field :welcome_sent, type: Boolean, default: false

  validates_presence_of :name, :rol, :email
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  scope :by_rol, lambda{|rol| where(rol: rol)}

  def first_name
    name.present? ? name.split(' ')[0].capitalize : ''
  end

end
