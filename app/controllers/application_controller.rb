class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :authenticate_user!

  private

  def authenitcate_user!

  end

end
