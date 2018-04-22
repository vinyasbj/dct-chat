class MessagesController < ApplicationController
	
	
	def index
		@messages = Message.all
	end
	def create
		# @message = Message.create!(params[:message])
		 @message = Message.new(params[:message].permit(:content,:user_id,:channel_id))
		#@message = Message.new(message_params)
		#@message = current_user.messages.build(message_params)
		@message.user_id = current_user.id
	
		msg = @message.block_messages(@message.content)
		if msg =="valid"
			@message.save
		end
	end
	# privatee
	# def message_params
 #    	params.require(:message).permit(:content,:user_id,:channel_id)
 #  	end
end
