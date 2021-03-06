class BlogsController < ApplicationController#cotrollerは間接的にDBに指示を出す。直接はmodel
  before_action :set_blog, only: [:show, :edit, :update, :destroy]#before_actionメソを追加。このメソッドは末端のset_blogに定義されたアクションを指定したメソッドに定義する。
#destroyを追加。set_blgから値を取得
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
    # @blog = Blog.new(blog_params)
    @blog = current_user.blogs.build(blog_params)#current_user.blogs.buildは「ログイン中のユーザーの、blogを、build(new)する」という意味
    if params[:back]
        render :new
      else

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
  end

  def show
    @comments = @blog.comments
    @comment = @blog.comments.build
  #@blog = Blog.find(params[:id])  末尾のset_blogメソで定義。edit,updateも同様
  #.find(params[:id])とすることでブログの個別のidを取得後、parameters(ハッシュ値)に変換 例   "blog" => {"title" => "太郎","content" => "今日は"}
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    #current_user.favorites により、現在ログインしているユーザーがお気に入り登録している全レコード（user_idとblog_idの入ったFavoriteのレコード）を抽出
    #find_by(blog_id: @blog.id) で、その全抽出したFavoriteのレコードの中に、このブログのidが存在していれば（このブログがお気に入りに登録されていれば）、そのFavoriteのレコード（user_idとblog_id）を@favoriteに代入
  end

  def edit#記入
    #@blog = Blog.find(params[:id])
    #既存のデータを編集して、再保存する役割
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました"
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)#リクエストパラメータ(blog_params)
    # @blog = Blog.new(blog_params)#リクエストパラメーターを指定blog_paramsの事
    render :new if @blog.invalid? #falseであればnewを返す
  end

  def update
    #@blog = Blog.find(params[:id])
    #blog_paramsは下記のprivateメソッドで定義されたものである。
    if @blog.update(blog_params)#blogがupdateされるとture.つまり、一覧画面が返される（prefix=blogs=index）
      redirect_to blogs_path, notice: "ブログを編集しました！"#redirect=変える、書き変える
    else
      render :edit#falseであればeditページ（edit_blog）に返される render=する、与える
    end
  end

  private #他のアクションがprivateメソッドより下に記述されるとblog_paramsに影響される
  #privateメソを指定することで他のクラスから呼び出されることを防ぐ
  def blog_params#createメソで指定
    params.require(:blog).permit(:title,:content)#createのstrongParametersを記述
    #"blog"=>{"title"=>"こんにちは！", "content"=>"ハロー！"}    上の記述はblogキーのtitle,contentカラムのみ取得の意味
    #requireで対象のテーブル??を取得permitでレコードを指定
  end#paramsはデータのハッシュ値を取得するものなので、titleとcontentを取得する


#共通処理のメソッド化set_blog,before_action
  def set_blog #idをキーとして取得するメソッドを追加。下記と同じ記述は削除した。最上部のbeforeメソを確認
    @blog = Blog.find(params[:id])
    #上記のように行うことで各id値を取得。
  end
end
