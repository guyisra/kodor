class Slacknotifier
 def initialize
  @notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK'],
                                 channel: ENV['SLACK_CHANNEL'],
                                 username: ENV['SLACK_USERNAME'])
 end

 def speak(text)
  @notifier.ping(text) if ENV['SLACK_ENABLED']
 end
end
