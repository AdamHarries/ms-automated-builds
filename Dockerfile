from ubuntu:bionic 

# base 
run apt-get upgrade \ 
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \ 
    git \
    cmake \
    g++ \
    libasound2-dev \
    portaudio19-dev \
    libmp3lame-dev \
    libsndfile1-dev \
    libportmidi-dev \
    libssl-dev \
    libpulse-dev \
    libfreetype6-dev \
    libfreetype6 \
    libdrm-dev \
    libgl1-mesa-dev \
    libegl1-mesa-dev \
    qtbase5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    qtwebengine5-dev \
    qtscript5-dev \
    libqt5xmlpatterns5-dev \
    libqt5svg5-dev \
    libqt5webkit5-dev \
    qtquickcontrols2-5-dev \ 
    libqt5opengl5-dev
        
env PREFIX=/home/musescore/install-dir \
    BUILD_LAME="ON" \
    BUILD_PULSEAUDIO="ON" \
    BUILD_JACK="ON"       \
    BUILD_PORTAUDIO="ON"  \
    BUILD_WEBENGINE="ON"  \
    USE_SYSTEM_FREETYPE="OFF" \
    COVERAGE="OFF"        \
    DOWNLOAD_SOUNDFONT="ON"   \
    NO_RPATH="FALSE"


workdir /home/musescore/build-dir 
cmd cmake -DCMAKE_BUILD_TYPE=RELEASE	       \
        -DCMAKE_INSTALL_PREFIX="${PREFIX}"       \
        -DMSCORE_INSTALL_SUFFIX=""               \
        -DMUSESCORE_LABEL=""                     \
        -DCMAKE_BUILD_NUMBER=""                  \
        -DTELEMETRY_TRACK_ID=""                  \
        -DBUILD_LAME=""             \
        -DBUILD_PULSEAUDIO="${BUILD_PULSEAUDIO}" \
        -DBUILD_JACK="${BUILD_JACK}"             \
        -DBUILD_PORTAUDIO="${BUILD_PORTAUDIO}"   \
        -DBUILD_WEBENGINE="${BUILD_WEBENGINE}"   \
        -DUSE_SYSTEM_FREETYPE="${USE_SYSTEM_FREETYPE}" \
        -DDOWNLOAD_SOUNDFONT="${DOWNLOAD_SOUNDFONT}" \
        -DCMAKE_SKIP_RPATH="${NO_RPATH}" \ 
        /home/musescore/source-dir ; \
        make lrelease ; \ 
        make -j 1 ; \ 
        make install  