class Contact < ApplicationRecord
  validates_presence_of :name, :address, :email, :user, :message
end
