class ChildLabour < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
  has_many :answers
  accepts_nested_attributes_for :employer
  accepts_nested_attributes_for :answers

  def submited_by_user
    User.full_name(submited_by)
  end
end
