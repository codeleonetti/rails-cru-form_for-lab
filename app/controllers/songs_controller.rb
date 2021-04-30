class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update]
    def index
        @song = Song.all
    end

    def show
        #@genre = Genres.find_by_id(params[:id])
        find_song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        @song.save
        redirect_to song_path(@song)
    end

    def edit
        find_song
    end

    def update
        find_song
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    private

    def find_song
        @song = Song.find_by_id(params[:id])
    end

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end


end
