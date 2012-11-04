class SearchesController < ApplicationController

  def create
    @search = Search.new(params[:search])
    if @search.valid?
      redirect_to short_search_path(:query => @search.query)
    else
      render :action => 'show'
    end
  end

  def show
    @search = Search.new(:query => params[:query])
    @search.results(params[:page])
  end
end
