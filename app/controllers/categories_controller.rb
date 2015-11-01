class CategoriesController < ApplicationController
  include SetUser
  
  before_action :authenticate_user!
  before_action	:set_user, expect: [:show]

  def index
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
