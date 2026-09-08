# m-openwrt-compiling — official OpenWrt branch

This branch builds firmware from the official [OpenWrt](https://github.com/openwrt/openwrt) source tree.
The legacy LEDE-based setup remains on `main`.

Currently configured devices:

- Netcore N60 Pro (`mediatek/filogic`, `netcore_n60-pro`)
- Cudy TR3000 v1 (`mediatek/filogic`, `cudy_tr3000-v1`)

The GitHub Actions workflow defaults to OpenWrt `v25.12.5` and can be pointed at another tag or branch when manually dispatched.

## Repository layout

```text
configs/
  n60pro.config
  tr3000.config
scripts/
  feeds.sh
  customize.sh
.github/workflows/
  build-official-openwrt.yml
```

`configs/*.config` are intended to be small `diffconfig` / seed configs rather than fully expanded `.config` files.

## Local menuconfig workflow

Use the same OpenWrt ref and feeds as CI:

```bash
git clone --depth=1 --branch v25.12.5 https://github.com/openwrt/openwrt.git
cd openwrt

/path/to/m-openwrt-compiling/scripts/feeds.sh
./scripts/feeds update -a
./scripts/feeds install -a

cp /path/to/m-openwrt-compiling/configs/n60pro.config .config
make defconfig
make menuconfig
```

After saving the menu configuration, export only the intentional choices:

```bash
./scripts/diffconfig.sh > /path/to/m-openwrt-compiling/configs/n60pro.config
```

Replace `n60pro` with `tr3000` when configuring the Cudy router.

## PassWall2

PassWall2 and its package feed are added by `scripts/feeds.sh` before `feeds update/install`, so the same packages are visible in local `menuconfig` and GitHub Actions.

## CI

Run **Build Official OpenWrt** manually from GitHub Actions and select the device. The workflow records the exact OpenWrt and PassWall feed commit SHAs alongside the resolved diffconfig for reproducibility.
