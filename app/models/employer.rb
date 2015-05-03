class Employer < ActiveRecord::Base
  has_many :child_labours

  def full_name
    [first_name, last_name].join(' ')
  end

  def raid_title
    return '-' unless child_labours.first
    child_labours.first.raid.title
  end
end
