require 'spec_helper'

describe "Viewing the movie details" do

  it "shows the movies details" do

    movie = Movie.create(movie_attributes(total_gross: 318412101.00))

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.duration)
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")
    
    end

  it "shows the total gross if the total gross exceeds $50M" do
    movie = Movie.create(movie_attributes(total_gross: 60000000.00))
  
  	visit movie_url(movie)
  
  	expect(page).to have_text("$60,000,000.00")
  end

  it "shows 'Flop!' if the total gross is less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 40000000.00))
  
  	visit movie_url(movie)
  
  	expect(page).to have_text("Flop!")
  end

end