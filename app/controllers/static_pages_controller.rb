class StaticPagesController < ApplicationController
  def home
    @address = params[:address]
  end
end
