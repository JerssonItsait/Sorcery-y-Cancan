class Horario < ActiveRecord::Base

  validates :aula, :presence => true
  
  validates :dia, :presence => true


  belongs_to :materia
  belongs_to :instructor
  belongs_to :curso
  attr_accessible :aula, :dia, :hora, :materia_id, :instructor_id, :curso_id

  	def self.search(search)
	   where('aula like ?', "%#{search}%")
	end

end
