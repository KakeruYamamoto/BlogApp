class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact#この記述でお問い合わせをした人の情報をViewファイルに渡すことができる。

    mail to: "okinawan.kkr0713@icloud.com", subject: "お問い合わせの確認メール"
  end#mail toは自分の。
end
