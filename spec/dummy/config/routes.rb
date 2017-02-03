Rails.application.routes.draw do
  devise_for :users
  mount BootstrapBuilders::Engine => "/bootstrap_builders"

  namespace :bootstrap_builders do
    resources :attribute_rows, only: [] do
      collection do
        get :model_rows
      end
    end

    resources :buttons, only: [] do
      collection do
        get :arguments
        get :destroy_btn
        get :disabled_btn
        get :edit_btn
        get :new_btn
        get :responsive_btn
        get :show_btn
      end
    end

    resources :date_picker_inputs, only: [] do
      collection do
        get :date_picker_input
        get :date_time_picker_input
      end
    end

    resources :flashes, only: [] do
      collection do
        get :generate_flash
        get :show_flash
        get :show_flash_with_custom_class
      end
    end

    resources :panels, only: [] do
      collection do
        get :panel_with_content
        get :panel_with_no_header
        get :panel_with_table
        get :panel_with_table_and_custom_classes
      end
    end

    resources :progress_bars, only: [] do
      collection do
        get :normal_progress_bar
      end
    end

    resources :tables, only: [] do
      collection do
        get :custom_classes
        get :normal_table
        get :responsive_table
      end
    end

    resources :tabs, only: [] do
      collection do
        get :normal_tabs
        get :pills
      end
    end

    resources :users
  end
end
