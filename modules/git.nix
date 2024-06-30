
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.git;

in {
    options.modules.git = { enable = mkEnableOption "git"; };
    config = mkIf cfg.enable {
        programs.git = {
            enable = true;
            userName = "pfennigbube";
            userEmail = "lucasecakrdt6@tutanota.com";
            extraConfig = {
                init = { defaultBranch = "main"; };
            };
        };
    };
}
