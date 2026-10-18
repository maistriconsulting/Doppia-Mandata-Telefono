d=$(mktemp -d)
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.43
target=darwin
arch=aarch64
formato=app
file=Doppia-Mandata-0.2.43-arm64-mac.zip
dimensione=131143013
sha256=01f61929e4380bc9efee5a8979583436cea616d135c5af6b2556c43205e127eb
' > "$d/0"
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.43
target=darwin
arch=x86_64
formato=app
file=Doppia-Mandata-0.2.43-mac.zip
dimensione=136817785
sha256=b31ba82f04e21412195727c222136c75308b4d14e5dc9a3eb0aa677707b7ab94
' > "$d/1"
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.43
target=linux
arch=x86_64
formato=rpm
file=doppia-mandata-0.2.43.x86_64.rpm
dimensione=90368057
sha256=c2ea418951dfbec4bde1eb502e89994c41874768e7958a6049ec11894a8671b9
' > "$d/2"
for i in 0 1 2; do openssl pkeyutl -sign -inkey ~/dm-firma-aggiornamenti.pem -rawin -in "$d/$i" | base64 -w0; echo; done; rm -rf "$d"
