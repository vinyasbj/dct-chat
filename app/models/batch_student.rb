class BatchStudent < ActiveRecord::Base
	belongs_to :batch
	belongs_to :student
end
