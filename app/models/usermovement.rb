class Usermovement < ActiveRecord::Base

	belongs_to :user
	
	validates :name, :result, presence: true
	validates :result, numericality: true

	scope :pr, -> {where(pr: true)}
end
