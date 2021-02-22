class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
    @lists = List.all
  end
  
  def create
    list = List.new(list_params)
    list.save
    # redirect_to '/top' を削除して、以下コードに変更
    # 詳細画面へリダイレクト
    redirect_to book_path(list.id)
  end

  def index
     @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end

  def update
     list = List.find(params[:id])
    list.update(list_params)
    redirect_to book_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
