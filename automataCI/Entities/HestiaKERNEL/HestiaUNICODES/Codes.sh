#!/bin/sh
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.




# Data type
# IMPORTANT NOTICE: POSIX Shell does not have class or type declarations so we
#                   will have to be smart about it.




# Error type
HestiaUNICODES_ERROR=4294967295 # 0xFFFFFFFF




# BOM type
HestiaUNICODES_UTF_NO_BOM=0       # default
HestiaUNICODES_UTF_BOM=1




# UTF encoding type
HestiaUNICODES_UTF8=0             # default
HestiaUNICODES_UTF8_BOM=1
HestiaUNICODES_UTF16BE=2          # default
HestiaUNICODES_UTF16BE_BOM=3
HestiaUNICODES_UTF16LE=4
HestiaUNICODES_UTF16LE_BOM=5
HestiaUNICODES_UTF32BE=6          # default
HestiaUNICODES_UTF32BE_BOM=7
HestiaUNICODES_UTF32LE=8
HestiaUNICODES_UTF32LE_BOM=9
HestiaUNICODES_UTF_UNKNOWN=255




# report import status
return 0
