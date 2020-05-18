#!/bin/bash
# Copyright (C) 2015 Adrien Vergé

rc=0

./tests/lint/eol-at-eof.sh $(git ls-files | grep -v '\.enc$') || rc=1

./tests/lint/line_length.py $(git ls-files '*.[ch]' | grep -v 'src/openssl_hostname_validation.[ch]') || rc=1

./tests/lint/astyle.sh $(git ls-files '*.[ch]' | grep -v 'src/openssl_hostname_validation.[ch]') || rc=1

./tests/lint/checkpatch.sh $(git ls-files '*.[ch]' | grep -v 'src/openssl_hostname_validation.[ch]') || rc=1

exit $rc
