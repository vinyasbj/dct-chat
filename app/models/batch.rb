class Batch < ActiveRecord::Base
	has_many :channels 
	validates_presence_of :name
	has_many :students
	has_many :users
	has_many :batch_students
	has_many :students ,through: :batch_students
end
