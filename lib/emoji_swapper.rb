module EmojiSwapper
  module_function

  def data_file
    data = File.open(Rails.root + 'db/emoji.json') { |data| JSON.parse(data.read) }
    data.each do |k, v|
      data[k] = [v.to_i(16)].pack 'U'
    end
  end

  def encode(message)
    data = data_file
    words = message.split /\W+/

    words.select do |word|
      data[word]
    end.each do |word|
      message.gsub!(word, data[word])
    end

    message
  end

end
