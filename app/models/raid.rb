class Raid < ActiveRecord::Base
  belongs_to :location
  has_many :children
  has_many :community_farms
  has_many :employers

  def community_farm_status
    return 'Pending' if community_farms.blank?
    return 'Pending' if community_farms.first.involve_member.blank?
    'Completed'
  end

  def community_farm_blank?
    return true if community_farms.blank?
    false
  end

  def child_labours_count
    children.where(is_deleted: false, is_child_begger: false).count
  end

  def child_beggers_count
    children.where(is_deleted: false, is_child_begger: true).count
  end

  def child_labours_blank?
    return true if childlabours.blank?
    false
  end

  def employer_name
    return '-' if employers.where(is_deleted: false).first.blank?
    employers.where(is_deleted: false).first.full_name
  end

  def employer_address
    return '-' if employers.first.blank?
    employers.first.address
  end

  def self.year_wise_report(year)
    all.select \
    { |d| (d.datetime.strftime('%Y').eql? year) && (d.childlabours.present?) }
  end

  def self.years
    all.collect { |d| d.datetime.strftime('%Y') }.uniq.sort
  end

  def department
    return unless location.departments.present?
    location.departments.first.name
  end

  def childlabours
    children.where(is_deleted: false, is_child_begger: false)
  end

  def childbeggers
    children.where(is_deleted: false, is_child_begger: true)
  end

  def child_begger?
    return true if raid_for.eql? CHILD_BEGGER
    false
  end
end
