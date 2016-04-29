require "rails_helper"

feature "The index page" do
  it "has a functional RCAV", points: 1 do
    visit "/all_guesses"

    expect(page).to have_selector("h1")
  end

  it "has the first sequence", points: 1 do
    visit "/all_guesses"

    expect(page).to have_selector("li", text: "2, 4, 8 Obeys the rule")
  end

  it "has two forms", points: 2 do
    visit "/all_guesses"

    expect(page).to have_selector("form", count: 2)
  end

  it "has a label and input for \"First number:\"", points: 2 do
    visit "/all_guesses"

    expect(page).to have_selector("label", text: "First number:")
    # Write test for input with matching ID
  end

  it "has a label and input for \"Second number:\"", points: 2 do
    visit "/all_guesses"

    expect(page).to have_selector("label", text: "Second number:")
    # Write test for input with matching ID
  end

  it "has a label and input for \"Third number:\"", points: 2 do
    visit "/all_guesses"

    expect(page).to have_selector("label", text: "Third number:")
    # Write test for input with matching ID
  end

  it "has a \"Check\" button", points: 2 do
    visit "/all_guesses"

    expect(page).to have_button("Check")
  end

  it "has a label and input for \"Your answer:\"", points: 2 do
    visit "/all_guesses"

    expect(page).to have_selector("label", text: "Your answer:")
    # Write test for input with matching ID
  end

  it "has a \"I think I know it\" button", points: 2 do
    visit "/all_guesses"

    expect(page).to have_button("I think I know it")
  end

  it "has a reset link", points: 2 do
    visit "/all_guesses"

    expect(page).to have_link("Reset")
  end
end

feature "The answer form" do
  it "goes to the answer page when submitted", points: 4 do
    visit "/all_guesses"

    click_on "I think I know it"

    expect(current_path).to eq "/show_answer"
  end

  it "displays the user's answer on the answer page", points: 8 do
    visit "/all_guesses"

    fill_in("Your answer:", with: "A serviceable substitute for wit")

    click_on "I think I know it"

    expect(page).to have_content("A serviceable substitute for wit")
  end
end

feature "The sequence form" do
  it "goes back to the index page when submitted", points: 4 do
    visit "/all_guesses"

    fill_in("first", with: "3")
    fill_in("second", with: "6")
    fill_in("third", with: "12")

    click_on "Check"

    expect(current_path).to eq "/all_guesses"
  end

  it "displays a single new sequence on the index page", points: 8 do
    visit "/all_guesses"

    fill_in("first", with: "3")
    fill_in("second", with: "6")
    fill_in("third", with: "12")

    click_on "Check"

    expect(page).to have_content("3, 6, 12")
  end

  it "displays multiple new sequences on the index page", points: 16 do
    visit "/all_guesses"

    fill_in("first", with: "3")
    fill_in("second", with: "6")
    fill_in("third", with: "12")

    click_on "Check"

    fill_in("first", with: "4")
    fill_in("second", with: "8")
    fill_in("third", with: "16")

    click_on "Check"

    expect(page).to have_content("3, 6, 12")
    expect(page).to have_content("4, 8, 16")
  end

  it "tells you whether the sequences obeys the rule", points: 4 do
    visit "/all_guesses"

    fill_in("first", with: "3")
    fill_in("second", with: "6")
    fill_in("third", with: "12")

    click_on "Check"

    fill_in("first", with: "8")
    fill_in("second", with: "4")
    fill_in("third", with: "2")

    click_on "Check"

    expect(page).to have_content("3, 6, 12 Yes!")
    expect(page).to have_content("8, 4, 2 No.")
  end
end
