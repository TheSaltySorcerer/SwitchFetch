# NX-Switch Neofetch Theme

A Switchroot Linux Neofetch preset for the NX-Switch: a compact cyan/red Joy-Con mark, Tegra X1/GM20B identification, live CPU/GPU temperatures, and battery state.

The layout is based on the Switch logo in [NX-Fetch](https://github.com/Xc987/NX-Fetch), adapted for Neofetch's custom ASCII source format. The original left-cyan/right-red `#` artwork is shortened slightly to keep the terminal layout balanced. The `NINTENDO / NX · L4T` footer is retained.

## Install

Target: Switchroot L4T Ubuntu Noble 24.04, including its KDE and Unity desktop flavors. Switchroot lists these images for Erista and Mariko hardware. The theme uses Neofetch's standard Bash configuration format and does not depend on a desktop environment.

The original setup was verified on Ubuntu Noble with Neofetch 7.1. Hardware telemetry is discovered at runtime: thermal-zone names are matched where the kernel provides them, with the common Switchroot zone indices as fallback; battery details are omitted automatically if the battery sysfs interface is unavailable. Other distributions, Switchroot releases, and Neofetch versions have not been independently verified.

```bash
bash install.sh --autostart
```

`install.sh` copies the theme into `${XDG_CONFIG_HOME:-~/.config}/neofetch`. Existing `config.conf` and `nx-ascii` files are backed up with a timestamp before replacement. `--autostart` adds a marked Neofetch block to `~/.bashrc`; omit it to install the theme without changing shell startup.

Run `neofetch` in a terminal. To remove auto-start, delete the block marked `NX-Switch Neofetch autostart` from `~/.bashrc`. Restore the timestamped config backup if you want your previous Neofetch setup back.

## Hardware telemetry

The preset searches thermal-zone type names for CPU/GPU sensors and falls back to the common Switchroot zone indices (1 and 2). It searches power-supply sysfs entries for a readable battery capacity and omits unavailable values as `N/A`. Sensor labels, thermal zones, and battery interfaces can vary across kernel builds, so the live temperatures and battery display were confirmed only on one Switchroot installation; the other supported hardware/flavor combinations have not been physically tested.

## Attribution and license

The Joy-Con `#` artwork is adapted from `printAscii()` in [Xc987/NX-Fetch](https://github.com/Xc987/NX-Fetch), copyright Xc98, under the MIT license. The complete upstream notice is included in [LICENSE](LICENSE). The Neofetch configuration and installer are also released under MIT.
