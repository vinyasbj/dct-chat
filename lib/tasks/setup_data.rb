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
	user.student_id= 1
	user.is_admin = "true"
	user.save
end