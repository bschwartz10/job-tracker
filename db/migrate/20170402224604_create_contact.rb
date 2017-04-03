class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :email
      t.string :position
      t.references :company, index: true, foreign_key: true
    end
  end
end
