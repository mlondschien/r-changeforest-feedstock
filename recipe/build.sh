export DISABLE_AUTOBREW=1

sed -i'' -e 's/https:\/\/github.com\/extendr\/extendr/https:\/\/github.com\/mlondschien\/extendr/g' changeforest-r/src/rust/Cargo.toml
sed -i'' -e 's/6935c7dee0edc7e02c6355379376d8001167cd13/91ad0f38f1363aecfb16bf9ba71f2f7da1735719/g' changeforest-r/src/rust/Cargo.toml

export R_VERSION=$(${R}script -e "v=R.Version(); cat(paste0(v\$major, '.', v\$minor, '\n'))")

# shellcheck disable=SC2086
${R} CMD INSTALL --build changeforest-r ${R_ARGS}