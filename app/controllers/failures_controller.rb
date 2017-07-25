class FailuresController < LayoutsController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @failures = Failure.where(:share => "1")
  end

  def show
    @failure = Failure.find(params[:id])
  end

  def new
    @failure = Failure.new
  end

  def edit
    @failure = Failure.find(params[:id])
  end

  def update
    @failure = Failure.find(params[:id])
    @failure.update(create_params)
    redirect_to failures_path, success: "編集が完了しました"
  end

  def create
    @failure = Failure.new(create_params)
    if @failure.save
      session[:failure_id] = @failure.id
      redirect_to failure_steps_path
    else
      render :new
    end
  end

  def destroy
    Failure.find(params[:id]).destroy
    redirect_to failures_path, success: "削除が完了しました"
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
    :lesson,
    :share
    ).merge(user_id: current_user.id)
end
end
