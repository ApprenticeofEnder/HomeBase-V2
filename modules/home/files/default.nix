{pkgs, ...}: {
  home.file = {
    ".local/bin/fit" = {
      source = ./fit.sh;
      executable = true;
    };
  };
}
