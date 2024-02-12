# frozen_string_literal: true

class Folder < ApplicationRecord
  has_many :folders, class_name: 'Folder', dependent: :destroy
  belongs_to :folder, class_name: 'Folder', optional: true
  belongs_to :user

  validates :name, presence: true
end
