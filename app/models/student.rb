class Student < ActiveRecord::Base
	has_many :subscriptions
	has_one :user
	belongs_to :batch


	has_many :batch_students
	has_many :students ,through: :batch_students

	# validates_presence_of :name ,:email ,:mobile
	# validates_numericality_of :mobile
	# validates_length_of :mobile , maximum: 10
end
