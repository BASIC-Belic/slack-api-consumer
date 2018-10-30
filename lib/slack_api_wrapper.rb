require 'httparty'

class SlackApiWrapper
  # Your code here!
  BASE_URL = "https://slack.com/api/"
  TOKEN = ENV["SLACK_TOKEN"]

  def self.list_channels
    url = BASE_URL + "channels.list?" + "token=#{TOKEN}" + "&exclude_archived=1"

    data = HTTParty.get(url)

    if data["channels"]
      channel_list = data["channels"].map do |channel|
        create_channel(channel_data)
      end
    else
      return []
    end

    return channel_list
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
        "username" => "Karis 2.0",
        "icon_emoji" => ":karis:",
        "as_user" => "false"
      },
      :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )
    return response.success?
  end

  private

  def self.create_channel(api_params)
    return Channel.new(
      api_params["name"],
      api_params["id"],
      {
        purpose: api_params["purpose"],
        is_archived: api_params["is_archived"],
        members: api_params["members"]
      }
    )
  end
end
