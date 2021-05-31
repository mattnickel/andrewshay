class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.string :priority
      t.date :due_date
      t.timestamps
    end
  end
end
