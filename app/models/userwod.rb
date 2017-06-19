class Admin::Userwod < ActiveRecord::Base

	belongs_to :user

	validates :name, presence: true
	validates :result, numericality: true

	scope :pr, -> {where(pr: true)}
end	
