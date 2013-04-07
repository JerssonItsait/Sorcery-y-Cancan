class Materia < ActiveRecord::Base

  validates :nombre, :presence => true,
  :length => { :maximum => 30 }

  
  has_many :horarios

  attr_accessible :nombre

  	def self.search(search)
	   where('nombre like ?', "%#{search}%")
	end

end
