require 'slack-notifier'

module SlackRubyBot
  module Commands
    class Base
      class << self
        alias_method :_invoke, :invoke

        def invoke(client, data)
          _invoke client, data
        rescue Mongoid::Errors::Validations => e
          logger.info "#{name.demodulize.upcase}: #{client.team}, error - #{e.document.errors.first[1]}"
          client.say(channel: data.channel, text: e.document.errors.first[1], gif: 'error')

          #todo: encapsular isso em algum lugar (nao sei onde) :)
          notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
          notifier.ping "#{name.demodulize.upcase}: #{client.team}, error - #{e.document.errors.first[1]}"


          true
        rescue StandardError => e
          logger.info "#{name.demodulize.upcase}: #{client.team}, #{e.class}: #{e}"
          client.say(channel: data.channel, text: e.message, gif: 'error')

          #todo: encapsular isso em algum lugar (nao sei onde) :)
          notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
          notifier.ping "#{name.demodulize.upcase}: #{client.team}, #{e.class}: #{e}"

          true
        end
      end
    end
  end
end
