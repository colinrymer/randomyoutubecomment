%w(json sinatra wordnik youtube_it).each {|lib| require lib}

APP_CONFIG = YAML.load(File.open("./config/app_config.yml")) if FileTest.exists?("./config/app_config.yml")

Wordnik.configure do |config|
    config.api_key = ENV['WORDNIK_KEY'] || APP_CONFIG['wordnik_key']
end

class Comment
  attr_accessor :id, :author, :body, :title, :video_id
  
  def initialize(client)
    videos = search_for_videos(random_word) while videos.nil? || videos.length < 1
    while @comment.nil?
      video = videos.sample
      @comment = get_comment(video.unique_id) 
    end

    @id, @author = @comment.url.split(":").last, @comment.author.name
    @body, @title =  @comment.content, @comment.title
    @video_id = video.unique_id
  end

  def client
    @client ||= YouTubeIt::Client.new
  end

  def get_comment(video_id)
    client.comments(video_id).sample
  end

  def random_word
    Wordnik.words.get_random_word(:hasDictionaryDef => 'true')["word"]
  end

  def search_for_videos(word)
    client.videos_by(query: word).videos
  end
end

# Routes
get '/' do
  @comment = Comment.new client
  if request.accept[0] == "application/json"
    content_type :json
    { author: @comment.author, comment: @comment.body,
      comment_id: @comment.id, title: @comment.title,
      video_id: @video.unique_id }.to_json
  else
    erb :index
  end
end