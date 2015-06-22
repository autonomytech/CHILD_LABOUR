class Complaint < ActiveRecord::Base
  belongs_to :employer
  has_many :raids
  
  validates :first_name,presence: true,length: { minimum: 1, maximum: 20 }    
  validates :last_name,presence: true,length: { minimum: 1, maximum: 20}
  validates :first_name,presence: true,length: { minimum: 1, maximum: 20 }
  validates :middle_name, length: { minimum: 1, maximum: 20 }, allow_blank: true
  validates :last_name,presence: true,length: { minimum: 1, maximum: 20}
  validates :contact_no, presence: true, numericality: { only_integer: true }, length: \
  { is: 10}
  validates :email, presence: true,uniqueness: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }
end
