class Address < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
  belongs_to :child
end
