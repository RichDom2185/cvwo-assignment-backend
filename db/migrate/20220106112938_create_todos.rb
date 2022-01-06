class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos, id: :uuid do |t|
      t.string :title
      t.text :content
      t.string :tag
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
