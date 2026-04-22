# android-sagemath

Automatic script for installing and running [Sage Mathematical Software](https://github.com/sagemath/sage) on Android devices.

## Get started

- Install [Termux](https://github.com/termux/termux-app) app.
- Prevent the device from going into a deep sleep mode:
   - Allow Termux to run in the background.
   - Acquire a [wakelock](https://wiki.termux.com/wiki/Termux-wake-lock).
- Be patient: the installation takes about 30 minutes on an [average smartphone](https://en.wikipedia.org/wiki/OnePlus_7) if you have a good internet connection.

### Quick Install

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SHLEM666/android-sagemath/master/quickinstall.sh)"
```

### Custom Install

```bash
pkg update
pkg install git
git clone https://github.com/SHLEM666/android-sagemath.git
cd android-sagemath
cp config.sample config.env
# edit config.env #
./install.sh
```

### Run

```bash
cd android-sagemath
./start.sh
```

## Hints

> *Almost all the folder names and paths mentioned in this section are fictitious, and are provided as examples for clarity. Any resemblance to real folders and paths, existing or deleted, is purely coincidental.*

### Access shared storage

Grant Termux [storage](https://wiki.termux.com/wiki/Internal_and_external_storage) access permission:
```bash
termux-setup-storage
```
> [!IMPORTANT]
> The path to the **same location** in the **Internal shared storage** for PRoot and for Termux may be different:
>    - Device's OS: `/storage/emulated/0/Download`
>    - Termux: `~/storage/shared/Download` or `~/storage/downloads`
>    - PRoot: `/sdcard/Download`

### Backup / Restore

- [Backup](https://github.com/termux/proot-distro#backing-up-distribution) the PRoot distribution with alias `debiansage`:
   ```bash
   proot-distro backup --output ~/storage/downloads/debiansage_backup.tar.gz debiansage
   ```

- [Restore](https://github.com/termux/proot-distro#restore-from-backup) the PRoot distribution from `debiansage_backup.tar.gz` file:
   ```bash
   proot-distro restore ~/storage/downloads/debiansage_backup.tar.gz
   ```

### Other SageMath startup parameters

Modify `config.env` file:
```
# proot distribution name
export SAGE_DISTR_NAME="debiansage"

# sagemath work directory
export SAGE_WORK_DIR="/sdcard/Download/Autosync/Jupyter"

# additional options for sagemath
export SAGE_OPTIONS="--no-browser --NotebookApp.token='' --expose-app-in-browser"
```

### Involuntary scrolling up in JupyterLab on mobile browsers

Due to this [bug](https://github.com/jupyterlab/jupyterlab/issues/18279), it is almost impossible to work in [JupyterLab](https://github.com/jupyterlab/jupyterlab) in Chromium-based mobile browsers.
Until this is fixed, you can downgrade JupyterLab to version `4.2.7` or earlier, which does not have this issue.
```
proot-distro login debiansage
conda activate sage
conda install jupyterlab=4.2.7
```

## See also

- [Miniforge](https://github.com/conda-forge/miniforge)

## Thanks to

- [Egando](https://github.com/egandro), on whose [docker-qemu-arm](https://github.com/egandro/docker-qemu-arm) the concept of this repository is based.
- [Robertkirkman](https://github.com/robertkirkman) for his [ARM emulator installation gist](https://gist.github.com/robertkirkman/f79441c79811ad263f2f881f7864e793) and for his [help](https://github.com/termux/proot-distro/issues/575).
- [George-Seven](https://github.com/George-Seven) for his [Termux-Proot-Utils](https://github.com/George-Seven/Termux-Proot-Utils).
- Creators, maintainers and contributors of all the wonderful projects that made this happen.
