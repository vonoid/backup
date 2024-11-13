ind -name "*.xlsx" | while read f; do 
  fn="$(basename "$f")"; 
  cp "${f}" "/home/vskibenko/tmp/${fn,,}";
done
cp "A.txt" "dst/a.txt";
cp "b.txt" "dst/b.txt";
cp "c D.txt" "dst/c d.txt"

*********************
find -name «*.xlsx» | tr [:upper:] [:lower:] | cp /home/vskibenko/tmp/.
#cp --parent /var/www/html/upload/x7v/b7f/b7f8abcf54d20d7a482e56405b3b51ec.jpg  /home/user/newsite/data/news/oldimg/
cp /var/www/html/upload/x7v/b7f/b7f8abcf54d20d7a482e56405b3b51ec.jpg  /home/user/newsite/data/news/oldimg/x7v/b7f/b7f8abcf54d20d7a482e56405b3b51ec.jpg
ind -name "*.xlsx" | while read f; do 
  fn="$(basename "$f")"; 
  cp "${f}" "/home/vskibenko/tmp/${fn,,}";
done