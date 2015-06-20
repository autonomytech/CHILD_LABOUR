class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :timeoutable
  belongs_to :role
  belongs_to :department

   validates :first_name,presence: true,length: { minimum: 1, maximum: 20 }
    
   validates :middle_name, length: { minimum: 1, maximum: 20 },allow_blank: true

   validates :last_name,presence: true,length: { minimum: 1, maximum: 20 }

   validates :contact_no,presence: true, numericality: true, length: { is: 10 }

  
  def admin?
    true if role.role.eql? 'Admin'
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def roles
    role.role if role
  end

  def departments
    department.name
  end

  def self.japu_users
    where(is_deleted: false, community_id: 1)
  end

  def self.full_name(id)
    find(id).full_name
  end

  def self.email(id)
    find(id).email
  end
end
