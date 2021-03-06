class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update, :delete]

    def index
        @songs = Song.all
    end

    def show
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)

        if @song.valid?
            redirect_to @song
        else
            flash[:my_errors] = @song.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        if @song.update(song_params)
            redirect_to (@song)
        else
            flash[:my_errors] = @song.errors.full_messages
            render :edit
        end
    end

 

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to @song
      end

    private

    def find_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
