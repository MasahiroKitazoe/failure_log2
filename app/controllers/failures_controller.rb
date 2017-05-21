class FailuresController < ApplicationController
  def index
    @failures = Failure.where(user_id: current_user.id)
  end

  def show
    @failure = Failure.find(params[:id])
  end

  def new
    @failure = Failure.new
  end

  def create
    Failure.create(create_params)
  end

  def destroy
    Failure.find(params[:id]).destroy
  end

  private

    def create_params
  params.require(:failure).permit(
    :title,
    :date,
    :overview,
    :timeline,
    :cause,
    :damage,
    :action,
    :prevention,
    :lesson
    ).merge(user_id: current_user.id)
end
end
