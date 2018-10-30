require 'httparty'

class SlackApiWrapper
  # Your code here!
  BASE_URL = "https://slack.com/api/"
  TOKEN = ENV["SLACK_TOKEN"]

  def self.list_channels
    url = BASE_URL + "channels.list?" + "token=#{TOKEN}" + "&exclude_archived=1"

    data = HTTParty.get(url)

    if data["channels"]
      return data["channels"]
    else
      return []
    end
  end
  
end
