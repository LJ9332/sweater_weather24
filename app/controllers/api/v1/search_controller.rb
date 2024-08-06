class Api::V1::SearchController < ApplicationController
  def index
    #binding.pry
    search = SearchFacade.new.find_search(params[:destination], params[:food])
    render json: SearchSerializer.new(search)
  end
end