class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :tag
      t.boolean :completed, default: false
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
