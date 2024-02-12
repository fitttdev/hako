# frozen_string_literal: true

class AddRootToFolder < ActiveRecord::Migration[7.1]
  def change
    add_column :folders, :root, :boolean, default: false, null: false
  end
end
