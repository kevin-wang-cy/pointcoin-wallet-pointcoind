#!/bin/sh
# create soft link for other wallet daemon binary at pointcoind
if [ ! -e "/usr/local/bin/pointcoind" ]; then
    ln -s /usr/local/bin/$WALLETD_BIN /usr/local/bin/pointcoind
    echo "Linked /usr/local/bin/$WALLETD_BIN to /usr/local/bin/pointcoind."
fi

# create user pointcoin:pointcoin
addgroup --gid 9999 pointcoin
adduser --uid 9999 --gid 9999 --disabled-password --gecos "pointcoin" pointcoin
usermod -L pointcoin

# mkdir .pointcoind
mkdir -p /home/pointcoin/.pointcoind
chmod 700 /home/pointcoin/.pointcoind
chown pointcoin:pointcoin /home/pointcoin/.pointcoind

# mkdir /var/log/pointcoin
mkdir -p /var/log/pointcoin
chmod 700 /var/log/pointcoin
chown pointcoin:pointcoin /var/log/pointcoin
