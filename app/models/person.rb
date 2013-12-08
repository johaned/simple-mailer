class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String, default: 'assistant'
  field :rol, type: String
  field :email, type: String

  validates_presence_of :name, :rol, :email
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  scope :by_rol, lambda{|rol| where(rol: rol)}

end
