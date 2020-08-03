class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups

  validates :name, presence: true
end

module Calender
  def make_calendar
    today = Date.today
    calendar = {}
    start_day = today.beginning_of_month
    start_week = [1, 2, 3, 4, 5, 6, 7]
    end_week = ['', '', '', '', '', '', '']
    end_day = today.end_of_month
    middle_week = []
    middle_days = []

    start_week.count.times do |index|
      start_week[index] = index >= start_day.wday ? index - start_day.wday + 1 : ''
    end
    (end_day.wday + 1).times do |index|
      end_week.unshift(end_day.day - index)
      end_week.delete_at(-1)
    end

    week_day = 7
    last_day = start_week[start_week.count - 1]
    ((end_week[0] - start_week[start_week.count - 1] - 1) / week_day).times do |_index|
      middle_days = []
      week_day.times do |day|
        middle_days.push last_day + day + 1
      end
      last_day = middle_days[middle_days.count - 1]
      middle_week.push middle_days
    end
    { start_week: start_week, middle_week: middle_week, end_week: end_week }
  end
end
