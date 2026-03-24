kind: script

build-depends:
- components/_private/systemd-stage1.bst


config:
  commands:
  - ls -lA %{indep-libdir}/udev/hwdb.d
  - uname -a
  - |
    export SYSTEMD_LOG_LEVEL=debug
    systemd-hwdb --usr update
    mkdir -p %{install-root}%{indep-libdir}/udev/
    mv %{indep-libdir}/udev/hwdb.bin %{install-root}%{indep-libdir}/udev/
