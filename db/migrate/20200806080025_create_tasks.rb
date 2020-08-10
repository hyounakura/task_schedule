class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.time :start_time_id,     null: false
      t.time :end_time_id,       null: false
      t.date :date, null: false
      t.text :content
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
