class AddFechaRecetaToOrdenTrabajo < ActiveRecord::Migration
  def self.up
    add_column :ordenes_trabajo, :fecha_receta, :date
  end

  def self.down
    remove_column :ordenes_trabajo, :fecha_receta
  end
end
