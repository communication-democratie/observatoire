class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find_by(slug: params.expect(:slug))
    breadcrumb
    add_breadcrumb @organization
  end

end
