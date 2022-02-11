# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

    # Define the primary navigation
    navigation.items do |primary|
      primary.item :dashboard, 'Dashboard', '#', link_html: {icon: 'table_view'}
      primary.item :ruleset, 'Ruleset', rulesets_path, link_html: {icon: 'table_view'}
      primary.item :tests, 'Tests', '#', link_html: {icon: 'table_view'}
      primary.item :api, 'API', '#', link_html: {icon: 'table_view'} do |submenu|
        submenu.item :documentation, 'Documentation','#'
        submenu.item :test, 'Test Bench','#'
      end
      primary.item :logout, 'Exit', '#', link_html: {icon: 'table_view'}
    end
  end