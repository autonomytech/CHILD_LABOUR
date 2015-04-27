class CommunityFarm < ActiveRecord::Base
  belongs_to :raid
  belongs_to :department
end
