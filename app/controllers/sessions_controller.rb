class SessionsController < ApplicationController

  def after_log_in_path_for(resource)
   new_user_session_path(resource)
  end
end
