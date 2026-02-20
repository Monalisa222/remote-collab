class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  before_action :require_login
  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: 'Please log in to access this page.'
    end
  end

  def require_organization_member(organization)
    unless current_user && organization.users.include?(current_user)
      redirect_to root_path, alert: 'You do not have access to this organization.'
    end
  end

  def require_admin(organization)
    membership = organization.memberships.find_by(user_id: current_user.id)
    unless membership&.admin?
      redirect_to root_path, alert: 'You do not have admin access to this organization.'
    end
  end
end
