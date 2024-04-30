class CreatePictures < ActiveRecord::Migration[7.1]
  def change
    create_table :pictures do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
