class Horario < ActiveRecord::Base

  validates :aula, :presence => true
  
  validates :dia, :presence => true


  belongs_to :materia
  belongs_to :instructor
  belongs_to :curso
  attr_accessible :aula, :dia, :hora

  	def self.search(search)
	   where('dia like ?', "%#{search}%")
	end

end
