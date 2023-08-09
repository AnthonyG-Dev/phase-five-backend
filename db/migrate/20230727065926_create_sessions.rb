class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :start
      t.string :end
      t.string :link
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
