class ApplicantsController < ApplicationController
  def new
    # your code here
  end

  def create
    # your code here
  end

  def update
    # your code here
  end

  def show
    redirect_to new_applicant_path and return unless current_user
    raise 'show yeah'
  end
end
