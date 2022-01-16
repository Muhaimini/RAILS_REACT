class CreateReceivers < ActiveRecord::Migration[7.0]
  def change
    create_table :receivers do |t|
      t.references :account, null: false, foreign_key: true
      t.string :username

      t.timestamps
    end
  end
end
