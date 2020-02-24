max-memory(){
  ps aux | awk '{print $2, $4, $11}' | sort -k2r | head -n 10
}

disk-usage(){
  du -x . | sort -rn | more
}


