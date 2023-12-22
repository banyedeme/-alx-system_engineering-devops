#!/usr/bin/pup
# Installs flask version 2.1.0 and werkzeug 2.1.1

package {'werkzeug':
ensure   => '2.1.1',
provider => 'pip3',
}

package { 'flask':
ensure   => '2.1.0',
provider => 'pip3',
}
