class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :nombre
      t.string :domicilio
      t.string :telefono
      t.string :localidad

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
