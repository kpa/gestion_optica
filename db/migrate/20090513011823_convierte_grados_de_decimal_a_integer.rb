# -*- encoding : utf-8 -*-
class ConvierteGradosDeDecimalAInteger < ActiveRecord::Migration
  def self.up
    change_column :ordenes_trabajo, :lejos_od_grados, :integer, :default => 0
    change_column :ordenes_trabajo, :lejos_oi_grados, :integer, :default => 0

    change_column :ordenes_trabajo, :intermedio_od_grados, :integer, :default => 0
    change_column :ordenes_trabajo, :intermedio_oi_grados, :integer, :default => 0

    change_column :ordenes_trabajo, :cerca_od_grados, :integer, :default => 0
    change_column :ordenes_trabajo, :cerca_oi_grados, :integer, :default => 0
  end

  def self.down
    change_column :ordenes_trabajo, :lejos_od_grados, :decimal, :default => 0, :precision => 10, :scale => 2
    change_column :ordenes_trabajo, :lejos_oi_grados, :decimal, :default => 0, :precision => 10, :scale => 2

    change_column :ordenes_trabajo, :intermedio_od_grados, :decimal, :default => 0, :precision => 10, :scale => 2
    change_column :ordenes_trabajo, :intermedio_oi_grados, :decimal, :default => 0, :precision => 10, :scale => 2

    change_column :ordenes_trabajo, :cerca_od_grados, :decimal, :default => 0, :precision => 10, :scale => 2
    change_column :ordenes_trabajo, :cerca_oi_grados, :decimal, :default => 0, :precision => 10, :scale => 2
  end
end
