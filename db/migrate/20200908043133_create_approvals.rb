class CreateApprovals < ActiveRecord::Migration[5.1]
  def change
    create_table :approvals do |t|
      t.string :name
      t.date :sale_data

      t.timestamps
    end
  end
end
