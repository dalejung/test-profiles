#!/bin/sh

unzip -o primesieve-4.2-src.zip
cd primesieve-4.2

if [ -n "`make --version | grep GNU`" ]; then
  make
else
  gmake
fi
echo $? > ~/install-exit-status
cd ..

echo "#!/bin/sh
primesieve-4.2/bin/./primesieve \$@ > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > primesieve
chmod +x primesieve
