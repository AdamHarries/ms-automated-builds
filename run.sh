#!/bin/bash
set -e 
set +x

# Check to see if we have a musescore git repository
musescore_source_dir="${1:-MuseScore}"
musescore_build_dir="${2:-$(pwd)/musescore_build}"
musescore_install_dir="${3:-$(pwd)/musescore_install}"

if [ -d $musescore_source_dir ]; then 
    pushd $musescore_source_dir
    git status
    if [ $? ]; then 
        echo "Found musescore git directory successfully: ${musescore_source_dir}"
    else 
        echo "Please specify a *git* directory with the MuseScore source"
    fi 
    popd 
else 
    echo "Please specify a directory containing the MuseScore source that exists"
fi

echo "Source dir: ${musescore_source_dir}"
echo "Build dir: ${musescore_build_dir}"
echo "Install dir: ${musescore_install_dir}"


mkdir -p ${musescore_build_dir} 
mkdir -p ${musescore_install_dir}

# Build a dockerfile for managing the various dependencies that musescore requires
docker build -t ms-buildtool . 

# Run the dockerfile with specific linked folders. 
docker run -it -v ${musescore_source_dir}:/home/musescore/source-dir -v ${musescore_build_dir}:/home/musescore/build-dir -v ${musescore_install_dir}:/home/musescore/install-dir ms-buildtool

sudo chown adam -R musescore_install 