class ChatRoomsController < ApplicationController
  def index
    render locals: { chat_rooms: chat_rooms }
  end

  def new
    render locals: { chat_room: ChatRoom.new }
  end

  def create
    chat_room = current_user.chat_rooms.build(chat_room_params)
    if chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    render locals: { chat_room: chat_room, message: Message.new }
  end

  def destroy
    message.destroy
    redirect_to :back
  end

  private

  def chat_room
    return @chat_room if defined?(@chat_room)
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
  end

  def chat_rooms
    return @chat_rooms if defined?(@chat_rooms)
    @chat_rooms = ChatRoom.all
  end

  def message
    return @message if defined?(@message)
    @message = current_user.messages.find_by(id: params[:message_id])
  end

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end