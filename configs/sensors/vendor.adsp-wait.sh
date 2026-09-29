#!/vendor/bin/sh
for i in $(seq 1 300); do
  for n in /sys/class/remoteproc/remoteproc*; do
    if grep -q adsp $n/name 2>/dev/null && grep -q running $n/state 2>/dev/null; then
      sleep 3
      exit 0
    fi
  done
  sleep 0.2
done
exit 0
