class FailuresController < ApplicationController

  before_action :authenticate_user!, except: :index

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
    @failure = Failure.new(create_params)
    if @failure.save
      session[:failure_id] = @failure.id
      redirect_to failure_steps_path
    else
      render :new
    end
    #元のコード
    # Failure.create(create_params)
    # flash[:success] = "記録が完了しました"
    # redirect_to failures_url
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
