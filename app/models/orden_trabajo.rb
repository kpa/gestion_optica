class OrdenTrabajo < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :cliente
  before_save :calcula_saldo
  before_create :calcula_numero
  
  validates_presence_of :cliente
  
  def calcula_saldo
    self.saldo = self.total.to_i - self.senya.to_i
  end
  
  def calcula_numero
    antiguo_numero = OrdenTrabajo.maximum(:numero) || 0
    self.numero = antiguo_numero + 1
  end

  def self.search(search, page)
    paginate :page => page, :include => :cliente, :conditions => ['descripcion LIKE ? OR numero LIKE ? OR clientes.nombre LIKE ? OR clientes.domicilio LIKE ? OR clientes.telefono LIKE ? OR clientes.localidad LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"]
  end
end



# == Schema Information
#
# Table name: ordenes_trabajo
#
#  id                                :integer(4)      not null, primary key
#  descripcion                       :string(255)
#  fecha                             :date
#  fecha_entrega                     :date
#  numero                            :integer(4)
#  lejos_od_esferico                 :decimal(10, 2)  default(0.0)
#  lejos_od_cilindrico               :decimal(10, 2)  default(0.0)
#  lejos_od_grados                   :integer(4)      default(0)
#  lejos_oi_esferico                 :decimal(10, 2)  default(0.0)
#  lejos_oi_cilindrico               :decimal(10, 2)  default(0.0)
#  lejos_oi_grados                   :integer(4)      default(0)
#  lejos_distancia_interpupilar      :decimal(10, 2)  default(0.0)
#  lejos_color                       :string(255)
#  lejos_armazon                     :string(255)
#  lejos_tipo_lente                  :string(255)
#  cerca_od_esferico                 :decimal(10, 2)  default(0.0)
#  cerca_od_cilindrico               :decimal(10, 2)  default(0.0)
#  cerca_od_grados                   :integer(4)      default(0)
#  cerca_oi_esferico                 :decimal(10, 2)  default(0.0)
#  cerca_oi_cilindrico               :decimal(10, 2)  default(0.0)
#  cerca_oi_grados                   :integer(4)      default(0)
#  cerca_distancia_interpupilar      :decimal(10, 2)  default(0.0)
#  cerca_color                       :string(255)
#  cerca_armazon                     :string(255)
#  cerca_tipo_lente                  :string(255)
#  intermedio_od_esferico            :decimal(10, 2)  default(0.0)
#  intermedio_od_cilindrico          :decimal(10, 2)  default(0.0)
#  intermedio_od_grados              :integer(4)      default(0)
#  intermedio_oi_esferico            :decimal(10, 2)  default(0.0)
#  intermedio_oi_cilindrico          :decimal(10, 2)  default(0.0)
#  intermedio_oi_grados              :integer(4)      default(0)
#  intermedio_distancia_interpupilar :decimal(10, 2)  default(0.0)
#  intermedio_color                  :string(255)
#  intermedio_armazon                :string(255)
#  intermedio_tipo_lente             :string(255)
#  bifocal                           :string(255)
#  altura                            :decimal(10, 2)  default(0.0)
#  observaciones                     :string(255)
#  total                             :decimal(10, 2)  default(0.0)
#  senya                             :decimal(10, 2)  default(0.0)
#  saldo                             :decimal(10, 2)  default(0.0)
#  nombre_doctor                     :string(255)
#  cliente_id                        :integer(4)
#  created_at                        :datetime
#  updated_at                        :datetime
#  fecha_receta                      :date
#

