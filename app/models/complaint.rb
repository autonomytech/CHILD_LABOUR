class Complaint < ActiveRecord::Base
  belongs_to :employer
  has_many :raids
  accepts_nested_attributes_for :employer
end
