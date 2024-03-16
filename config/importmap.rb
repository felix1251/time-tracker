# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin 'stimulus-notification' # @2.2.0
pin 'hotkeys-js' # @3.13.3
pin 'stimulus-use' # @0.51.3
pin "stimulus-rails-autosave" # @5.1.0
