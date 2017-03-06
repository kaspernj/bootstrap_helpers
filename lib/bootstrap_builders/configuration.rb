class BootstrapBuilders::Configuration
  attr_accessor :default_table_classes, :btn_index_icon, :btn_show_icon, :btn_new_icon, :btn_edit_icon, :btn_destroy_icon

  def initialize
    @default_table_classes = [:bordered, :hover, :striped]

    @btn_index_icon = :table
    @btn_show_icon = :"square-o"
    @btn_new_icon = :plus
    @btn_edit_icon = :wrench
    @btn_destroy_icon = :remove
  end
end
