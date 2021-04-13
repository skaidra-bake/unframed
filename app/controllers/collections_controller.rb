# frozen_string_literal: true

class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @collections = Collection.all
  end

  def new
    @collection = current_user.collections.build
  end

  def create
    @collection = current_user.collections.build(collection_params)

    if @collection.save
      redirect_to collections_path
    else
      render :new
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description, :post_id)
  end
end
