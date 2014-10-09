class GenreLanguagesController < ApplicationController
  before_filter :load


  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  def record_not_found
    flash[:notice]= "Record not found"

    render :action => "index"


  end

  def load
    @langs = GenreLanguage.order('name asc')
    @langc = GenreLanguage.count
  end


  def index

    @lang = GenreLanguage.new
  end

  def new
    @lang = GenreLanguage.new
  end

  def create
    @lang = GenreLanguage.new(langParams)
    @lang.save


  end

  def edit

    @lang = GenreLanguage.where(:id =>params[:id])
    #    redirect_to genre_languages_url
    render :action => "index"

  end
  def update
    @lang = GenreLanguage.find(params[:id])

    @lang.update(langParams)

    flash[:notice]="Updated successfully"
    render :action => "index"
    #redirect_to genre_languages_url
  end
  def destroy
    @lang = GenreLanguage.find(params[:id])
    @lang.destroy
    redirect_to genre_languages_url
  end

  def show
    redirect_to genre_language_url
  end

  def langParams
    params.require(:genre_language).permit(:name)

  end
end
