export DISABLE_AUTOBREW=1

sed -i'' -e 's/https:\/\/github.com\/extendr\/extendr/https:\/\/github.com\/mlondschien\/extendr/g' changeforest-r/src/rust/Cargo.toml
sed -i'' -e 's/6935c7dee0edc7e02c6355379376d8001167cd13/8e26bf66ced8216a30eed787b4b0261dc7d3872f/g' changeforest-r/src/rust/Cargo.toml

export R_VERSION=$(${R}script -e "v=R.Version(); cat(paste0(v\$major, '.', v\$minor, '\n'))")

# shellcheck disable=SC2086
${R} CMD INSTALL --build changeforest-r ${R_ARGS}