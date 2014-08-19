require 'test_helper'

describe User do
  before :all do
    @user ||= create(:user)
  end

  it 'should be valid' do
    @user.valid?.must_equal true
  end
end

