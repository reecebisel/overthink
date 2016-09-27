class Gather
  BASE_URL = 'https://www.reddit.com/r/'
  PAGE_LIMIT = 25

  def initialize
  end

  def self.perform
    new.perform
  end

  def perform
    get_new_thoughts
    parse_data
    create_thoughts
  rescue => e
    # figure out what to do here. It might not be needed not sure yet
    # TO DO create/register Oauth reddit account for pulling in info. 
    # checkout github reddit/reddit
  end

  private
  
  attr_accessor :options, :thoughts, :parsed
  attr_reader :thought_attributes 

  def get_new_thoughts
    @thoughts = HTTParty.get(BASE_URL + '/ShowerThoughts/new/.json')
  end

  def parse_data
    @parsed = []

    @thoughts['children'].each do |child|
      new_thought = Hash.new { |hash, key| hash[key] = nil }
      
      @thought_attributes.each do |attr|
        new_thought[attr] = child['data'][attr]
      end

      @parsed << new_thought
    end
  end

  def create_thoughts
    @parsed.each do |thought_params|
      Thought.create!(thought_params)
    end
  end

  def thought_attributes
    @thought_attributes ||= Thought.new.attributes.except('created_at', 'updated_at').keys
  end

  # depending on the oauth stuff for reddit. I could end up using this as a joke generator. 
  # this is a joke API the seems pretty simple.
  # http://www.programmableweb.com/api/webknox-jokes 
  # I would really prefer to use the Reddit API
  # that way I can build my own news feed from all the subreddits I actually care about
end
