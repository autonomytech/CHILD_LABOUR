class Role < ActiveRecord::Base
  has_many :users
  validates :role,length: { minimum: 1, maximum: 20 }
end
