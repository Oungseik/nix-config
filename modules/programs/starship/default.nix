{ ... }: {
  programs.starship = {
    # custom settings
    settings = {
      add_newline = true;
      line_break.disabled = false;

      aws.disabled = true;
      gcloud.disabled = true;

    };
  };
}
