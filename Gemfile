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

  gem 'pry-rails'#デバック用のgemを記述後ターミナルで bundle インストール。
  gem 'better_errors'
  gem "rails-erd"
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

  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'

  gem 'chromedriver-helper'
  gem 'binding_of_caller'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
