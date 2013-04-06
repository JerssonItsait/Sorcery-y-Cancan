class Curso < ActiveRecord::Base

  validates :ficha, :presence => true,
  :length => { :maximum => 10 }

  validates :nombre, :presence => true,
  :length => { :maximum => 80 }

  attr_accessible :ficha, :nombre
  
  	def self.search(search)
	   where('nombre like ?', "%#{search}%")
	end

end
