%w(json sinatra wordnik youtube_it yaml).each {|lib| require lib}

APP_CONFIG = YAML.load(File.open("./config/app_config.yml")) if FileTest.exists?("./config/app_config.yml")

Wordnik.configure do |config|
    config.api_key = ENV['WORDNIK_KEY'] || APP_CONFIG['wordnik_key']
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

  if request.accept[0] == "application/json"
    content_type :json
    { comment: @comment }.to_json
  else
    erb :index
  end
end