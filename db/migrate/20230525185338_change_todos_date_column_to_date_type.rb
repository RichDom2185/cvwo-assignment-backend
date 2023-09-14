class ChangeTodosDateColumnToDateType < ActiveRecord::Migration[6.1]
  def change
    change_column :todos, :date, "date USING date::date"
  end
end
