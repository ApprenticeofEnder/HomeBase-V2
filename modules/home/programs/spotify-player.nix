{pkgs, ...}: {
  programs.spotify-player = {
    enable = true;
    package = pkgs.spotify-player.override {
      withAudioBackend = "pulseaudio";
    };
  };
}
