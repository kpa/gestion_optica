class CreateOrdenesTrabajo < ActiveRecord::Migration
  def self.up
    create_table :ordenes_trabajo do |t|
      t.string :descripcion
      t.date :fecha
      t.date :fecha_entrega
      t.integer :numero
      t.decimal :lejos_od_esferico, :precision => 10, :scale => 2, :default => 0
      t.decimal :lejos_od_cilindrico, :precision => 10, :scale => 2, :default => 0
      t.decimal :lejos_od_grados, :precision => 10, :scale => 2, :default => 0
      t.decimal :lejos_oi_esferico, :precision => 10, :scale => 2, :default => 0
      t.decimal :lejos_oi_cilindrico, :precision => 10, :scale => 2, :default => 0
      t.decimal :lejos_oi_grados, :precision => 10, :scale => 2, :default => 0
      t.decimal :lejos_distancia_interpupilar, :precision => 10, :scale => 2, :default => 0
      t.string :lejos_color
      t.string :lejos_armazon
      t.string :lejos_tipo_lente
      t.decimal :cerca_od_esferico, :precision => 10, :scale => 2, :default => 0
      t.decimal :cerca_od_cilindrico, :precision => 10, :scale => 2, :default => 0
      t.decimal :cerca_od_grados, :precision => 10, :scale => 2, :default => 0
      t.decimal :cerca_oi_esferico, :precision => 10, :scale => 2, :default => 0
      t.decimal :cerca_oi_cilindrico, :precision => 10, :scale => 2, :default => 0
      t.decimal :cerca_oi_grados, :precision => 10, :scale => 2, :default => 0
      t.decimal :cerca_distancia_interpupilar, :precision => 10, :scale => 2, :default => 0
      t.string :cerca_color
      t.string :cerca_armazon
      t.string :cerca_tipo_lente
      t.decimal :intermedio_od_esferico, :precision => 10, :scale => 2, :default => 0
      t.decimal :intermedio_od_cilindrico, :precision => 10, :scale => 2, :default => 0
      t.decimal :intermedio_od_grados, :precision => 10, :scale => 2, :default => 0
      t.decimal :intermedio_oi_esferico, :precision => 10, :scale => 2, :default => 0
      t.decimal :intermedio_oi_cilindrico, :precision => 10, :scale => 2, :default => 0
      t.decimal :intermedio_oi_grados, :precision => 10, :scale => 2, :default => 0
      t.decimal :intermedio_distancia_interpupilar, :precision => 10, :scale => 2, :default => 0
      t.string :intermedio_color
      t.string :intermedio_armazon
      t.string :intermedio_tipo_lente
      t.string :bifocal
      t.decimal :altura, :precision => 10, :scale => 2, :default => 0
      t.string :observaciones
      t.decimal :total, :precision => 10, :scale => 2, :default => 0
      t.decimal :senya, :precision => 10, :scale => 2, :default => 0
      t.decimal :saldo, :precision => 10, :scale => 2, :default => 0
      t.string :nombre_doctor
      t.references :cliente

      t.timestamps
    end
  end

  def self.down
    drop_table :ordenes_trabajo
  end
end
