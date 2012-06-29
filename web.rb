require 'sinatra'
require 'youtube_it'
%w(rubygems wordnik).each {|lib| require lib}

Wordnik.configure do |config|
    config.api_key = '2511533437086d533fd5103847108c1b84ca3abec199e412d'
end

# Routes
get '/' do
  word = Wordnik.words.get_random_word(:hasDictionaryDef => 'true')
  word["word"]
  client = YouTubeIt::Client.new
  videos = client.videos_by(query: word["word"]).videos
  while videos.length < 1
    videos = client.videos_by(
      query: Wordnik.words.get_random_word(:hasDictionaryDef => 'true')["word"]
    ).videos
  end
  comment = client.comments(videos.sample.video_id.split(":").last).sample
  while comment.nil?
    comment = client.comments(videos.sample.video_id.split(":").last).sample
  end
  comment.content
end
