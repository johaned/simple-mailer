class Person
  include Mongoid::Document
  field :name, type: String
  field :rol, type: String
  field :email, type: String
end
