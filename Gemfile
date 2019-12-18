source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'faker'#ランダムな値を入れられるgem
gem 'bcrypt', '3.1.11'#追記  => has_secure_passwordメソッド  *モデルuser参照
#has_secure_passwordメソッドを使用するためにはbcryptと言うGemが必要

gem 'carrierwave'#画像をアップロード用
gem 'mini_magick'#アップロードした画像ファイルのサイズを調整してくれる


# Core
gem 'rails', '~> 5.2.3'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'




gem 'coffee-rails', '~> 4.2'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'









gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'pry-rails'#binding.pryが使用できる。<% binding.pry %> とする事でviewでも使用できる。  デバック用のgemを記述後ターミナルで bundle インストール。
  gem 'better_errors'#better_errorsでエラー画面にデバッグ機能を追加することができる。raiseを使うと処理を止めることができる。（機能はbinding.pryと同じ）
  gem 'binding_of_caller'#binding_of_callerとbetter_errorsを両方インストする事でエラー画面にデバッグ機能を実装できる

  gem "rails-erd"#ER図を作ってくれる $bundle exec erd

  #Rspec系gem
  gem 'rspec-rails'#RSpecを使用するために、必要なgem。
  gem 'spring-commands-rspec'#bin/rspecのコマンドを実行するときに必要になるGem => テストを高速化させる（このgemがなくてもコマンドrailsでも動く）
  gem 'factory_bot_rails'#factory_botを使用することで、フィクスチャ（テストで使用するデータ）を作成する際に、それぞれのデータを関連付けることができるようになります。
  gem 'faker'#フィクスチャを作成するときに、名前などを存在していそうな値にしてくれます。
  gem 'launchy'#Capybaraでテスト中に、save_and_open_page というメソッドで現在ページを確認できるようにしてくれます。(オブジェクト指向設計入門でも使用)
  gem 'capybara'#アプリケーション操作をRubyで設定して、あたかもユーザがアプリケーションを使っているかのように様々なページを遷移させ、その際にどこか不具合がないか調べてくれます。
  gem 'selenium-webdriver'#複数のテストを並行して実施できるようにしてくれます。
#記述後次のコマンド
#$ bundle install
#$ bundle exec spring binstub rspec
#$ rails generate rspec:install

#テキスト（https://diver.diveintocode.jp/curriculums/642）に従いファイル作成後
#$ bin/rspec で動作確認


  gem 'webdrivers'

end

group :development do

  gem 'letter_opener_web'#ブラウザ上でメール送信内容を確認することができるgem
#letter_opener_webは開発環境でのみ使用するので、groupブロックで囲むことによって、開発環境のみ適用するように定義

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do

  # gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'

  gem 'chromedriver-helper'
  gem 'binding_of_caller'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
