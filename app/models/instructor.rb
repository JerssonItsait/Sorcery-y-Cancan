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
  
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombres, :telefono, :apellidos, :materia_id, :avatar

  has_attached_file :avatar, :styles => { :small => "150x150>", :lsmall => "30x30>" }

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  
    def self.search(search)
	   where('nombres like ? or cedula like ? or telefono like ? or email like ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end

end
