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
      if type($enable_hp) == 'string' {
        $enable_hp_real= str2bool($enable_hp)
      } else {
        $enable_hp_real = $enable_hp
      }

      if $enable_hp_real == true {
        include hp
      }
    }
    default: {
      fail("Manufacturer <${::manufacturer}> is not supported.")
    }
  }
}
