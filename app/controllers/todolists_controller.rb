class TodolistsController < ApplicationController
  def new

    @list = List.new
  end

def create
  # データ新規登録のためのインスタンス作成
  list =  List.new(list_params)
  # データをデータベースに保存するためのsaveメソッド実行
  list.save
  # トップ画面へリダイレクト => 廃止
  # 詳細画面へのリダイレクト
  redirect_to todolist_path(list.id)
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
  redirect_to todolist_path(list.id)
end

def destroy
  list = List.find(params[:id])  #データ（レコードを1件取得）
  list.destroy #データ（レコード）を削除
  redirect_to todolists_path #投稿画面一覧へリダイレクト
end

private
# ストロングパラメータ
def list_params
  params.require(:list).permit(:title, :body, :image)
end

end
