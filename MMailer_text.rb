

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

6　createに追記

def create
  @contact = Contact.new(contact_params)

  respond_to do |format|
    if @contact.save   #なぜにContactMailer.contact_mailが呼び出せるか？継承もされていないのに
      ContactMailer.contact_mail(@contact).deliver#これを追記することで、お問い合わせ内容が保存された時にContactMailerのcontact_mailメソッドを呼ぶ
      # redirect_to contacts_path, notice: 'Contact was successfully created.'
      format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      format.json { render :show, status: :created, location: @contact }
    else

7 gem記述＆インスト

group :development do
  gem 'letter_opener_web'
end



8 config/routes.rb

# 省略
mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
