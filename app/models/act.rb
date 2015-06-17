class Act < ActiveRecord::Base
  belongs_to :law
  has_many :sections

  def section_ids
    sections.pluck(:id)
  end
end
