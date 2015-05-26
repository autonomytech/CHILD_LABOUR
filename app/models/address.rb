class Address < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
  belongs_to :child
  validates_presence_of :address_line_1, :city, :state, :pincode

  validates :address_line_1,presence: true,length: { minimum: 1, maximum: 40 }

  validates :city, presence: true,length: { minimum: 1, maximum: 30 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/, message: 'allows only letters' }

  validates :state, presence: true,length: { minimum: 1, maximum: 30 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/, message: 'allows only letters' }


end
