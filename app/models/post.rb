class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :tobao

	# scope :search, -> (key){where("title like '%?%'", key) }
end
