require "application_system_test_case"

class HamburguesasTest < ApplicationSystemTestCase
  setup do
    @hamburguesa = hamburguesas(:one)
  end

  test "visiting the index" do
    visit hamburguesas_url
    assert_selector "h1", text: "Hamburguesas"
  end

  test "creating a Hamburguesa" do
    visit hamburguesas_url
    click_on "New Hamburguesa"

    fill_in "Descripcion", with: @hamburguesa.descripcion
    fill_in "Imagen", with: @hamburguesa.imagen
    fill_in "Nombre", with: @hamburguesa.nombre
    fill_in "Precio", with: @hamburguesa.precio
    click_on "Create Hamburguesa"

    assert_text "Hamburguesa was successfully created"
    click_on "Back"
  end

  test "updating a Hamburguesa" do
    visit hamburguesas_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @hamburguesa.descripcion
    fill_in "Imagen", with: @hamburguesa.imagen
    fill_in "Nombre", with: @hamburguesa.nombre
    fill_in "Precio", with: @hamburguesa.precio
    click_on "Update Hamburguesa"

    assert_text "Hamburguesa was successfully updated"
    click_on "Back"
  end

  test "destroying a Hamburguesa" do
    visit hamburguesas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hamburguesa was successfully destroyed"
  end
end
