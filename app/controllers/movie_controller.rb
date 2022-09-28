class MovieController < ApplicationController
  def index
    @movies = if params[:order] == 'Ascending'
                Movie.order(id: :asc)
              elsif params[:order] == 'Descending'
                Movie.order(id: :desc)
              elsif params[:search].present?
                Movie.search(params[:search]).order(id: :asc)
              elsif params[:ratings].present?
                Movie.where(rating: params[:ratings])
              elsif params[:director].present?
                Movie.where(director_id: params[:director])
              elsif params[:producer].present?
                Movie.where(producer_id: params[:producer])
              else
                Movie.all
              end
  end
end
