class ProductionCompaniesController < ApplicationController
  def index
    @production_companies = ProductionCompany.ordered_by_movies
  end

  def show
    @production_company = ProductionCompany.find(params[:id])
  end
end
