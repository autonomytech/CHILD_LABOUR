class Address < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
  belongs_to :child
  validates_presence_of :address_line_1, :city, :state, :pincode
end
