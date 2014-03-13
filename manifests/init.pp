# ## Class: physical ##
#
# Meant to be applied to any system that is physical.
#
# ### Parameters ###
#
# enable_hp
# ---------
# Boolean to include ghoneycutt/hp
#
# - *Default*: false
#
class physical (
  $enable_hp = false,
) {

  case $::manufacturer {
    'hp': {
      # validate type and convert string to boolean if necessary
      $enable_hp_type = type($enable_hp)
      if $enable_hp_type == 'string' {
        $hp_enabled = str2bool($enable_hp)
      } else {
        $hp_enabled = $enable_hp
      }
      if $hp_enabled == true {
        include hp
      }
    }
    'Supermicro': {
      #We don't do anything with this
    }
    default: {
      fail("Manufacturer <${::manufacturer}> is not supported.")
    }
  }
}
