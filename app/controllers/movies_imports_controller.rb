class MoviesImportsController < ApplicationController
  def new
    @movies_import = MoviesImport.new
  end

  def create
    @movies_import = MoviesImport.new(params[:movies_import])
    if @movies_import.save
      redirect_to movies_path
    else
      render :new
    end
  end
end
