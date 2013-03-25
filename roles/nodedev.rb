name "nodedev"
description "Set up a devbox"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(
  "recipe[apt]",
  "recipe[nodejs]",
  "recipe[git]"
)
# Attributes applied if the node doesn't have it set already.
override_attributes(
    'nodejs' => {
        'version' => '0.10.1'
    })
default_attributes()
# Attributes applied no matter what the node has set already.
#override_attributes()
