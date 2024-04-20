{ ... }:
{
  # Printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
  hardware.printers = {
    ensurePrinters = [
      {
        name = "Brother_HL-L2370DW";
        location = "Home";
        deviceUri = "http://brw802bf96c8917.home.dubs.zone:631/ipp";
        model = "drv:///cupsfilters.drv/pwgrast.ppd";
      }
    ];
    ensureDefaultPrinter = "Brother_HL-L2370DW";
  };
}
