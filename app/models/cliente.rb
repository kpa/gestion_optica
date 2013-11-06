class Cliente < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  validates_presence_of :nombre, :apellidos
  validates_uniqueness_of :nombre, :scope => :apellidos
  validates_uniqueness_of :correo_electronico, :allow_blank => true
#  validates_format_of :correo_electronico, :with => ValidateEmail::EmailRegexp
  validates_format_of :correo_electronico, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true

  has_many :ordenes_trabajo

  def self.search(search, page)
    paginate(
      :page => page,
      :conditions => [
        'nombre LIKE ?
        OR apellidos LIKE ?
        OR CONCAT(nombre, \' \', apellidos) LIKE ?
        OR CONCAT(apellidos, \', \', nombre) LIKE ?
        OR domicilio LIKE ?
        OR telefono LIKE ?
        OR correo_electronico LIKE ?
        OR localidad LIKE ?',
        "%#{search}%", "%#{search}%", "%#{search}%", 
        "%#{search}%", "%#{search}%", "%#{search}%",
        "%#{search}%", "%#{search}%"]
    )
  end
end


# == Schema Information
#
# Table name: clientes
#
#  id                 :integer(4)      not null, primary key
#  nombre             :string(255)
#  domicilio          :string(255)
#  telefono           :string(255)
#  localidad          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  apellidos          :string(255)
#  correo_electronico :string(255)
#

