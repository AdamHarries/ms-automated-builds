#!/bin/bash

set -e 
set -x

install="${1:-musescore_install}"
cp resources/transposer_0.qml ${install}/share/mscore-3.4/plugins/ 

${install}/bin/mscore resources/Concert.mscx -d -p transposer_0.qml -o Bb.mscx

${install}/bin/mscore --diff Bb.mscx resources/Bb.mscx

rm Bb.mscx