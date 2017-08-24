define totpcgi::provision (
  $encoded_secret,
  $tokens          = undef,
  $window_size     = $::totpcgi::window_size,
  $rate_limit      = $::totpcgi::rate_limit,
  $disallow_reuse  = $::totpcgi::disallow_reuse,
  $totp_auth       = $::totpcgi::totp_auth,
  $hotp_counter    = $::totpcgi::hotp_counter,
) {

  file { "${totpcgi::secrets_dir}/${name}.totp":
    ensure    => file,
    seltype   => 'totpcgi_private_etc_t',
    owner     => $totpcgi::provisioning_owner,
    group     => $totpcgi::totpcgi_group,
    mode      => '0440',
    content   => template('totpcgi/secrets.totp.erb'),
    show_diff => false,
  }
}
