class ProposalsController < ApplicationController
  before_action :set_organization
  before_action :set_proposal, only: [:show]

  def index
    @proposals = @organization.proposals.includes(:tasks)
    @proposal ||= Proposal.new
  end

  def create
    service = ProposalCreator.new(
      organization: @organization,
      user: current_user,
      params: proposal_params
    )

    @proposal = service.call

    respond_to do |format|
      if @proposal.persisted?
        format.html { redirect_to organization_proposals_path(@organization), notice: "Proposal created successfully." }
      else
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  def show
    @task = Task.new
  end

  private

  def set_organization
    @organization = Organization.find(params[:organization_id])
    require_organization_member(@organization)
  end

  def set_proposal
    @proposal = @organization.proposals.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :description)
  end
end
