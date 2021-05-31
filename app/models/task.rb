class Task < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :assigned_user, class_name: "User", foreign_key: :assigned_user_id
  has_one_attached :image

  enum status: [:incomplete, :in_process, :complete, :deleted, :archive_complete, :archive_incomplete]
end
