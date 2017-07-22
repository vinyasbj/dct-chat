class Channel < ActiveRecord::Base
	has_many :messages
	belongs_to :batch
	has_many :subscriptions
	has_many :students,through: :subscriptions
	belongs_to :user
	validates_presence_of :name ,:batch_id
	validates_numericality_of :batch_id

	def remaining_students
		remaining_students = self.batch.students.pluck(:id) - self.subscriptions.with_deleted.pluck(:student_id)
		Student.where(id: remaining_students)
	end

	def unsubscribed_students
		remaining_students = Subscription.only_deleted.where('channel_id = ?', self.id).pluck(:student_id)
		Student.where(id: remaining_students)
	end
end
