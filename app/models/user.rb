class User < ActiveRecord::Base

  has_many :statuses

  validates :user, presence: true

end
