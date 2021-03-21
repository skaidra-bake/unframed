# frozen_string_literal: true

module Mailboxer
  class AttachmentUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    storage :file

    process resize_to_fill: [100, 100]
  end
end
