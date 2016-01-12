class EmojiController < ApplicationController
  def index
    render json: EmojiSwapper.data_file.to_a.map { |e| Hash[*e] }
  end
end
