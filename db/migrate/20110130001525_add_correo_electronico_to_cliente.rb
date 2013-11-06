class AddCorreoElectronicoToCliente < ActiveRecord::Migration
  def self.up
    add_column :clientes, :correo_electronico, :string
  end

  def self.down
    remove_column :clientes, :correo_electronico
  end
end
