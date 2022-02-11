require "test_helper"

class RulesetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ruleset = rulesets(:one)
  end

  test "should get index" do
    get rulesets_url
    assert_response :success
  end

  test "should get new" do
    get new_ruleset_url
    assert_response :success
  end

  test "should create ruleset" do
    assert_difference("Ruleset.count") do
      post rulesets_url, params: { ruleset: { name: @ruleset.name, number_of_rules: @ruleset.number_of_rules, tags: @ruleset.tags } }
    end

    assert_redirected_to ruleset_url(Ruleset.last)
  end

  test "should show ruleset" do
    get ruleset_url(@ruleset)
    assert_response :success
  end

  test "should get edit" do
    get edit_ruleset_url(@ruleset)
    assert_response :success
  end

  test "should update ruleset" do
    patch ruleset_url(@ruleset), params: { ruleset: { name: @ruleset.name, number_of_rules: @ruleset.number_of_rules, tags: @ruleset.tags } }
    assert_redirected_to ruleset_url(@ruleset)
  end

  test "should destroy ruleset" do
    assert_difference("Ruleset.count", -1) do
      delete ruleset_url(@ruleset)
    end

    assert_redirected_to rulesets_url
  end
end
