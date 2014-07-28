pushd unpv12e_patched
find . -type d | sed s#.*xti.*##g | xargs -n1 -I{} bash -c 'pushd {}; make; popd;'
popd