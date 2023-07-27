class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.text :content
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
