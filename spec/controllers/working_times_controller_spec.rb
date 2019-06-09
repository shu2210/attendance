require 'rails_helper'

RSpec.describe WorkingTimesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template(:index) }
  end

  describe 'POST #start' do
    it '出勤をする' do
      expect {
        post :start
      }.to change(WorkingTime, :count).by(1)
    end
  end
end
