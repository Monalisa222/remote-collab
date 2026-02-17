class ProposalsController < ApplicationController
  before_action :set_organization
  before_action :set_proposal, only: [:show]

  def index
    @proposals = Proposal.where(organization_id: params[:organization_id])

    @proposal = Proposal.new
  end

  def create
    @proposal = @organization.proposals.build(proposal_params)

    if @proposal.save
      respond_to do |format|
        format.html { redirect_to organization_proposals_path(@organization), notice: "Proposal created successfully." }
        # format.turbo_stream
      end
    else
      render :index, status: :unprocessable_entity
    end
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
