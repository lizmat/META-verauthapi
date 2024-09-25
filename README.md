[![Actions Status](https://github.com/lizmat/META-verauthapi/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/META-verauthapi/actions) [![Actions Status](https://github.com/lizmat/META-verauthapi/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/META-verauthapi/actions) [![Actions Status](https://github.com/lizmat/META-verauthapi/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/META-verauthapi/actions)

NAME
====

META::verauthapi - apply :ver:auth:api from META on classes

SYNOPSIS
========

```raku
# in distribution "Frobnicate"
class Frobnicate { }

use META::verauthapi $?DISTRIBUTION, Frobnicate;

say Frobnicate.^ver;   # v1.2.3
say Frobnicate.^auth;  # zef:lizmat
say Frobnicate.^api;   # 0
```

DESCRIPTION
===========

META::varauthapi provides an easy way to keep the meta information of one of more classes in a distribution in sync with the information in the META6.json file of that distribution.

The `use` statement needs to be specified with the `$?DISTRIBUTION` variable, and will by default set the `:ver`, `:auth` and `:api` of the all the classes listed in the `"provides"` field in the META information.

For more control, it is also possible to list the classes to set as additional arguments in the `use` statement.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/META-verauthapi . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

