require "rails_helper"

feature "The index page" do
  scenario "has a functional RCAV", points: 5 do
    visit "/all_guesses"

    expect(page).to have_selector("h1", text: "A Quick Puzzle to Test Your Problem Solving")
  end

  scenario "has two forms", points: 5 do
    visit "/all_guesses"

    expect(page).to have_selector("form", count: 2)
  end

  scenario "has the first sequence", points: 5 do
    visit "/all_guesses"

    expect(page).to have_selector("li", text: "2, 4, 8 Obeys the rule")
  end

  scenario "has a reset link", points: 5 do
    visit "/all_guesses"

    expect(page).to have_link("Reset")
  end

  scenario "has a blah link", points: 5 do
    visit "/all_guesses"

    expect(page).to have_link("Blah")
  end

end
