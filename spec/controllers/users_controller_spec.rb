require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }

  describe 'GET #edit' do
    render_views
    context 'ログインユーザーの場合' do
      before do
        sign_in user
        get :edit, params: { id: user.id }
      end

      it 'レスポンスが成功すること', spec_category: "deviseの基本的な導入・認証設定" do
        expect(response).to have_http_status(:success)
      end

      it '@userが正しく設定されていること', spec_category: "deviseの基本的な導入・認証設定" do
        expect(response.body).to include user.name
      end
    end
  end
end