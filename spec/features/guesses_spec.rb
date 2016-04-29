require "rails_helper"

feature "The index page" do
  it "has a functional RCAV", points: 5 do
    visit "/all_guesses"

    expect(page).to have_selector("h1")
  end

  it "has the first sequence", points: 5 do
    visit "/all_guesses"

    expect(page).to have_selector("li", text: "2, 4, 8 Obeys the rule")
  end

  it "has two forms", points: 5 do
    visit "/all_guesses"

    expect(page).to have_selector("form", count: 2)
  end

  it "has a \"Check\" button", points: 5 do
    visit "/all_guesses"

    expect(page).to have_button("Check")
  end

  it "has a \"I think I know it\" button", points: 5 do
    visit "/all_guesses"

    expect(page).to have_button("I think I know it")
  end

  it "has a reset link", points: 5 do
    visit "/all_guesses"

    expect(page).to have_link("Reset")
  end
end

feature "The answer form" do
  it "goes to the answer page when submitted", points: 5 do
    visit "/all_guesses"

    click_on "I think I know it"

    expect(current_path).to eq "/show_answer"
  end

  it "displays the user's answer on the answer page" do
    visit "/all_guesses"

    fill_in("rule", with: "A serviceable substitute for wit")

    click_on "I think I know it"

    expect(page).to have_content("A serviceable substitute for wit")
  end
end
