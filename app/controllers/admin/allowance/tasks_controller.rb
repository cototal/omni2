module Admin
  class Allowance::TasksController < AdminController
    before_action :set_allowance_task, only: [:edit, :update, :destroy]
    def new
      @task = current_user.allowance_tasks.build
    end

    def create
      @task = current_user.allowance_tasks.build(allowance_task_params)

      if @task.save
        redirect_to admin_allowance_entries_path, notice: "Task was successfully created."
      else
        render :new
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @task.update(allowance_task_params)
          format.html { redirect_to admin_allowance_entries_path, notice: "Task was successfully updated." }
          format.json { render json: @task, status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @task.destroy
      redirect_to admin_allowance_entries_path, notice: "Task was successfully destroyed."
    end

    private
      def set_allowance_task
        @task = ::Allowance::Task.find(params[:id])
      end

      def allowance_task_params
        params.require(:allowance_task).permit(:goal, :reward, days: [])
      end
  end
end
