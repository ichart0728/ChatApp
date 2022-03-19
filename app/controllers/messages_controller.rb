class MessagesController < ApplicationController
  before_action :require_user

  def create
    # build => インスタンスを生成するメソッド。newとほぼ同じだが、モデルの関連付けを行う時はbuildを使う。
    # モデル同士の関係が1対1の場合 => build_関連付けのメソッド名
    # ex)build_message
    # モデル同士の関係が1対多の場合 => 関連付けメソッド名.build
    # ex)@user.message.build
    # モデル同士の関係が1対1の場合 => 関連付けメソッド名.build
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", foo: message.body
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
