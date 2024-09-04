let
  gpuIDs = [
    "10de:1f99" # Graphics
    "10de:10fa" # Audio
  ];
in { pkgs, lib, config, ... }: {
  options.vfio.enable = with lib;
    mkEnableOption "Configure the machine for VFIO";

  config = let cfg = config.vfio;
  in {
    boot = {
      initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
          #"vfio_virqfd"

        "nvidia"
        "nvidia_modeset"
        "nvidia_uvm"
        "nvidia_drm"
      ];

      kernelParams = [
        # enable IOMMU
        "amd_iommu=on"
      ] ++ lib.optional cfg.enable
        # isolate the GPU
        ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs);
    };

    # hardware.opengl.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
