class Instructor < ActiveRecord::Base
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombres, :telefono
end
