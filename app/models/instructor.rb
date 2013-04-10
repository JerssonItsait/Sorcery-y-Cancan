class Instructor < ActiveRecord::Base

  validates :nombres, :presence => true,
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
  :length => { :minimum => 7, :maximum => 15 },
  :numericality => true


  has_many :horarios
  belongs_to :materia
  
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombres, :telefono, :apellidos, :materia_id

    def self.search(search)
	   where('nombres like ? or cedula like ? or telefono like ? or email like ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end

end
