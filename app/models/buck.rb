class Buck < ActiveRecord::Base
	validates :goes_to, :value, :description, presence: true
	validates :description, length: {maximum: 140}
	validates :value, numericality: {only_integer: true, greater_than: 0}
end
