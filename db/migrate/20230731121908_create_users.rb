class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.belongs_to :course, null: false, foreign_key: true
      t.string :avatar
      t.string :role

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
