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




# import required libraries
. "${LIBS_HESTIA}/HestiaKERNEL/Init.sh" 2> /dev/null
command -v Hestia_Import > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf -- "%s" "\
E: Missing 'HestiaKERNEL/Init.sh' - Hestia_Import function.
E: Unable to Proceed.
E: Bailing Out...

"
        exit 1
fi

Hestia_Import "\
HestiaKERNEL/HestiaBOOLEANS/Is-True.sh
HestiaKERNEL/HestiaNUMBERS/Is-Positive.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaUNICODES/Is-Punctuation.sh
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
HestiaKERNEL/HestiaUNICODES/Is-Whitespace.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Wrap_Right() {
        #____content_unicode="$1"
        #____max_width="$2"
        #____break_word="$3" # NOTE: placeholding for future. Always 'true'.


        # validate input
        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ $(HestiaNUMBERS_Is_Positive "$2") -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_INVALID
        fi

        if [ "$2" -eq 0 ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        ____content_unicode="$1"
        ____holding_unicode=""
        ____output_unicode=""
        ____after=""
        ____cut=""
        ____before=""
        ____count_holding=0
        ____count_after=0
        ____count_before=0
        ____already_newline=true
        while [ ! "$____content_unicode" = "" ]; do
                # get current character
                ____char="${____content_unicode##*, }"
                ____content_unicode="${____content_unicode%"$____char"}"
                ____content_unicode="${____content_unicode%" "}"
                ____content_unicode="${____content_unicode%","}"


                # handle max width
                ____count="$(( $____count_after + $____count_before + $____count_holding ))"
                if [ ! "$____cut" = "" ]; then
                        ____count=$(( $____count + 1 ))
                fi

                if [ "$____count" -ge "$2" ]; then
                        if [  "$(HestiaUNICODES_Is_Whitespace "$____char")" -eq $HestiaSIGNALS_OK ]; then
                                # all goes into output and ignore whitespace
                                if [ ! "$____before" = "" ]; then
                                        ____before="${____before%, }"
                                        ____holding_unicode="${____before}, ${____holding_unicode}"
                                fi

                                if [ ! "$____cut" = "" ]; then
                                        ____cut="${____cut%, }"
                                        ____holding_unicode="${____cut}, ${____holding_unicode}"
                                fi

                                # handle break words for rediculous split
                                # (e.g. 1 char width)
                                if [ "$(( $____count + 1 ))" -gt "$2" ]; then
                                        ____after="${____after}10, ${____char}, "
                                fi

                                if [ ! "$____after" = "" ]; then
                                        ____after="${____after%, }"
                                        ____holding_unicode="${____after}, ${____holding_unicode}"
                                fi

                                ____holding_unicode="${____holding_unicode%", "}"
                                ____output_unicode="${____output_unicode}${____holding_unicode}, 10, "

                                ____count_holding=0
                                ____count_before=0
                                ____count_after=0
                                ____already_newline=true
                                unset ____holding_unicode \
                                        ____before \
                                        ____cut \
                                        ____after \
                                        ____count
                                continue
                        elif [ "$(HestiaUNICODES_Is_Punctuation "$____char")" -eq $HestiaSIGNALS_OK ]; then
                                # all goes into output including next char
                                if [ ! "$____before" = "" ]; then
                                        ____before="${____before%, }"
                                        ____holding_unicode="${____before}, ${____holding_unicode}"
                                fi

                                if [ ! "$____cut" = "" ] &&
                                [  "$(HestiaUNICODES_Is_Whitespace "$____cut")" -ne $HestiaSIGNALS_OK ]; then
                                        ____cut="${____cut%, }"
                                        ____holding_unicode="${____cut}, ${____holding_unicode}"
                                fi

                                # handle break words for rediculous split
                                # (e.g. 1 char width)
                                if [ "$(( $____count + 1 ))" -gt "$2" ]; then
                                        ____after="${____after}10, "
                                fi
                                ____after="${____after}${____char}, "

                                if [ ! "$____after" = "" ]; then
                                        ____after="${____after%, }"
                                        ____holding_unicode="${____after}, ${____holding_unicode}"
                                fi

                                ____holding_unicode="${____holding_unicode%", "}"
                                ____output_unicode="${____output_unicode}${____holding_unicode}, 10, "

                                ____count_holding=0
                                ____count_before=0
                                ____count_after=0
                                ____already_newline=true
                                unset ____holding_unicode \
                                        ____before \
                                        ____cut \
                                        ____after \
                                        ____count
                                continue
                        elif [  "$(HestiaUNICODES_Is_Whitespace "$____cut")" -eq $HestiaSIGNALS_OK ]; then
                                # arrived max width but still processing - cut
                                # from the last position
                                if [ ! "$____before" = "" ]; then
                                        ____before="${____before%, }"
                                        ____holding_unicode="${____before}, ${____holding_unicode}"
                                fi

                                ____holding_unicode="${____holding_unicode%", "}"
                                ____output_unicode="${____output_unicode}${____holding_unicode}, 10, "

                                ____count_holding=0
                                ____count_before=0
                                ____already_newline=true
                                unset ____holding_unicode \
                                        ____before \
                                        ____cut \
                                        ____count
                        elif [ "$(HestiaUNICODES_Is_Punctuation "$____cut")" -eq $HestiaSIGNALS_OK ]; then
                                # arrived max width but still processing - cut
                                # from the last position but include ____cut
                                # punctuation.
                                if [ ! "$____before" = "" ]; then
                                        ____before="${____before%, }"
                                        ____holding_unicode="${____before}, ${____holding_unicode}"
                                fi

                                if [ ! "$____cut" = "" ]; then
                                        ____cut="${____cut%, }"
                                        ____holding_unicode="${____cut}, ${____holding_unicode}"
                                fi

                                ____holding_unicode="${____holding_unicode%", "}"
                                ____output_unicode="${____output_unicode}${____holding_unicode}, 10, "

                                ____count_holding=0
                                ____count_before=0
                                ____already_newline=true
                                unset ____holding_unicode \
                                        ____before \
                                        ____cut \
                                        ____count
                        else
                                if [ ! "$____before" = "" ]; then
                                        ____before="${____before%, }"
                                        ____holding_unicode="${____before}, ${____holding_unicode}"
                                fi

                                if [ ! "$____cut" = "" ]; then
                                        ____cut="${____cut%, }"
                                        ____holding_unicode="${____cut}, ${____holding_unicode}"
                                fi

                                if [ ! "$____after" = "" ]; then
                                        ____after="${____after%, }"
                                        ____holding_unicode="${____after}, ${____holding_unicode}"
                                fi

                                ____holding_unicode="${____holding_unicode%", "}"
                                ____output_unicode="${____output_unicode}${____holding_unicode}, 10, "

                                ____count_holding=0
                                ____count_before=0
                                ____count_after=0
                                ____already_newline=true
                                unset ____holding_unicode \
                                        ____before \
                                        ____cut \
                                        ____after \
                                        ____count
                        fi
                fi


                # behave by character
                if [ "$(HestiaUNICODES_Is_Punctuation "$____char")" -eq $HestiaSIGNALS_OK ] ||
                [  "$(HestiaUNICODES_Is_Whitespace "$____char")" -eq $HestiaSIGNALS_OK ]; then
                        if [ ! "$____before" = "" ]; then
                                # push buffer_after into output register
                                ____before="${____before%, }"
                                ____holding_unicode="${____before}, ${____holding_unicode}"
                                ____count_holding="$____count_before"

                                unset ____before
                                ____count_before=0
                        fi

                        if [ ! "$____cut" = "" ]; then
                                # push buffer_cut into output register
                                ____cut="${____cut%, }"
                                ____holding_unicode="${____cut}, ${____holding_unicode}"
                                ____count_holding="$(( $____count_holding + 1 ))"
                        fi

                        # update to the new buffer cut
                        if [ "$(HestiaUNICODES_Is_Punctuation "$____char")" -eq $HestiaSIGNALS_OK ] ||
                        [ ! "$____already_newline" = true ]; then
                                ____cut="$____char"
                                ____already_newline=false
                        fi

                        # shift after buffer to before buffer
                        if [ ! "$____after" = "" ]; then
                                ____before="$____after"
                                ____count_before="$____count_after"
                                ____count_after=0
                                unset ____after
                        fi
                else
                        # always save to after buffer
                        ____after="${____char}, ${____after}"
                        ____count_after=$(( $____count_after + 1 ))
                        ____already_newline=false
                fi
        done


        # clean up buffers
        if [ ! "$____before" = "" ]; then
                ____before="${____before%, }"
                ____holding_unicode="${____before}, ${____holding_unicode}"
        fi

        if [ ! "$____cut" = "" ]; then
                ____cut="${____cut%, }"
                ____holding_unicode="${____cut}, ${____holding_unicode}"
        fi

        if [ ! "$____after" = "" ]; then
                ____after="${____after%, }"
                ____holding_unicode="${____after}, ${____holding_unicode}"
        fi

        ____holding_unicode="${____holding_unicode%", "}"
        ____output_unicode="${____output_unicode}${____holding_unicode}"
        ____output_unicode="${____output_unicode%", "}"


        # free up memories
        unset ____count \
                ____count_holding \
                ____count_after \
                ____count_before \
                ____already_newline \
                ____before \
                ____cut \
                ____after \
                ____char \
                ____holding_unicode \
                ____content_unicode


        # all good - print output
        printf -- "%b" "${____output_unicode%", "}"
        unset ____output_unicode


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
