#!/vendor/bin/sh
# Waits (up to 60 s) for the ADSP remoteproc to run, then lets it settle for
# $1 seconds (default 3). Always exits 0 so the services gated on it start.
settle=${1:-3}
for i in $(seq 1 300); do
  for n in /sys/class/remoteproc/remoteproc*; do
    if grep -q adsp $n/name 2>/dev/null && grep -q running $n/state 2>/dev/null; then
      sleep $settle
      exit 0
    fi
  done
  sleep 0.2
done
exit 0
