class CreateRecaps < ActiveRecord::Migration[5.2]
  def change
    create_table :recaps do |t|
      t.string :moves
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
