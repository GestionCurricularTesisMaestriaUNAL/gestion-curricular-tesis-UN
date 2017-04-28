class User < ApplicationRecord

  has_and_belongs_to_many :gradeworks
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles



  validates :firstname, :lastname, :phone, presence: true
  validates :email, :identification, presence: true, uniqueness: true

  default_scope {order("users.firstname ASC")}

  scope :order_by_firstname,-> (ord) {order("users.firstname #{ord}")}
  scope :order_by_lastname, -> (ord) {order("users.lastname #{ord}")}
  scope :order_by_email, -> (ord) {order("users.email #{ord}")}
  scope :order_by_identification, -> (ord) {order("users.identification #{ord}")}





  def full_name
    "#{firstname}  #{lastname}"
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

  

end
