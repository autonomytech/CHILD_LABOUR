class Complaint < ActiveRecord::Base
  belongs_to :employer
  has_many :raids
  accepts_nested_attributes_for :employer
  
  validates :first_name,presence: true,length: { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z
    
   validates :middle_name, length: { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/}, allow_blank: true

   validates :last_name,presence: true,length: { minimum: 1, maximum: 20 }, format: \
  { with: /\A[a-zA-Z_" "-]+\Z/}

  validates :contact_no, presence: true, numericality: { only_integer: true }, length: \
  { minimum: 10, maximum: 10 }



  
  validates :contact_no, numericality: true, length: { is: 10 }
end
