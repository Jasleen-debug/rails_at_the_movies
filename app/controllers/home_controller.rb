class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:production_company)
                   .order("average_vote DESC")
                   .limit(10)
    @production_companies = ProductionCompany.select("production_companies.*")
                                             .select("COUNT(production_companies.id) as movie_count")
                                             .left_joins(:movies)
                                             .group("production_companies.id")
                                             .order("movie_count DESC")
                                             .limit(10)
  end
end
