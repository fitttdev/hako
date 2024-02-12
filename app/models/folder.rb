# frozen_string_literal: true

# == Schema Information
#
# Table name: folders
#
#  id         :bigint           not null, primary key
#  name       :string
#  root       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_folders_on_parent_id  (parent_id)
#  index_folders_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => folders.id)
#
class Folder < ApplicationRecord
  has_many :folders, class_name: 'Folder', dependent: :destroy
  belongs_to :folder, class_name: 'Folder', optional: true
  belongs_to :user

  validates :name, presence: true
end
