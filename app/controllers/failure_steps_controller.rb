class FailureStepsController < ApplicationController
  include Wicked::Wizard
  steps :grasp, :action

  def show
    f_id = session[:failure_id]
    @failure = Failure.find(f_id)
    render_wizard
  end

  def update
    f_id = session[:failure_id]
    @failure = Failure.find(f_id)
    @failure.attributes = failure_params
    render_wizard @failure
  end

  private

    def redirect_to_finish_wizard(options = nil)
    redirect_to root_url, success: "記録が完了しました"
    end

    def failure_params
      params.require(:failure).permit(
      :title,
      :date,
      :overview,
      :timeline,
      :cause,
      :damage,
      :action,
      :prevention,
      :lesson,
      :share
      ).merge(user_id: current_user.id)
    end
end
