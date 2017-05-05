class Feedback < ApplicationRecord

  belongs_to :user
  belongs_to :gradework

  validates :score, :anotations, presence: true
  
  scope :order_by_score, -> (ord) {order("feedbacks.score #{ord}")}
  
  def self.users_by_score(score)
    find_by_score(score)
  end
  
  def self.load_feedbacks()
    includes(:gradework)
  end
  
  def self.feedback_by_id(id)
    includes(:gradework)
      .find_by_id(id)
  end
  
  def self.feedback_by_user(user)
    includes(:user)
      .find_by_user_id(user)
  end
  
  def self.feedback_by_gradework(gradework)
    includes(:gradework)
      .find_by_gradework_id(gradework)
  end
  
    
  # def self.feedbacks_gradework(id)
	# joins(:gradework).select("feedbacks.anotations")
	# .where({ gradework: {id: id}})
  # end
    
  def self.feedbacks_jury()
	includes(user: [:roles])
	.where(roles: {name: "Jury"})
  end
  
  # def self.feedbacks_jury(id)
	# includes(user: [:roles])
	# .where(user: {id: id})
  # end


  def self.feedbacks_by_role(type)
    includes(user: [:roles])
        .where(roles: {name:type })
  end

  def self.feedbacks_director()
	includes(user: [:roles])
	.where(roles: {name: "Teacher"})
  end
  
  def self.feedbacks_administrator()
	includes(user: [:roles])
	.where(roles: {name: "Administator"})
  end
  
  def self.feedbacks_student()
	includes(user: [:roles])
	.where(roles: {name: "Student"})
  end

  #def self.feed_user(id)
   # includes(:user)
    #.where({ user: { id: id } })
  #end

  def self.feedback_user(user)
    joins(:user)
      .where({ user: { id: user } })
  end



  
end
