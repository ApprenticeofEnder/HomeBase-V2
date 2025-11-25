{
  programs.btop = {
    enable = true;
    themes = {
      nordic = builtins.readFile ./themes/nordic.theme;
    };
    settings = {
      theme = "nordic";
    };
  };
}
