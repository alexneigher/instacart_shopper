module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_applicant
  end

  protected
    def current_applicant=(applicant)
      session[:applicant_email] = applicant ? applicant.email : nil
    end

    def current_user
      if session[:applicant_email]
        @current_user ||= Applicant.find_by_email(session[:applicant_email])
      end
    end
end
