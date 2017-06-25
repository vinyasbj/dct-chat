class Channel < ActiveRecord::Base
	has_many :messages
	belongs_to :batch
	has_many :subscriptions
	has_many :students,through: :subscriptions
	
end
