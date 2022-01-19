export DISABLE_AUTOBREW=1

mv $RECIPE_DIR/Cargo.toml changeforest-r/src/rust/Cargo.toml
echo -e "use extendr_api::Operators;\n$(cat changeforest-r/src/rust/src/control.rs)" > changeforest-r/src/rust/src/control.rs

export R_VERSION=$(${R}script -e "v=R.Version(); cat(paste0(v\$major, '.', v\$minor, '\n'))")

# shellcheck disable=SC2086
${R} CMD INSTALL --build changeforest-r ${R_ARGS}