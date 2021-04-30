class GenresController < ApplicationController
    before_action :find_genre, only: [:edit, :update]

    def show
        #@genre = Genres.find_by_id(params[:id])
        find_genre
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to new_genre_path
    end

    def edit
        find_genre
    end

    def update
        find_genre
        @genre.update(genre_params)
        redirect_to genre_path(@genre)
    end

    private

    def find_genre
        @genre = Genre.find_by_id(params[:id])
    end

    def genre_params
        params.require(:genre).permit(:name)
    end
end
