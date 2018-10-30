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

  def self.send_message(channel, message)
    url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"

    #why a hash? can write anything here
    #HTTP wants hash with body and headers/args when doing post

    #.success comews with HTTParty

  response =  HTTParty.post(url,
      body:  {
        "text" => "#{message}",
        "channel" => "#{channel}",
        "username" => "Roberts-Robit",
        "icon_emoji" => ":robot_face:",
        "as_user" => "false"
      },
      :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )
    return response.success?
  end
end
