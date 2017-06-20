class Usermovement < ActiveRecord::Base

	belongs_to :user
	
	validates :name, :result, :type, presence: true
	validates :result, numericality: true

	scope :by_pr, -> {where(pr: true)}
end
