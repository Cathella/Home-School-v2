class Contact < ApplicationRecord

  validates_presence_of :name, :address, :phone, :user, :message
end
