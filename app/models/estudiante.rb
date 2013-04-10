class Estudiante < ActiveRecord::Base

  validates :nombre, :presence => true,
  :length => { :maximum => 40 }

  validates :apellidos, :presence => true,
  :length => { :maximum => 40 }
  
  validates :email, :presence => true,
  :uniqueness => true,
  :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :cedula, :presence => true,
  :length => { :minimum => 6, :maximum => 15 },
  :numericality => true

  validates :telefono, :presence => true,
  :length => { :minimum => 7,:maximum => 15 },
  :numericality => true

  belongs_to :curso
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombre, :apellidos, :telefono, :curso_id

	def self.search(search)
	   where('nombre like ?  or email like ? or cedula like ? or telefono like ?',  "%#{search}%", "%#{search}%", "%#{search}%",  "%#{search}%")
	end
	
end
