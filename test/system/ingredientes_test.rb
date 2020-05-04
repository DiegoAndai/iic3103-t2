require "application_system_test_case"

class IngredientesTest < ApplicationSystemTestCase
  setup do
    @ingrediente = ingredientes(:one)
  end

  test "visiting the index" do
    visit ingredientes_url
    assert_selector "h1", text: "Ingredientes"
  end

  test "creating a Ingrediente" do
    visit ingredientes_url
    click_on "New Ingrediente"

    fill_in "Descripcion", with: @ingrediente.descripcion
    fill_in "Nombre", with: @ingrediente.nombre
    click_on "Create Ingrediente"

    assert_text "Ingrediente was successfully created"
    click_on "Back"
  end

  test "updating a Ingrediente" do
    visit ingredientes_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @ingrediente.descripcion
    fill_in "Nombre", with: @ingrediente.nombre
    click_on "Update Ingrediente"

    assert_text "Ingrediente was successfully updated"
    click_on "Back"
  end

  test "destroying a Ingrediente" do
    visit ingredientes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ingrediente was successfully destroyed"
  end
end
