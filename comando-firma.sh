d=$(mktemp -d)
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.44
target=darwin
arch=aarch64
formato=app
file=Doppia-Mandata-0.2.44-arm64-mac.zip
dimensione=131142740
sha256=f41aa0176652444a9ec9b6e1bc145e9fc44acb4a292374415dc76c6c4567b3bb
' > "$d/0"
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.44
target=darwin
arch=x86_64
formato=app
file=Doppia-Mandata-0.2.44-mac.zip
dimensione=136817509
sha256=35c3dca88cb5d91c4bcf8099fb8c29bfeac6401f3d0ddf827f15e49d9e74edb4
' > "$d/1"
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.44
target=linux
arch=x86_64
formato=rpm
file=doppia-mandata-0.2.44.x86_64.rpm
dimensione=90390485
sha256=ac6a4ccbbd1bcd36bc8a9e89843055bfbea63a850437f06bd14f93260318b2da
' > "$d/2"
for i in 0 1 2; do openssl pkeyutl -sign -inkey ~/dm-firma-aggiornamenti.pem -rawin -in "$d/$i" | base64 -w0; echo; done; rm -rf "$d"
