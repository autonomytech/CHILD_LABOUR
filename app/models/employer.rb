class Employer < ActiveRecord::Base
	has_many :child_labours
end
