class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = params[:country]
    resource = LearningResourceFacade.new_resource(country)
    render json: LearningResourceSerializer.new(resource)
  end
end

