class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_topic.subject
  #
  def sendmail_topic(topic)
    @topic = topic

      mail to: "yuri715lily_momo@yahoo.co.jp",
      subject: 'topicが投稿されました'

  end
end
