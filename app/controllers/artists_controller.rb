class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
	end

	def new
    @artist = Artist.new #for form_for
	end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :bio) #strong params
    end
end