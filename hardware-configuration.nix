# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/91538bc8-ebd0-4c5c-b99c-5dbaf112e3da";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/BF30-AC4D";
      fsType = "vfat";
    };
  
  fileSystems."/home/yuna/mnt/nvme" =
    { device = "/dev/disk/by-uuid/EA68D2B168D27BAF";
      fsType = "ntfs";
      options = [ "rw" "uid=1000" "gid=100" "nofail" ];
    };
  
  fileSystems."/home/yuna/mnt/hdd" =
    { device = "/dev/disk/by-uuid/F60E49E20E499D0D";
      fsType = "ntfs";
      options = [ "rw" "uid=1000" "gid=100" "nofail" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d65af49e-cfa0-421d-ad3c-33b62f48801b"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
