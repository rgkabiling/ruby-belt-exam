class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :money
      t.text :description
      t.string :purpose
      t.integer :raised

      t.timestamps null: false
    end
  end
end
