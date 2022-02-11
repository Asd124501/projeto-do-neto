require "application_system_test_case"

class RulesetsTest < ApplicationSystemTestCase
  setup do
    @ruleset = rulesets(:one)
  end

  test "visiting the index" do
    visit rulesets_url
    assert_selector "h1", text: "Rulesets"
  end

  test "should create ruleset" do
    visit rulesets_url
    click_on "New ruleset"

    fill_in "Name", with: @ruleset.name
    fill_in "Number of rules", with: @ruleset.number_of_rules
    fill_in "Tags", with: @ruleset.tags
    click_on "Create Ruleset"

    assert_text "Ruleset was successfully created"
    click_on "Back"
  end

  test "should update Ruleset" do
    visit ruleset_url(@ruleset)
    click_on "Edit this ruleset", match: :first

    fill_in "Name", with: @ruleset.name
    fill_in "Number of rules", with: @ruleset.number_of_rules
    fill_in "Tags", with: @ruleset.tags
    click_on "Update Ruleset"

    assert_text "Ruleset was successfully updated"
    click_on "Back"
  end

  test "should destroy Ruleset" do
    visit ruleset_url(@ruleset)
    click_on "Destroy this ruleset", match: :first

    assert_text "Ruleset was successfully destroyed"
  end
end
