# sample request url: http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words?difficulty=2&maxLength=4
require 'byebug'
require 'httparty'
class DictionaryAdapter
  include HTTParty

  def self.get_word(difficulty, maxLength)
    # byebug
     response = self.get("http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words?difficulty=#{difficulty}&maxLength=#{maxLength}")
     converted_response = response.parsed_response.split(" ").sample
  end

end
