class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  #createアクション
  def create
    @list = List.new(list_params) # １$2. データを受け取り新規登録するためのインスタンス作成
    if @list.save # 3. バリデーションチェックでtrueならデータをデータベースに保存するためのsaveメソッド実行
    flash[:notice] = "投稿に成功しました。" # 3. フラッシュメッセージを定義
    redirect_to list_path(@list.id) # 4. showへリダイレクト
    else
      flash.now[:alert] = "投稿に失敗しました。" #「次のアクションで表示させたいメッセージにはflashを使用する」「現在のアクションで表示させたいメッセージにはflash.nowを使用する」
      render :new #falseならば、新規投稿ページを再表示、※エラーメッセージを扱う際にはrender、それ以外はredirect_toを使う
      #redirect_toの時はflash、renderの時はflash.nowとセット
    end
  end

  def index #一覧画面用のアクションとする
    @lists = List.all #listsテーブルに保存されている全てのデータをviewファイル上に@listを格納させる
  end

  def show
    @list = List.find(params[:id]) #レコードを1件だけ取得するので、インスタンス変数名は単数形の「@list」
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id]) # データ（レコード）を1件取得
    list.update(list_params)
    redirect_to list_path(list.id) #showアクションにリダイレクトするために、引数には必ずidが必要
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists' # 投稿一覧画面へリダイレクト
  end

  private #ここから下はこのcontrollerの中でしか呼び出せません」という意味→privateはControllerファイルの一番下のend
   # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image) #imageを追加することで画像の値を受け取れる
  end
end
