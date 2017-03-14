class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.initial_workflow.create(applicant_params)
    if @applicant.valid?
      self.current_applicant = @applicant
      render_success_or_background_check
    else
      render :new
    end
  end

  def update
    @applicant = Applicant.find(params[:id])
    if @applicant.update(applicant_params)
      flash[:notice] = "All set! You'll hear from us soon"
      render :show
    else
      render :edit
    end
  end

  def edit
    @applicant = Applicant.find(params[:id])
  end

  def index
    redirect_to new_applicant_path
  end

  def show
    redirect_to new_applicant_path and return unless current_applicant
    @applicant = current_applicant
    render_success_or_background_check
  end

  private

    def applicant_params
      params.require(:applicant).permit(
        :first_name,
        :last_name,
        :region,
        :phone,
        :email,
        :phone_type,
        :source,
        :accepts_background_check
      )
    end

    def render_success_or_background_check
      if @applicant.accepts_background_check?
        render :show
      else
        render :complete_background_check_request
      end
    end
end
