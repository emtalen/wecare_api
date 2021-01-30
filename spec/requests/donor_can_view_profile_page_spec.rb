RSpec.describe 'Api::UserController', type: :request do
  describe 'Sucessfully' do
    describe 'User can view profie page' do
      let(:user) { create(:user) }
      let(:user_credentials) { user.create_new_auth_token }
      let(:user_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }

      before do
        get "/api/user/#{user.id}",
            headers: user_headers
      end

      it 'is expected to return a 200' do
        expect(response).to have_http_status 200
      end

      it 'is expected to return donors company name' do
        expect(response_json['company_name']).to eq user.company_name
      end
      it 'is expected to return donors adress' do
        expect(response_json['adress']).to eq user.adress
      end
      it 'is expected to return donors zipcode' do
        expect(response_json['zipcode']).to eq user.zipcode
      end
      it 'is expected to return donors city' do
        expect(response_json['city']).to eq user.city
      end
    end
  end
end
