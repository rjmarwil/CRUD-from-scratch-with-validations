class User < ActiveRecord::Base

  has_many :status

  validates :user, presence: true

end
