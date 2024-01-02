export DISABLE_AUTOBREW=1

# Pass R version to libR-sys package via environment variable. This allows for cross-compilation,
# and thus osx-arm64 builds. See also https://github.com/extendr/libR-sys/issues/85.
export LIBRSYS_R_VERSION=$(${R}script -e "v=R.Version(); cat(paste0(v\$major, '.', v\$minor, '\n'))")
# shellcheck disable=SC2086
${R} CMD INSTALL --build changeforest-r ${R_ARGS}