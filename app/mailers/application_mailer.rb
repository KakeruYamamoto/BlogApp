class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'#defaultメソッドを使用して、オプションで指定した値をこのクラス内すべてに適用。
  #メールのFromヘッダーを全てfrom@example.comに設定
  layout 'mailer'#layout: 'layout_name'オプションとすることでレイアウトを指定しています。
end
