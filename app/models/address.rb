class Address < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
  belongs_to :child

  validates :address_line_1,presence: true,length: { minimum: 1, maximum: 150}
  validates :address_line_2,length: { minimum: 1, maximum: 150 }, allow_blank: true
  validates :city, presence: true,length: { minimum: 1, maximum: 30 }
  validates :state, presence: true,length: { minimum: 1, maximum: 30 }
  validates :pincode, presence: true, numericality: { only_integer: true }, length: \
  { minimum: 6, maximum: 6}
end
