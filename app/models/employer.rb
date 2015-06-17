class Employer < ActiveRecord::Base
  has_many :children
  has_many :addresses
  belongs_to :raid
  has_many :complaints
  has_many :attachments
  has_many :employer_sections
  accepts_nested_attributes_for :addresses

  validates :first_name,presence: true,length: { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/, message: 'allows only letters' }

  validates :middle_name,length: { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/, message: 'allows only letters' }, allow_blank: true

  validates :last_name,presence: true,length: { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/, message: 'allows only letters' }

  validates_presence_of :first_name, :last_name, :contact_no

  validates :contact_no, presence: true, numericality: true, length: { is: 10 }


  def full_name
    [first_name, last_name].join(' ')
  end

  def address
    add = addresses.last
    return unless add
    [add.address_line_1, add.address_line_2, add.city, add.state, add.pincode].join(',')
  end
end
