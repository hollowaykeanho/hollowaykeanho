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




Hestia_Import() {
        #____lib_list="$1"


        # validate input
        if [ "$LIBS_HESTIA" = "" ]; then
                1>&2 printf -- "%s" "\
E: \$LIBS_HESTIA Is Unset.
E: Unable to Proceed.
E: Bailing Out...

"
                return 1
        fi


        # execute
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                ## identify source location
                if [ "$____line" = "" ]; then
                        continue
                elif [ -e "${LIBS_HESTIA}/${____line%%/*}/internals/${____line}" ]; then
                        ## always use internal first
                        ____line="${LIBS_HESTIA}/${____line%%/*}/internals/${____line}"
                elif [ -e "${LIBS_HESTIA}/${____line}" ]; then
                        ## fallback to global
                        ____line="${LIBS_HESTIA}/${____line}"
                else
                        1>&2 printf -- "%s" "\
E: Missing Library '${____line}'.
E: Unable to Proceed.
E: Bailing Out...

"
                        IFS="$____old_IFS"
                        unset ____line ____old_IFS
                        return 1
                fi

                ## begin import
                if [ -f "$____line" ]; then
                        # import single file
                        . "$____line"
                        if [ $? -ne 0 ]; then
                                1>&2 printf -- "%s" "\
E: Bad Import '${____line}'.
E: Unable to Proceed.
E: Bailing Out...

"
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                return 1
                        fi
                elif [ -d "$____line" ]; then
                        # import entire library
                        for ____library in "${____line}/"*; do
                                if [ ! -f "$____library" ]; then
                                        continue
                                fi

                                . "$____line"
                                if [ $? -ne 0 ]; then
                                        1>&2 printf -- "%s" "\
E: Bad Import '${____library}'.
E: Unable to Proceed.
E: Bailing Out...

"
                                        IFS="$____old_IFS"
                                        unset ____line ____library ____old_IFS
                                        return 1
                                fi
                        done
                        unset ____library
                fi
        done<<EOF
${1}
EOF
        IFS="$____old_IFS"
        unset ____line ____old_IFS


        # report status
        return 0
}




# report import status
return 0
