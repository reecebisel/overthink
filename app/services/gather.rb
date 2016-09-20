class Gather
  BASE_URL = 'https://www.reddit.com/r/'
  PAGE_LIMIT = 25

  def initialize(subreddit:)
    @subreddit = subredditi
    @options   = {}
  end

  def self.perform
    new.perform
  end

  def perform
    get_new_thoughts
    parse_data
    create_thoughts
  rescue => e
    binding.pry
    # figure out what to do here. It might not be needed not sure yet
  end

  private
  
  attr_accessor :options, :thoughts, :parsed, :attributes

  def get_new_thoughts
    @thoughts = HTTParty.get(BASE_URL + '/ShowerThoughts/new/.json', @options)
  end

  def parse_data
    @parsed = []

    @thoughts['children'].each do |child|
      new_thought = Hash.new { |hash, key| hash[key] = nil }
      new_thought[:title]       = child['data']['title']
      new_thought[:text]        = child['data']['selftext']
      new_thought[:url]         = child['data']['url']
      new_thought[:subreddit]   = child['data']['subreddit']
      new_thought[:external_id] = child['data']['id']
      @parsed << new_thought
    end
  end

  def create_thoughts
    @parsed.each do |thought_params|
      Thought.create!(thought_params)
    end
  end
end
