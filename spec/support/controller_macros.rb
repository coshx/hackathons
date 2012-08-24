module ControllerMacros
  def login
    before do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
    end
  end
end