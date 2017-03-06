require "rails_helper"

describe BootstrapBuilders::Button do
  let(:user) { create :user }

  it "supports arguments given in both array and hash style" do
    visit arguments_bootstrap_builders_buttons_path
    button = find(".arguments-btn")

    expect(button[:class]).to eq "btn btn-default arguments-btn btn-block btn-danger btn-info btn-link btn-primary btn-warning btn-lg bb-btn"
    expect(button.text).to eq "Arguments label"
    expect(button[:href]).to eq "/arguments/url"
    expect(button["data-confirm"]).to eq "Are you sure?"
    expect(page).to have_http_status(:success)
    expect(current_path).to eq arguments_bootstrap_builders_buttons_path
  end

  it "supports mini as an argument" do
    visit arguments_bootstrap_builders_buttons_path
    button = find(".mini-btn")

    expect(button[:class]).to eq "btn btn-default btn-xs mini-btn bb-btn"
    expect(button.text).to eq ""
  end

  describe "#bb_destroy_btn" do
    it "renders with the correct data" do
      visit destroy_btn_bootstrap_builders_buttons_path(user_id: user.id)

      button = find(".bb-btn-destroy")
      expect(button[:href]).to eq "/test/destroy"
      expect(button.text).to eq "Delete"
      expect(button[:class]).not_to include "btn-default"

      icon = find(".bb-btn-destroy i")
      expect(icon[:class]).to eq "fa fa-remove"
    end

    it "is possible to change the icon through the configuration" do
      begin
        BootstrapBuilders.configuration.btn_destroy_icon = :pencil
        visit destroy_btn_bootstrap_builders_buttons_path(user_id: user.id)

        icon = find(".bb-btn-destroy-user i")
        expect(icon[:class]).to eq "fa fa-pencil"
      ensure
        BootstrapBuilders.configuration.btn_destroy_icon = :remove
      end
    end
  end

  describe "#bb_edit_btn" do
    it "renders with the correct data" do
      visit edit_btn_bootstrap_builders_buttons_path(user_id: user.id)

      button = find(".bb-btn-edit")
      expect(button[:href]).to eq "/test/edit"
      expect(button.text).to eq "Edit"

      icon = find(".bb-btn-edit i")
      expect(icon[:class]).to eq "fa fa-wrench"
    end

    it "is possible to change the icon through the configuration" do
      begin
        BootstrapBuilders.configuration.btn_edit_icon = :pencil
        visit edit_btn_bootstrap_builders_buttons_path(user_id: user.id)

        icon = find(".bb-btn-edit-user i")
        expect(icon[:class]).to eq "fa fa-pencil"
      ensure
        BootstrapBuilders.configuration.btn_edit_icon = :wrench
      end
    end
  end

  describe "#bb_new_btn" do
    it "renders with the correct data" do
      visit new_btn_bootstrap_builders_buttons_path

      button = find(".bb-btn-new-user")
      expect(button[:href]).to eq "/test/new"
      expect(button.text).to eq "Add new"

      icon = find(".bb-btn-new-user i")
      expect(icon[:class]).to eq "fa fa-plus"
    end

    it "is possible to change the icon through the configuration" do
      begin
        BootstrapBuilders.configuration.btn_new_icon = :pencil
        visit new_btn_bootstrap_builders_buttons_path

        icon = find(".bb-btn-new-user i")
        expect(icon[:class]).to eq "fa fa-pencil"
      ensure
        BootstrapBuilders.configuration.btn_new_icon = :plus
      end
    end
  end

  describe "#bb_show_btn" do
    it "renders with the correct data" do
      visit show_btn_bootstrap_builders_buttons_path(user_id: user.id)

      button = find(".bb-btn-show-user")
      expect(button[:href]).to eq "/test/show"
      expect(button.text).to eq "Show"

      icon = find(".bb-btn-show-user i")
      expect(icon[:class]).to eq "fa fa-square-o"
    end

    it "is possible to change the icon through the configuration" do
      begin
        BootstrapBuilders.configuration.btn_show_icon = :pencil
        visit show_btn_bootstrap_builders_buttons_path(user_id: user.id)

        icon = find(".bb-btn-show-user i")
        expect(icon[:class]).to eq "fa fa-pencil"
      ensure
        BootstrapBuilders.configuration.btn_show_icon = :"square-o"
      end
    end
  end

  it "forwards the target argument" do
    visit show_btn_bootstrap_builders_buttons_path(user_id: user.id)
    button = find(".bb-btn-show-user")
    expect(button[:target]).to eq "_blank"
  end

  it "disables the button" do
    visit disabled_btn_bootstrap_builders_buttons_path
    button = find(".bb-btn")
    expect(button[:disabled]).to eq "disabled"
  end
end
