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
        BEGIN Map.new
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

    BEGIN Map.new
}

# vim: expandtab shiftwidth=4
