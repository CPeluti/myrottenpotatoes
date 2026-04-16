class MoviesController < ApplicationController
  def index
    sort = params[:sort] || session[:sort]
    case sort
      when 'title'
        ordering,@title_header = {:title => :asc}, 'hilite'
      when 'release_date'
        ordering,@date_header = {:release_date => :asc}, 'hilite'
    end
    @all_ratings = Movie.all_ratings
    @selected_ratings =
    if params[:ratings]
      params[:ratings].to_unsafe_h
    else
      session[:ratings] || {}
    end
    if session[:ratings] != params[:ratings] or params[:sort] != session[:sort]
      session[:ratings] = @selected_ratings
      session[:sort] = sort
    end
    @movies = Movie.where(rating: @selected_ratings.keys).order(ordering)
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      # flash[:alert] = "Todos campos devem ser preenchidos"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
      
    end
  end
  
  private
    def movie_params
      params.expect(movie: [:title, :rating, :description, :release_date])
    end
end
