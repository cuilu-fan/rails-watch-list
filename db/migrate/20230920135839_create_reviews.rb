class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :list, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
