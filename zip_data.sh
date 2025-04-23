#!/bin/bash

OUTPUT=prod_data.zip

rm $OUTPUT
zip -r $OUTPUT LICENSE vert_right vert_left horz_right horz_left -x '**/.*' -x '**/__MACOSX' 
