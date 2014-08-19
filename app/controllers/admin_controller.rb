class AdminController < ApplicationController
  def index
    authenticate_user!
    redirect_to root_path unless @current_user.admin?
  end

  protected

  def self.inherited(base)
    base.include Accessable
    base.send :inherit_resources
  end
end
