class ChildLabour < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
end
