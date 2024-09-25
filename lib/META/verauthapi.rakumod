proto sub EXPORT(|) {*}

multi sub EXPORT(\DISTRIBUTION, |c) {
    my %META;
    %META := $_ with try DISTRIBUTION.meta;
    &EXPORT(%META, |c)
}

multi sub EXPORT(%META) is default {
    with %META<provides> {
        &EXPORT(%META, ::($_))
    }
    else {
        Map.new
    }
}

multi sub EXPORT(%META, *@classes) {
    my $ver  := %META<version>:exists ?? %META<version>.Str.Version !! Mu;
    my $auth := %META<auth> // "";
    my $api  := %META<api>  // "";

    for @classes {
        .^set_ver($ver)   unless .^ver;
        .^set_auth($auth) unless .^auth;
        .^set_api($api)   unless .^api;
    }

    Map.new
}

=begin pod

=head1 NAME

META::varauthapi - apply :ver:auth:api from META on classes

=head1 SYNOPSIS

=begin code :lang<raku>

# in distribution "Frobnicate"
class Frobnicate { }

use META::verauthapi $?DISTRIBUTION, Frobnicate;

say Frobnicate.^ver;   # v1.2.3
say Frobnicate.^auth;  # zef:lizmat
say Frobnicate.^api;   # 0

=end code

=head1 DESCRIPTION

META::varauthapi provides an easy way to keep the meta information of
one of more classes in a distribution in sync with the information in
the META6.json file of that distribution.

The C<use> statement needs to be specified with the C<$?DISTRIBUTION>
variable, and will by default set the C<:ver>, C<:auth> and C<:api>
of the all the classes listed in the C<"provides"> field in the META
information.

For more control, it is also possible to list the classes to set as
additional arguments in the C<use> statement.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/META-verauthapi .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
