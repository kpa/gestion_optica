class CreatePrescriptionDistances < ActiveRecord::Migration
  def change
    create_table :prescription_distances do |t|
      t.string :name

      t.timestamps
    end
  end
end
