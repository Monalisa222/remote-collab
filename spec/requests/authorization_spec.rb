require 'rails_helper'

RSpec.describe "Authorization", type: :request do
  let(:user) { create(:user) }
  let(:organization) { create(:organization) }

  before do
    post login_path, params: {
      email: user.email,
      password: "password123"
    }
  end

  it "allows access to authorized users" do
    get dashboard_path
    expect(response).to be_successful
  end
end
