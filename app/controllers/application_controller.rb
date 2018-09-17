class ApplicationController < ActionController::Base

  helper ApplicationHelper
  before_action :require_login
  skip_before_action :require_login, only: [:index]

end
