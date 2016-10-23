#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/osk/AO/src/ao_package"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/osk/AO/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/osk/AO/install/lib/python2.7/dist-packages:/home/osk/AO/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/osk/AO/build" \
    "/usr/bin/python" \
    "/home/osk/AO/src/ao_package/setup.py" \
    build --build-base "/home/osk/AO/build/ao_package" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/osk/AO/install" --install-scripts="/home/osk/AO/install/bin"
