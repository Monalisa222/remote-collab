class TasksController < ApplicationController
  before_action :set_proposal
  before_action :set_task, only: [:update]

  def create
    @task = @proposal.tasks.build(task_params)
    if @task.save
      redirect_to organization_proposals_path(@proposal.organization), notice: "Task created successfully."
    else
      redirect_back fallback_location: root_path, alert: "Failed to create task."
    end
  end

  def update
    @task.completed! ? @task.pending! : @task.completed!

    head :ok
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end

  def set_task
    @task = @proposal.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
