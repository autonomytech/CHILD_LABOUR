class ChildLabour < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
  accepts_nested_attributes_for :employer
end
