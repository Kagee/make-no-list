START=$1
END=$2
URL="http://web.archive.org/cdx/search/cdx?url=*.no&fl=original&output=json&page="
for I in $(seq $START $END);
do 
  P="data/${I}.json"
  if [ ! -f "${P}" ]; then
    wget -q -O "${P}" "${URL}${I}";
    ERROR=$(jsonlint "${P}"; echo $?;)
    if [ $ERROR -gt 0 ]; then
      echo "error"
    else
      echo "not error"
    fi
  else
    echo "${P} found, skipping"
  fi
done;
