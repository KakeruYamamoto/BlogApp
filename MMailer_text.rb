

instCloneで間違ったから

とりあえず１、３はやってしまったから
２をやってくれ



1 $ rails g scaffold Contact name:string email:string content:text

2 $ rails db:migrate

3  $ rails g mailer ContactMailer

app/mailer/contact_mailerができる
ここにお問い合わせの個人情報を記述


4  app/mailers/contact_mailer.rb

class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "自分のメールアドレス", subject: "お問い合わせの確認メール"
  end
end



5　app/views/contact_mailer/配下にcontact_mail.html.erbファイルを作成し


<h1>お問い合わせが完了しました！</h1>

<h4>name: <%= @contact.name %></h4>

<h4>お問い合わせ内容の確認</h4>

<p>content: <%= @contact.content %></p>

6
