{ stable, ... }:
{
  # Fingerprint Authentication
  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = false;
  security.pam.services.gdm-fingerprint.text = ''
    auth       required                    pam_shells.so
    auth       requisite                   pam_nologin.so
    auth       requisite                   pam_faillock.so      preauth
    auth       required                    ${stable.fprintd}/lib/security/pam_fprintd.so
    auth       optional                    pam_permit.so
    auth       required                    pam_env.so
    auth       [success=ok default=1]      ${stable.gnome.gdm}/lib/security/pam_gdm.so
    auth       optional                    ${stable.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so

    account    include                     login

    password   required                    pam_deny.so

    session    include                     login
    session    optional                    ${stable.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so auto_start
  '';
}
