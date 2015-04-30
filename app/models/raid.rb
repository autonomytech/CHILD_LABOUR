class Raid < ActiveRecord::Base
  belongs_to :location
  has_many :child_labours 
end
