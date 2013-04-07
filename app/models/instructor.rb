class Instructor < ActiveRecord::Base

  validates :nombres, :presence => true,
  :length => { :maximum => 80 }
  
  validates :email, :presence => true,
  :uniqueness => true,
  :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :cedula, :presence => true,
  :length => { :minimum => 6, :maximum => 15 },
  :numericality => true


  has_many :horarios
  
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombres, :telefono

    def self.search(search)
	   where('nombres like ?', "%#{search}%")
	end

end
