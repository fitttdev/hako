# frozen_string_literal: true

class CreateFolders < ActiveRecord::Migration[7.1]
  def change
    create_table :folders do |t|
      t.string :name
      t.references :user
      t.references :parent, foreign_key: { to_table: :folders }
      t.timestamps
    end
  end
end
