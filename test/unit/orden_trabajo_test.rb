require File.dirname(__FILE__) + '/../test_helper'

class OrdenTrabajoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
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

