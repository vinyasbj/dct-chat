class Message < ActiveRecord::Base
	 # attr_accessible :content
	 belongs_to :channel
	 validates_presence_of :content
	 belongs_to :user
	# before_create :block_messages
	 def block_messages(message)
	 	bad_words = ["FUCK","FU","FUCKYOU"]
		# words = @message.content
		words_find = bad_words.find{|n| n == message}
		# binding.pry
		if words_find.nil?
			return "valid"
		end
	 end
end
