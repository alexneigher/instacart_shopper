module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  protected
    def current_user=(user)
      session[:user_id] = user ? user.id : nil
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end
end
