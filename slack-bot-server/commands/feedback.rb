module SlackBotServer
  module Commands
    class Feedback < SlackRubyBot::Commands::Base
      def self.call(client, data, match)

        #todo: faltou pegar o email do usuario aqui
        fb = FeedbackMessage.new
        fb.team_id = client.team.team_id
        fb.message = data.text
        fb.author = data.user
        fb.channel = data.channel
        fb.save!
        client.say(channel: data.channel, text: "Howdy <@#{data.user}>, thanks for the feedback! I'll let my masters know." )    
        client.say(channel: data.channel, gif: 'thanks')
        logger.info "Feedback received: #{client.team}, user=#{data.user}"

        #todo: encapsular isso em algum lugar (nao sei onde) :)
        notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
        notifier.ping "New feedback: #{client.team}, user=#{data.user} -  #{data.text}"


      end
    end

  end
end