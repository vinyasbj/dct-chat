class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end
	def create 
		# @message = Message.create!(params[:message])
		@message = Message.new(params[:message].permit(:content,:channel_id))
		@message.save
		
	end
end
