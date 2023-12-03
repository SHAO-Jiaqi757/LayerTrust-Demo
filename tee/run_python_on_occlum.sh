#!/bin/bash
set -e

BLUE='\033[1;34m'
NC='\033[0m'

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null 2>&1 && pwd )"
python_dir="$script_dir/occlum_instance/image/opt/python-occlum"

cd occlum_instance && rm -rf image
copy_bom -f ../python.yaml --root image --include-dir /opt/occlum/etc/template

if [ ! -d $python_dir ];then
    echo "Error: cannot stat '$python_dir' directory"
    exit 1
fi

# new_json="$(jq '.resource_limits.user_space_size = "1MB" |
#                 .resource_limits.user_space_max_size = "6000MB" |
#                 .resource_limits.kernel_space_heap_size = "1MB" |
#                 .resource_limits.kernel_space_heap_max_size = "256MB" |
#                 .resource_limits.max_num_of_threads = 64 |
#                 .env.default += ["PYTHONHOME=/opt/python-occlum"]' Occlum.json)" && \
# echo "${new_json}" > Occlum.json
cat Occlum.json
occlum build --sgx-mode SIM

echo "setting network conf in $script_dir/occlum_instance"
cp /etc/resolv.conf $script_dir/occlum_instance/image/etc/resolv.conf
cp /etc/nsswitch.conf $script_dir/occlum_instance/image/etc/nsswitch.conf
# echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > $script_dir/occlum_instance/image/etc/resolv.conf
# echo -e "hosts:	files dns" > $script_dir/occlum_instance/image/etc/nsswitch.conf
cp /lib/x86_64-linux-gnu/{libnss_dns.so.2,libnss_files.so.2,libresolv.so.2} $script_dir/occlum_instance/image/opt/occlum/glibc/lib

# Run the python demo
echo -e "${BLUE}occlum run /bin/python3 demo.py${NC}"
OCCLUM_LOG_LEVEL=info occlum run /bin/python3 demo.py
