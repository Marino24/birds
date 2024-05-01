class CreateNotepads < ActiveRecord::Migration[7.1]
  def change
    create_table :notepads do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :name
      t.text :text

      t.timestamps
    end
  end
end
