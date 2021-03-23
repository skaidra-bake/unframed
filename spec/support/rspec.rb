# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    Post.reindex

    Searchkick.disable_callbacks
  end
end
