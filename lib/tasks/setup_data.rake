task :setup_data => :environment do
	batch = Batch.new
	batch.name = "Batch-1"
	batch.save
	channel = Channel.new
	channel.name = "Public Channel"
	channel.batch_id = batch.id
	channel.save
	user = User.new
	user.name = "admin"
	user.email = "admin@gmail.com"
	user.password = "qwerty"
	user.is_admin = true
	user.save
	student = Student.new
	student.name = user.name
	student.email = user.email
	student.batch_id = batch.id
	student.save
	user.student_id = student.id
	user.save
	subscription = Subscription.new
	subscription.channel_id = Channel.find_by(name: "Public Channel").id
	subscription.student_id = student.id
	subscription.save	
end
