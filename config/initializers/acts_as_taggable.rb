# frozen_string_literal: true

begin
    ActsAsTaggableOn.force_binary_collation = true
rescue ActiveRecord::NoDatabaseError => err
    Rails.logger.error err
end