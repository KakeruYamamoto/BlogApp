class ContactMailer < ApplicationMailer
  def contact_mail(contact)#createアクションで使用
    @contact = contact#この記述でお問い合わせをした人の情報をViewファイルに渡すことができる。

    mail to: "okinawan.kkr0713@icloud.com", subject: "お問い合わせの確認メール"#to:で送り先、subject:で件名を設定することができる
  end#mail toは自分の。
end
