class Raid < ActiveRecord::Base
  belongs_to :location
  has_many :children
  has_many :community_farms
  has_many :employers
  belongs_to :complaint

  def community_farm_status
    return 'प्रलंबित' if community_farms.blank?
    return 'प्रलंबित' if community_farms.first.involve_member.blank?
    'पूर्ण'
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

  def self.cl_year_wise_report(year)
    where(raid_for: CHILD_LABOUR).select \
    { |d| (d.datetime.strftime('%Y').eql? year) && (d.childlabours.present?) }
  end

  def self.cb_year_wise_report(year)
    where(raid_for: CHILD_BEGGER).select \
    { |d| (d.datetime.strftime('%Y').eql? year) && (d.childbeggers.present?) }
  end

  def self.child_labours_years
    where(raid_for: CHILD_LABOUR).collect { |d| d.datetime.strftime('%Y') }.uniq.sort
  end

  def self.child_beggers_years
    where(raid_for: CHILD_BEGGER).collect { |d| d.datetime.strftime('%Y') }.uniq.sort
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

  def location_name
    location.name if location
  end

  def self.user_raid_attained(user_id)
    raid_ids = []
    community_farms = CommunityFarm.all
    community_farms.each do |cf|
      next unless cf.involve_member.include? user_id.to_s
      raid_ids << cf.raid.id
    end
    where(id: raid_ids)
  end
end
