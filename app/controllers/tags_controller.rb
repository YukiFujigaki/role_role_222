class TagsController < ApplicationController
  def all_tags
    tags = Tag.all.pluck(:name).reject(&:blank?)
    render json: tags
  end

  private def autocomplete_params
    params.permit(:tag)
  end
end
