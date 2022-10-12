class MovieController < ApplicationController
  def index
    # @movies = Movie.preload(:director, :producer).all
    @movies = Movie.eager_load(:director, :producer).all
    # @movies = Movie.includes(:director, :producer).all
    #@movies = Movie.all
    @movies = @movies.order(id: :desc) if params[:order].present? && params[:order] == 'Descending'
    @movies = @movies.order(id: :asc) if params[:order].present? && params[:order] == 'Ascending'
    @movies = @movies.where(rating: params[:ratings]) if params[:ratings].present?
    @movies = @movies.where(director_id: params[:director]) if params[:director].present?
    @movies = @movies.where(producer_id: params[:producer]) if params[:producer].present?
    @movies = @movies.search(params[:search]).order(id: :asc) if params[:search].present?
    # if params[:order] == 'Ascending'
    #   @movies = @movies.order(id: :asc)
    #   @movies = @movies.where(rating: params[:ratings]) if params[:ratings].present?
    #   @movies = @movies.where(director_id: params[:director]) if params[:director].present?
    # elsif params[:order] == 'Descending'
    #   @movies = @movies.order(id: :desc)
    #   @movies = @movies = @movies.where(rating: params[:ratings]) if params[:ratings].present?
    #   @movies = @movies = @movies.where(director_id: params[:director]) if params[:director].present?
    # elsif params[:search].present?
    #   @movies = @movies.search(params[:search]).order(id: :asc)
    # elsif params[:ratings].present?
    #   @movies = @movies.where(rating: params[:ratings])-
    # elsif params[:director].present?
    #   @movies = @movies.where(director_id: params[:director])``
    # elsif params[:producer].present?
    #   @movies = @movies.where(producer_id: params[:producer])
    # else
    #   Movie.all
    # end
  end
end
