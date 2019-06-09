require 'rails_helper'

RSpec.describe WorkingTime, type: :model do
  describe 'start' do
    it 'レコードを追加する' do
      expect {
        WorkingTime.start
      }.to change(WorkingTime, :count).by(1)
    end

    it 'startに現在時刻を設定する' do
      time = WorkingTime.start
      expect(time.start_at.strftime('%H:%M:%S')).to eq(Time.now.strftime('%H:%M:%S'))
    end

    it 'dateに今日の日付を設定する' do
      time = WorkingTime.start
      expect(time.date.strftime('%Y-%m-%d')).to eq(Time.now.strftime('%Y-%m-%d'))
    end
  end

  describe 'end' do
    context '今日の日付のレコードが存在する場合' do
      before { WorkingTime.start }

      it 'そのレコードのend_atを更新する' do
        time = WorkingTime.end
        expect(time.reload.end_at.strftime('%H:%M:%S')).to eq(Time.now.strftime('%H:%M:%S'))
      end
    end

    context '今日の日付のレコードが存在しない場合' do
      it 'レコードを作る' do
        expect { WorkingTime.end }.to change(WorkingTime, :count).by(1)
      end

      it 'end_atが現在の時刻になる' do
        time = WorkingTime.end
        expect(time.end_at.strftime('%H:%M:%S')).to eq(Time.now.strftime('%H:%M:%S'))
      end
    end
  end
end
