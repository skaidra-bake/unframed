# frozen_string_literal: true

class Search
  def self.run(params)
    Post.search(params[:q])
  end
end
