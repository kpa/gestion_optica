class CreateEyeglassesTypes < ActiveRecord::Migration
  def change
    create_table :eyeglasses_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
