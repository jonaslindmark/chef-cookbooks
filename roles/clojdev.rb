name "nodedev"
description "Set up a devbox"

# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[vim]",
  "recipe[dev]",
  "recipe[clojure]",
  "recipe[zsh]"
)
# Attributes applied if the node doesn't have it set already.
override_attributes(
    'vim' => {
        'extra_packages' => ['python', 'ruby']
    }
)
default_attributes()
# Attributes applied no matter what the node has set already.
#override_attributes()
