class Complaint < ActiveRecord::Base
  belongs_to :employer
  has_many :raids
  accepts_nested_attributes_for :employer
  validates_presence_of :first_name, :last_name, :contact_no\
    , :email, :area
  validates :contact_no, numericality: true, length: { is: 10 }
end
