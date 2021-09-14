class BooksController < ApplicationController

# 一覧画面　と　投稿画面
  def index
    
  end
  
# 一覧画面　と　投稿画面
  # インスタンス変数「@book」
  # 空のモデル「Book.new」
  # 「Book.new」が「@book」に代入されてViewで利用できるようになる]
  def new
    @book = Book.new
  end
  
  def create
    # データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド
    book.save
    # トップ画面へリダイレクト
    redirect_to show_books_path (@book.id)
  end
  
# 詳細画面
  def show
    @book = Book.find(params[:id])
  end
  
# 編集画面
  def update
  end
  
  def edit
    @book = Book.find(:id)
  end
  
# ストロングパラメータ
  #ストロングパラメータは、フォームの入力値をコントローラのcreateやupdateに
  # 渡す役割がある。
  #「book_params」はフォームで入力されたデータを受け取っている
  #「params」はRilsで送られてきた値を受け取るためのメソッド
  #「require」でデータのオブジェクト名（:book)を指定
  # 「permit」でキー（:title,body）を指定している
  # これによりbook_paramsにフォームの入力データが格納される
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
