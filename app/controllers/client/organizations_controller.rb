class Client::OrganizationsController < ApplicationController

  def index

    response = Unirest.get("http://localhost:3000/api/organizations")
    @organizations = response.body
    render "index.html.erb"
  end

  def show
    response = Unirest.get("http://localhost:3000/api/organizations/#{params['id']}")
    @organization = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @organization = {
      "name" => params[:name],
      "address" => params[:address],
      "website" => params[:website],
      "logo" => params[:logo],
      "contact_name" => params[:contact_name],
      "contact_email" => params[:contact_email],
      "contact_phone" => params[:contact_phone],
      "mission" => params[:mission],
      "description" => params[:description],
      "category_id" => params[:category_id],
      "needs" => params[:needs]
    }

    response = Unirest.post("http://localhost:3000/api/organizations", parameters: @organization)

    if response.code == 200
      flash[:message] = "Organization sucessfully created"
      redirect_to "/client/organizations/"
    else
      @errors = response.body['errors']
      render "new.html.erb"
    end

  end
 
  def edit
    response = Unirest.get("http://localhost:3000/api/organizations/#{params[:id]}")
    @organization = response.body
    render "edit.html.erb"
  end

  def update
   @organization = {
      "name" => params[:name],
      "address" => params[:address],
      "website" => params[:website],
      "logo" => params[:logo],
      "contact_name" => params[:contact_name],
      "contact_email" => params[:contact_email],
      "contact_phone" => params[:contact_phone],
      "mission" => params[:mission],
      "description" => params[:description],
      "category_id" => params[:category_id],
      "needs" => params[:needs]
    }

    response = Unirest.patch("http://localhost:3000/api/organizations/#{params[:id]}")

    if response.code == 200
      flash[:message] = "Organization successfully updated"
      redirect_to "client/organizations/#{params[:id]}"
    else @errors = response.body['errors']
      render "edit.html.erb"
    end
  end


end
