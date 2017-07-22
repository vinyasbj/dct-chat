	class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  	has_many :messages
 	belongs_to :student
	has_many :subscriptions 
	has_many :channels
	after_create :get_subscription

	def get_subscription
			student = Student.new
			student.name = self.name
			student.email = self.email
			# student.mobile =self.mobile
			# student.user_id = self.id
			student.save

			self.student_id = student.id
			self.save

			subscription = Subscription.new
			subscription.channel_id = Channel.find_by(name: "Public Channel").id
			subscription.student_id = student.id

			subscription.save

	end
end
