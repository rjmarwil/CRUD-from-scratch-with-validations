class Status < ActiveRecord::Base

 has_many :likes
 belongs_to :user

 validates :status, presence: true

end
