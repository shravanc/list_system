class TenantsController < ApplicationController

def create
  tenant = Tenant.new
  status, data = tenant.create(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :untenantrocessable_entity
  end
end

end
