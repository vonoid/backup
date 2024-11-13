ind -name "*.xlsx" | while read f; do 
  fn="$(basename "$f")"; 
  cp "${f}" "/home/vskibenko/tmp/${fn,,}";
done