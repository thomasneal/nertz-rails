class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :value
      t.references :round, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
