class DeviseMailerPreview < ActionMailer::Preview
  def reset_password_instructions
    user = FactoryGirl.build(:user)
    UserDeviseMailer.reset_password_instructions(user, "insertRandomTokenHere")
  end

  def unlock_instructions
    user = FactoryGirl.build(:user)
    UserDeviseMailer.unlock_instructions(user, "insertRandomTokenHere")
  end
end
