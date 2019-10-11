
#history

HTTPメソッド　一覧

GET　　リソースの取得

POST　　リソースの作成など

PUT　リソースの更新など((更新というよりは置換))

DELETE　リソースの削除

PATCH 既存のリソースを更新・変更・修正(リソースの部分置換)



1 $ rails new blogA -d postgresql #オプションで使用するDBを指定
2 $ cd blogA #対象ディレクトリに移動
3 $ rails db:create #DBを作成
4 $ rails s #確認  localhost3000
5 $ rails g controller blogs index #veiwファイルも確認（index.html.erb）blogsはコントロラ、命名の際は複数形、語尾はオプション（indexアクション制作）
6 config/routes.rb =>  resources :blogs
7 rails g model blog #モデル名は単数！　このコマンドで下記のコマンドのファイルも作成」　カリキュラムでは　--skipオプションで飛ばしていた。そのオプションはDBのmigrate制作を飛ばす
#$ rails g migration CreateBlogs #mgファイル名は慣例の命名規則に従い、目的＋命名で作成。ここからテーブルの設計をかく。記述後はdb:migrate
#modelファイルにて、blog.rbを確認
#modelコマンド入力後、DBのmigrateファイルも制作される。
8 db/migrate/20191000000_create_blogs => データ型：カラム名を記述

9.5 $ sudo service postgresql start #SQLを起動

9 $ rails db:migrate #スキーマファイルを確認

10　作成したcontrファイルにnewアクションを記述　＝＞　blogモデルのインスタンス変数まで記述　（@blog=Blog.new）
#アクションを記述するとerbファイルも制作。例外あり
11 view/blogsにnew.html.erbを作成　＝＞　new.htmlにテキストのhtmlコードを貼り付け newその１　＃１９

12 $ rails s => blogs/new確認

13 controlにアクションcreateを作成　paramsメソッドを使う、　リダイレクトはcreateアクションが終わり次第newを返すという意味。prefixを使用。_pathはオプション


def create #StrongParametersの記述を切り離す
    Blog.create(blog_params)#下記のメソッドを指定
  redirect_to new_blog_path #リダイレクト create終了後newを返す。記述はprefixで指定。_pathはオプション。
  #rails routesで確認可
end

private #他のアクションがprivateメソッドより下に記述されるとblog_paramsに影響される
#privateメソを指定することで他のクラスから呼び出されることを防ぐ
def blog_params#createメソで指定
  params.require(:blog).permit(:title,:content)#createのstrongParametersを記述
end
end


14 viewファイルのindexで一覧ページを作成。　新規投稿ページと詳細確認画面へのリンクを記述



<h1>ブログ一覧</h1>

<table>
  <tr>
    <th>タイトル(th)</th>
    <th>内容(th)</th>
  </tr>

<% @blogs.each do |blog| %><!--  -->
  <tr>
    <td><%= blog.title %>(td)</td><!--変数blogのtitleを指定。下記も同様  -->
    <td><%= blog.content %>(td)</td><!--  -->
    #追加.　記述後は　showアクションを記述。
    <td><%= link_to '詳細を確認する', blog_path(blog.id) %></td> #showアクションのprefix確認後記入=>blog_path(複数ではない事に注意)。(blog.id)とeachで個別の記事を表示

  </tr>
<% end %>
</table>

<%= link_to '新しくブログを投稿する',new_blog_path %>  # <!--  link_toメソッド '期待する表示',パス %  -->

<%= %>はhtmlにrubyを埋め込む記述      >


15 showアクションを記述  その１

def create #createはpostメソと結びついている（リソースの制作）
  Blog.create(blog_params)#DBに記述内容を保存=>irbでBlog.create(title:~)とやると理解しやすい
  redirect_to new_blog_path
end

#追記
def show　
  @blog = Blog.find(params[:id]) #.find(params[:id])とすることでブログの個別のidを取得後、parameters(ハッシュ値)に変換 例   "blog" => {"title" => "太郎","content" => "今日は"}
end


16 viewにshow.html.erbを作成 #これが無いと表示されない。ページが無いから。

<h1>ブログ詳細画面</h1>
<p>タイトル: <%= @blog.title %></p> #アクションで取得した個々のparametersの情報が反映される
<p>内容: <%= @blog.content %></p>

17　model/blog.rbにバリテーションを記述

class Blog < ApplicationRecord
#validates:titleを設定することでtitleにバリデーションを設定。そしてpresence:tureで空の登録を禁止する。
    validates :title, presence: true #presenceは他にも種類がある下記参照 presenceは空でないことがture  テキストでは空だと保存を止めたいのでpresence
    # validates :content, length:{minimum:1} #一文字以上
    # validates :content, length:{maximum:75} #75文字以下
    validates :content,length: { in: 1..140 }   #1文字以上140以下
    #validates :content, length{is:8} #8文字のみ

    #validates :login, absence: true #空であることがture
    #validates :user_name, uniqueness: true #ユニークであること（同じものが２つあってはいけない存在）
end


18 create その２

def create
  @blog = Blog.new(blog_params)
    if @blog.save #ブログの保存が成功した場合に
      #一覧画面（indexのprefixがblogs）へ遷移して下記のメッセージを表示。
      redirect_to blogs_path, notice:"ブログを作成しました！" #noticeは表示したいHTMLに記述されないと表示されない。今の段階ではされない。
    else
      #falseだとnewページに遷移。
      render :new #renderは指定したviewをレンダリングをする。

      #通常だと指定したURLに移動すると
      #その関連したアクションやhtmlが呼び出されるがcreateはブログ作成の機能としての意図があるので
      #HTMLがないゆえにエラーが起るのでrenderでnew（新規作成画面）に返す。
    end
  end

19 new.htmlその２　#11から

<%= form_with(model: @blog, local: true) do |form| %>
  <% if @blog.errors.any? %> #@blog.errors.any?でエラーが存在している時だけ下記を実行。
    <div class="error_explanation">
      <h2><%= @blog.errors.count %>件のエラーがあります。</h2>#.errors.countはバリテーションのerrorの件数を表示。
      <ul> #@blogs.errosはrailsが蓄積しているerror情報を取得できる。errorはsaveした際の発生したバリテーションのもの

        <% @blog.errors.full_messages.each do |msg| %> #full_messagesは複数のerrorメッセージを表示。
        <li><%= msg %></li>
        <% end %>

      </ul>
    </div>
    <% end %>

  <div class="blog_title">
    <%= form.label :title %>
    <%= form.text_field :title %>
  </div>
  <div class="blog_content">
    <%= form.label :content %>
    <%= form.text_field :content %>
  </div>
  <%= form.submit %>
<% end %>


#<!-- form_with(model:modelのインスタンス)do |form|    最後はendで閉じる -->

20 デバッグーーーーーーーーーーーーーーーーーーーーーーーーー

gemをGemfileに追記

group :development, :test do
省略
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

ターミナルでインストール  コマンド $ bundle install

binding.pryかraiseで確認。blogAのコントロら参照

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー


21 editアクションを記述 && edit.htmlを作成(new.htmlと同じものをコピー)

def edit

end
