class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  belongs_to :group

  with_options presence: true do
    validates :name, :start_time_id, :end_time_id, :date
  end
end
