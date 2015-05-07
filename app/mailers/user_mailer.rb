class UserMailer < ApplicationMailer
  def welcome_email(user_id, password)
    @user = User.find(user_id)
    @password = password
    send_mail(@user.email, 'Welcome to ICL') if @user
  end

  def raid_alert_email(raid_id, user_id)
    @raid = Raid.find(raid_id)
    @user = User.find(user_id)
    send_mail(@user.email, 'Raid details') if @user
  end

  def send_mail(mail_to, mail_subject)
    mail(to: mail_to, subject: mail_subject)
  end
end
