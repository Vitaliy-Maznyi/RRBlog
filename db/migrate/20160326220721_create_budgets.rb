class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :amount_per_day
      t.integer :amount
      t.text :source

      t.timestamps null: false
    end
  end
end
