{
  config,
  pkgs,
  ...
}: let
  profile = {
    realname = config.me.fullname;
    nicks = [config.me.username];
  };
in {
  programs.tiny = {
    enable = pkgs.stdenv.isLinux;
    settings = {
      servers = [
        {
          tls = true;
          port = 6697;
          addr = "irc.libera.chat";
          realname = profile.realname;
          nicks = profile.nicks;
        }
      ];
      defaults = {
        nicks = profile.nicks;
        realname = profile.realname;
        join = [];
        tls = true;
      };
    };
  };
}
