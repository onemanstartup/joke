class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  hstore_accessor :profile_settings,
            name: :string

  def settings
    profile_settings.to_json
  end

  def as_json(options = {})
    super(except: [:profile_settings, :authentication_token]).merge(profile_settings.to_h)
  end

  def online?
    last_sign_in_at < 10.minutes.ago if last_sign_in_at
  end

  protected

  def password_required?
    !persisted? || !password.nil?
  end
end
