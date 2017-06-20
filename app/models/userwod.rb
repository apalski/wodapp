class Userwod < ActiveRecord::Base

	belongs_to :user

	validates :name, :result, :cftype, presence: true
	validates :result, numericality: true

	scope :by_pr, -> {where(pr: true)}
end	
