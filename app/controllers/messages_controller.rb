class MessagesController < ApplicationController
	# before_action :check_is_admin , except: [:index , :show, :create]

	def index
		@messages = Message.all
	end
	def create
		# @message = Message.create!(params[:message])
		 @message = Message.new(params[:message].permit(:content,:user_id,:channel_id))
		#@message = Message.new(message_params)
		#@message = current_user.messages.build(message_params)
		@message.user_id = current_user.id
		@message.save
	end
	# private
	# def message_params
 #    	params.require(:message).permit(:content,:user_id,:channel_id)
 #  	end
end
