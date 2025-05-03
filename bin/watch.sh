#!/usr/bin/env bash
set -eu

watch_files=(common.sass light.sass dark.sass)

compile_all() {
  sass common.sass ods-campfire/theme/common.css
  sass light.sass ods-campfire/theme/light.css
  sass dark.sass ods-campfire/theme/dark.css
}
compile_all

inotifywait -m -e close_write --format '%w%f' "${watch_files[@]}" | while read -r file; do
  name="$(basename "${file%.sass}")"
  #echo "Compiling $file → ods-campfire/theme/${name}.css"
  echo $file
  #sass "$file" "ods-campfire/theme/${name}.css"
  compile_all
done
