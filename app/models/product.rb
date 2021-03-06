class Product < ApplicationRecord
	has_many :orders
	has_many :comments

	validates :name, presence: true 
	validates :description, presence: true
	validates :price, presence: true
	
	def self.search(search_term)
		if Rails.env.development?
    	Product.where("name LIKE ?", "%#{search_term}%")
    else 
    	Product.where("name ilike ?", "%#{search_term}%")
    end 
	end

	def highest_rating_comment
  	comments.rating_desc.first
  end
  def lowest_rating_comment
    comments.rating_desc.last
  end
  def average_rating
    comments.average(:rating).to_f
  end
  
  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end
  def viewed!
  	$redis.incr("product:#{id}") # this is equivalen to 'INC product:1'
  end

  
end
