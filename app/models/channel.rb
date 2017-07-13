class Channel < ActiveRecord::Base
	has_many :messages
	belongs_to :batch
	has_many :subscriptions
	has_many :students,through: :subscriptions
	belongs_to :user
	validates_presence_of :name ,:batch_id
	validates_numericality_of :batch_id


end
