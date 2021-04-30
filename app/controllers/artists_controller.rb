class ArtistsController < ApplicationController
    before_action :find_artist, only: [:edit, :update]

    def show
       # @artist = Artist.find_by_id(params[:id])
        find_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        @artist.save
        redirect_to new_artist_path
    end

    def edit
       # @artist = Artist.find(params[:id])
        find_artist
    end

    def update
       # @artist = Artist.find(params[:id])
       find_artist
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end

private
    def find_artist
        @artist = Artist.find_by_id(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
end
