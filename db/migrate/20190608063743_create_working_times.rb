class CreateWorkingTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :working_times do |t|
      t.date :date, comment: '出勤日時'
      t.time :start_at, comment: '出勤時間'
      t.time :end_at, comment: '退勤時間'
      t.timestamps
    end
  end
end
