class Child < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
  has_many :answers
  has_many :addresses
  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :addresses
  validates_presence_of :first_name, :last_name, :age, :father_name\
    , :mother_name

  def submited_by_user
    User.full_name(submited_by)
  end

  def self.child_labour
    where(is_deleted: false, is_child_begger: false)
  end

  def self.child_begger
    where(is_deleted: false, is_child_begger: true)
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def address
    add = addresses.last
    return unless add
    [add.address_line_1, add.address_line_2, add.city, add.state, add.pincode].join(',')
  end
end
