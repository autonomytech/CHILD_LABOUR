class Law < ActiveRecord::Base
  has_many :acts
  has_many :sections, through: :acts

  def act_ids
    acts.pluck(:id)
  end

  def section_ids
    sections.pluck(:id)
  end
end
