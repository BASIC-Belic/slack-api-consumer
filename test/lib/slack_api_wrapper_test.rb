require 'test_helper'

describe 'Slack Api Wrapper' do

  describe 'send message' do

    it 'returns true when a valid channel and mesage were successful' do

      #VCR.use_cassette takes in string, wich is file name
      #string does not have to match actual file name
      #use cassette to say organize file names into these different groups or ideas
      #<CHANNELID> as first param, name of channel
      VCR.use_cassette("channels") do
        # message = "test message"
        message = "how many times does this actually send to the internet"
        # response = SlackApiWrapper.send_message("<CHANNELID>", message)
        is_successful = SlackApiWrapper.send_message("edges-api-testing", message)
        #from below
        expect(is_successful).must_equal true
        # response["ok"].must_equal true
        # response["message"]["text"].must_equal message
      end
      # is_successful = #something
      # expect(is_successful).must_equal true
    end

    it 'is successful when sending a mesage to fake channel' do
      VCR.use_cassette("channels") do
        message = "test message"
        is_successful = SlackApiWrapper.send_message("this-channel-does-not-exist", message)
        expect(is_successful).must_equal true
      end
    end
    
  end
end
