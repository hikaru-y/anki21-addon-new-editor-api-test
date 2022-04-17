declare DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

rm -rf "$DIR/dist/*"

cp -rf "$DIR/__init__.py" \
  "$DIR/manifest.json" \
  "$DIR/dist"

mkdir -p "$DIR/dist/src"
find . -wholename './src/*.pyc' -exec rm -f '{}' \;
find . -wholename './src/*.py'  -exec cp --parents '{}' "$DIR/dist" \;

yarn --cwd "$DIR/web" build

echo 'Was successfully compiled!'
