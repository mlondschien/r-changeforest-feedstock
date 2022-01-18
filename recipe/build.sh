export DISABLE_AUTOBREW=1

sed -i'' -e 's/https:\/\/github.com\/extendr\/extendr/https:\/\/github.com\/mlondschien\/extendr/g' changeforest-r/src/rust/Cargo.toml
sed -i'' -e 's/6935c7dee0edc7e02c6355379376d8001167cd13/42f2b96ea1d5650b8f137d3d33d2a9f2806d02d3/g' changeforest-r/src/rust/Cargo.toml

echo "v=R.Version(); cat(paste0(v\$major, '.', v\$minor))" > _tmp.r
export R_VERSION=$(${R} _tmp.R)

# shellcheck disable=SC2086
${R} CMD INSTALL --build changeforest-r ${R_ARGS}