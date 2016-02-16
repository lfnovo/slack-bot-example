module SlackBotServer
  module Commands
    class Feedback < SlackRubyBot::Commands::Base
      def self.call(client, data, match)
        puts data.to_s
        fb = FeedbackMessage.new
        fb.team_id = client.team.team_id
        fb.message = data.text
        fb.author = data.user
        fb.channel = data.channel
        fb.save!
        client.say(channel: data.channel, text: "Howdy <@#{data.user}>, thanks for the feedback! I'll let my masters know." )    
        client.say(channel: data.channel, gif: 'thanks')
        logger.info "Feedback received: #{client.team}, user=#{data.user}"
      end
    end

  end
end