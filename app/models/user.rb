class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable,
         :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

  validates :username, :presence => true, :uniqueness => {
    :case_sensitive => false
  }

  has_and_belongs_to_many :gradeworks
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles
  has_many :feedbacks



  validates :firstname, :lastname, presence: true  

  default_scope {order("users.firstname ASC")}

  scope :order_by_firstname,-> (ord) {order("users.firstname #{ord}")}
  scope :order_by_lastname, -> (ord) {order("users.lastname #{ord}")}
  scope :order_by_email, -> (ord) {order("users.email #{ord}")}
  scope :order_by_identification, -> (ord) {order("users.identification #{ord}")}


  def ldap_before_save
     self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
     self.firstname = Devise::LDAP::Adapter.get_ldap_param(self.username,"givenname").first
     self.lastname = Devise::LDAP::Adapter.get_ldap_param(self.username,"sn").first
  end


  def full_name
    "#{firstname}  #{lastname}"
  end

  #
  # def admin
  #   roles = self.roles
  #   value = false
  #   for roles.each do |role|
  #       if role.name == "Administrator"
  #         value = true
  #       end
  #   end
  #   value
  # end

  def jury
    joins(:roles).select()
        .where({ roles: { name: "Jury" } })
  end

  def director
    joins(:roles).select()
        .where({ roles: { name: "Director" } })
  end

  def student
    joins(:roles).select()
        .where({ roles: { name: "Student" } })
  end

  def self.users_by_id(id)
    find_by_id(id)
  end

  def self.users_by_firtsname(firstname)
    find_by_firstname(firstname)
  end

 def self.users_by_email(email)
 	find_by_email(email)
  end

  def self.users_by_identification(identification)
  	find_by_identification(identification)
  end

  def self.users_jury()
    joins(:roles).select("users.firstname, users.lastname, users.id")
    .where({ roles: { name: "Jury" } })
  end

  def self.users_student()
    joins(:roles).select("users.firstname, users.lastname, users.id")
    .where({ roles: { name: "Student" } })
  end

  def self.users_director()
    joins(:roles).select("users.firstname, users.lastname, users.id")
    .where({ roles: { name: "Director" } })
  end

  def self.users_administrator()
    joins(:roles).select("users.firstname, users.lastname, users.id")
    .where({ roles: { name: "Administrator" } })
  end

  def self.users_gradework_qualified()
    joins(:gradeworks).select("users.firstname, users.id")
    .where({ gradeworks: { status: "calificado" } })
  end

  def self.users_gradework_unrated()
    joins(:gradeworks).select("users.firstname, users.id")
    .where({ gradeworks: { status: "sin calificar" } })
  end

  def self.users_gradework_qualifying()
    joins(:gradeworks).select("users.firstname, users.id")
    .where({ gradeworks: { status: "calificando" } })
  end

  def self.jury_gradework(id)
    joins(:gradeworks).select("users.id, users.firstname")
        .where({ gradeworks: { id: id } })
  end

  

end
