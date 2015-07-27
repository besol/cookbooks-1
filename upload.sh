cat download.list | awk '{ printf "cd %s/cookbooks/; echo %s; knife cookbook upload -a -o . ; cd ../../\n",$5,$5}'
