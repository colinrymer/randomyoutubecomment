require 'sinatra'
require 'youtube_it'
%w(rubygems wordnik).each {|lib| require lib}

Wordnik.configure do |config|
    config.api_key = '2511533437086d533fd5103847108c1b84ca3abec199e412d'
end

def get_comment(videos)
  client.comments(videos.sample.video_id.split(":").last).sample
end

def random_word
  Wordnik.words.get_random_word(:hasDictionaryDef => 'true')["word"]
end

def search_for_videos(word)
  client.videos_by(query: word).videos
end

def client
  @client ||= YouTubeIt::Client.new
end

# Routes
get '/' do
  @videos = search_for_videos(random_word) while @videos.nil? || @videos.length < 1
  @comment_response = get_comment(@videos) while @comment_response.nil? || @comment_response.content.nil?
  @comment = @comment_response.content
  erb :index
end