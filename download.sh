cat download.list | awk '{ printf "mkdir %s; cp Cheffile %s; cd %s; echo \'cookbook \"%s\"\' >> Cheffile; librarian-chef install --verbose; cd .. \n",$5,$5,$5,$5 }' | sh
