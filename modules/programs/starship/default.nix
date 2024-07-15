{ ... }: {
  programs.starship = {
    # custom settings
    settings = {
      add_newline = true;
      line_break.disabled = false;

      aws.disabled = true;
      gcloud.disabled = true;

      cmd_duration.disabled = true;

      directory = {
        truncation_length = 1;
      };

      java.disabled = true;

    };
  };
}
