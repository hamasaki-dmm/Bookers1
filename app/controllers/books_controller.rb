class BooksController < ApplicationController
 def top
 end
 
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
    # 詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :index
    end
  end
  
  def show  
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    # 取得
    @book = Book.find(params[:id])
    # 送信
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
    # 詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:notice] = "Book was successfully destroyed." 
    redirect_to books_path# 投稿一覧画面へリダイレクト
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
