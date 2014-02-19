class CreateBucks < ActiveRecord::Migration
  def change
    create_table :bucks do |t|
      t.string :description
      t.string :status
      t.integer :value
      t.integer :goes_to

      t.timestamps
    end
  end
end
