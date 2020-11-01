class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :role, default: "patient", null: false

      t.timestamps null: false
    end
  end
end
