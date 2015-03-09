class RoomsController < ApplicationController
  before_action :initialize_opentok, :except => [:new]

  def new
    @new_room = Room.new
  end

  def show
    @room = Room.find(params[:id])

    @opentTok_token = @opentok.generate_token @room.session_id 
  end

  def create
    session = @opentok.create_session :location => request.remote_addr
    params[:room][:session_id] = session.session_id

    @new_room = Room.new(room_params)

    respond_to do |format|
      if @new_room.save
        format.html { redirect_to("/rooms/" + @new_room.id.to_s) }
      else
        format.html { render :controller => ‘rooms’, :action => "new" }
      end
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def initialize_opentok
      if @opentok.nil?
        @opentok = OpenTok::OpenTok.new 45173502, "7d31a6366913136ebdfbc733fb05b35dc033e61e"
      end
    end

    def room_params
      params.require(:room).permit(:name, :session_id)
    end  
    
end
