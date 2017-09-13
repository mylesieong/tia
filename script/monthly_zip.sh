#!/bin/bash
pushd $W
tar --exclude='.git' --exclude='playground' --exclude='Visual*' -czf 201xxxxx_backup_full_work_dir.tar.gz .
popd 
