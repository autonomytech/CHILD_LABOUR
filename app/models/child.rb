class Child < ActiveRecord::Base
  belongs_to :employer
  belongs_to :raid
  has_many :answers
  has_many :addresses
  has_many :attachments
  validates :first_name, presence: true
  accepts_nested_attributes_for :addresses
  validates_presence_of  :last_name, :age, :father_name\
    , :mother_name
  validate :child_already_present

  def submited_by_user
    User.full_name(submited_by)
  end

  def child_already_present
    return unless (child = Child.where(first_name: first_name\
      , last_name: last_name, father_name: father_name\
      , mother_name: mother_name).take)
    return if child.id.eql? id
    errors.add(:first_name, CHILD_ALREADY_PRESENT)
  end

  def self.child_labour
    where(is_deleted: false, is_child_begger: false)
  end

  def self.child_begger
    where(is_deleted: false, is_child_begger: true)
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def address
    add = addresses.last
    return unless add
    [add.address_line_1, add.address_line_2, add.city, add.state, add.pincode].join('] ')
  end

  def ans(q_id)
    return '' unless (ans = answers.where(question_id: q_id).take)
    ans.answer
  end

  def ans_yes_no(q_id)
    return unless (ans = answers.where(question_id: q_id).take)
    return true if ans.answer.eql? YES
    false
  end
end

