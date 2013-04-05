class Estudiante < ActiveRecord::Base
  belongs_to :curso
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombre
end
