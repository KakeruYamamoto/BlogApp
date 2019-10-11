class BlogsController < ApplicationController#cotrollerは間接的にDBに指示を出す。直接はmodel

  def index #indexでは一覧を表示
    @blogs = Blog.all #modelのblogファイルからレコードを全指定。そうする事で全ブログを取得。同時に同じ名前のviewファイルを探す。
    #binding.pry #デバッグ indexにアクセスすると停止する
    #停止した状態でターミナルを開くと次の手順で@blogsの中身が確認できる。ターミナル のコンソールに Blog.allでそもそもを確認。次に@blogaで確認。exitで終了
    #raise #要領はbinding.pryと同じで、相違点はbindingはターミナルだがraiseはweb上で。
  end

  def new #viewにデータを渡す。Blog.newはmodelがActiveRecordを介してDBから取得したもの
    @blog = Blog.new #ここでインスタンス化する事で対象のアクションと同じviewにデータを渡すことができる。
  end#単数形なとこに注意


#paramsを使うことでparametersというハッシュ値に変換する。titleに太郎、contentに『今日は、、』の場合
#例   "blog" => {"title" => "太郎","content" => "今日は"}
#Blog.create(params[:blog])でもできる
  def create
    #Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    #Blog.create(params.require(:blog).permit(:title,:content))#この書き方をstorong parametersという。blogのtitleとcontentをハッシュ値に変換
    #Blog.create(blog_params)#下記のメソッドを指定.同じクラス内だと変数でなくても使用可能。
    #redirect_to new_blog_path
    @blog = Blog.new(blog_params)
      if @blog.save #ブログの保存が成功した場合に
        #一覧画面（indexのprefixがblogs）へ遷移して下記のメッセージを表示。
        redirect_to blogs_path, notice:"ブログを作成しました！" #noticeはHTMLに記述しないと表示されない。
      else
        #falseだとnewページに遷移。
        render :new #renderは指定したviewをレンダリングをする。

        #通常だと指定したURLに移動すると
        #その関連したアクションやhtmlが呼び出されるがcreateはブログ作成の機能としての意図があるので
        #HTMLがないゆえにエラーが起るのでrenderでnew（新規作成画面）に返す。
      end
  end

  def show
  @blog = Blog.find(params[:id])
  #.find(params[:id])とすることでブログの個別のidを取得後、parameters(ハッシュ値)に変換 例   "blog" => {"title" => "太郎","content" => "今日は"}
  end

  def edit#記入
    @blog = Blog.find(params[:id])

  end

  private #他のアクションがprivateメソッドより下に記述されるとblog_paramsに影響される
  #privateメソを指定することで他のクラスから呼び出されることを防ぐ
  def blog_params#createメソで指定
    params.require(:blog).permit(:title,:content)#createのstrongParametersを記述
  end
end
