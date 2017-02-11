class Domain < ActiveRecord::Base
  belongs_to :user
  has_many :ranks, dependent: :destroy
  validates_uniqueness_of :name, scope: :user_id, message: "You alredy entered that domain"
  validate :user_quota, on: :create
  
  def user_quota
    errors.add(:base, 'OOps!!! You have Exceeded maximum domain limit/user (3)')  if self.user.domains(:reload).count >= 3
  end
end
