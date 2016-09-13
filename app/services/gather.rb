class Gather
  include HTTParty

  BASE_URi = 'https://www.reddit.com/r/'
  PAGE_LIMIT = 25

  def initialize(amount)
    @amount = amount
    @count = 0
    @pages = 5
  end

  def self.perform
    new.perform
  end

  def perform
    get_new_thoughts
    parse_data
    create_thoughts
  rescue => e.message
    # figure out what to do here. It might not be needed not sure yet
  end

  private
  
  attr_accessor :options, :thoughts, :count, :after, :parsed

  def get_new_thoughts
    @thoughts = self.class.get('/ShowerThoughts/new.json', options)
    @count    = count + PAGE_LIMIT 
    @after    = @thoughts['data']['after']
    @options  = { count: @count, after: @after }   
  end

  def parse_data
    @parsed = []

    @thoughts['children'].each do |child|
      new_thought = Hash.new { |hash, key| hash[key] = nil }
      new_thought[:title]     = child['data']['title']
      new_thought[:text]      = child['data']['selftext']
      new_thought[:url]       = child['data']['url']
      new_thought[:subreddit] = child['data']['subreddit']
      @parsed << new_thought
    end

    @parsed
  end

  def create_thoughts
    @parsed.each do |thought_params|
      Thought.create!(thought_params)
    end
  end
end
