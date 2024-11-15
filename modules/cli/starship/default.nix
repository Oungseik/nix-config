{ ... }:
{
  programs.starship = {
    # custom settings
    settings = {
      add_newline = true;
      line_break.disabled = false;

      cmd_duration.disabled = true;

      directory = {
        truncation_length = 3;
      };

      aws.disabled = true;
      azure.disabled = true;
      battery.disabled = true;
      cobol.disabled = true;
      conda.disabled = true;
      container.disabled = true;
      crystal.disabled = true;
      daml.disabled = true;
      dart.disabled = true;
      docker_context.disabled = true;
      dotnet.disabled = true;
      gcloud.disabled = true;
      gradle.disabled = true;
      haxe.disabled = true;
      helm.disabled = true;
      java.disabled = true;
      julia.disabled = true;
      kotlin.disabled = true;
      kubernetes.disabled = true;
      lua.disabled = true;
      meson.disabled = true;
      hg_branch.disabled = true;
      nim.disabled = true;
      ocaml.disabled = true;
      opa.disabled = true;
      openstack.disabled = true;
      perl.disabled = true;
      php.disabled = true;
      pijul_channel.disabled = true;
      pulumi.disabled = true;
      purescript.disabled = true;
      python.disabled = true;
      quarto.disabled = true;
      rlang.disabled = true;
      raku.disabled = true;
      red.disabled = true;
      ruby.disabled = true;
      scala.disabled = true;
      singularity.disabled = true;
      spack.disabled = true;
      swift.disabled = true;
      terraform.disabled = true;
      vlang.disabled = true;

    };
  };
}
