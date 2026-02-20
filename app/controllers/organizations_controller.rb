class OrganizationsController < ApplicationController
  def index
    @organizations = current_user.organizations
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      Membership.create(user: current_user, organization: @organization, role: :admin)
      redirect_to @organization, notice: "Organization created successfully."
    else
      render :new
    end
  end

  def show
    @organization = Organization.includes(proposals: :tasks).find(params[:id])
    require_organization_member(@organization)
  end
end

private

def organization_params
  params.require(:organization).permit(:name)
end
