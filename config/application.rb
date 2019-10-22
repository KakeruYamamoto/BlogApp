require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogA
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Tokyo'  #タイムゾーンとはこのアプリケーションに設定される時間のことです
    config.active_record.default_timezone = :local#created_atなどのデータが保存される際、その時間を参考にして時間データが保存されます




    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    #「アプリケーションの設定は、config/initializers内のファイルに書いてください。–そのディレクトリ内のすべての.rbファイルが自動的にロードされます。(上記の和訳)」との通り、Rails 5より設定の記載場所が変更となりました。
    # the framework and any gems in your application.
  end
end
