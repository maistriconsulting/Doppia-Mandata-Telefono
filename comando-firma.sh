d=$(mktemp -d)
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.42
target=darwin
arch=aarch64
formato=app
file=Doppia-Mandata-0.2.42-arm64-mac.zip
dimensione=131143076
sha256=516a7be7f3df431baf1b1635a4424b848cdaf7431535d463571ac9a9b02779f0
' > "$d/0"
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.42
target=darwin
arch=x86_64
formato=app
file=Doppia-Mandata-0.2.42-mac.zip
dimensione=136817850
sha256=2df41138baa6845395ec659806a63ed5b3ad33eb2d3dc1e6368a40612bd366f4
' > "$d/1"
printf '%s' 'doppia-mandata-aggiornamento-v1
versione=0.2.42
target=linux
arch=x86_64
formato=rpm
file=doppia-mandata-0.2.42.x86_64.rpm
dimensione=90370997
sha256=9bfece29a141c48c81dd95e73303e6a5bf5a5dedd6e36aa81e49a40cd14a73d6
' > "$d/2"
for i in 0 1 2; do openssl pkeyutl -sign -inkey ~/dm-firma-aggiornamenti.pem -rawin -in "$d/$i" | base64 -w0; echo; done; rm -rf "$d"
