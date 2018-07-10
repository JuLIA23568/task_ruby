class Project < ApplicationRecord
	
	has_many :tasks, dependent: :destroy
	belongs_to :user
	validates :name, presence: true,
					length: {minimum: 5}

end
