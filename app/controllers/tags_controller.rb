class TagsController < ApplicationController
  before_action :skip_verify_authorized!
  before_action :set_tag

  def show
    @articles = @tag.articles
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
