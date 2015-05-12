class Employer < ActiveRecord::Base
  has_many :children
  has_many :addresses
  belongs_to :raid
  accepts_nested_attributes_for :addresses

  def full_name
    [first_name, last_name].join(' ')
  end

  def address
    add = addresses.last
    return unless add
    [add.address_line_1, add.address_line_2, add.city, add.state, add.pincode].join(',')
  end
end
