class Message < ActiveRecord::Base
	 # attr_accessible :content
	 belongs_to :channel
	 validates_presence_of :content

	 belongs_to :user
end
