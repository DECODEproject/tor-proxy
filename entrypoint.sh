
if [ -z "$TOR_NODE" ]; then
    echo "No TOR_NODE environment variable set, exiting"
    exit 1
fi

sed -i -e "s|##TOR_NODE##|$TOR_NODE|" chainspace.toml

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

/etc/init.d/supervisor start &

rsocks --config=/code/chainspace.toml
