class SearchController < ApplicationController
  def index
    @q = params[:q]
    @results = perform_search
    @products = @results[:products] || []
    @reviews
    @users
  end

  def perform_search
    results = {}

    results[:products] = Product.ransack(name_cont: @q).result.to_a

    results.each { |key, value| results[key] = value.flatten.uniq }

    return results
  end
end
