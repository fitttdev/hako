# frozen_string_literal: true

class AddJtiUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :jti, :string, default: '', null: false
    add_index :users, :jti, unique: true
  end
end
