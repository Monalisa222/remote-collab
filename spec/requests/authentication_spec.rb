require "rails_helper"

RSpec.describe "Authentication", type: :request do
  let(:user) { create(:user, password: "password123") }

  it "logs in with valid credentials" do
    post login_path, params: {
      email: user.email,
      password: "password123"
    }

    expect(response).to redirect_to(dashboard_path)
  end

  it "rejects invalid credentials" do
    post login_path, params: {
      email: user.email,
      password: "wrong"
    }

    expect(response.body).to include("Invalid")
  end
end
