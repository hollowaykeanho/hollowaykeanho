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


# WARNING: This file is AUTO-GENERATED! DO NOT EDIT!
# WARNING: Consult Copyright owners or documentations.




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
HestiaKERNEL/HestiaUNICODES/rune-to-lowercase.sh
HestiaKERNEL/HestiaUNICODES/rune-to-uppercase.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




# Returns:
#       (1)   String
hestiaUNICODES_Rune_To_Titlecase() {
        ____codepoint1="$1"
        ____codepoint2="$2"
        ____codepoint3="$3"
        ____lang="$4"
        ____to_titlecase="$5"


        # validate input
        if [ "$____codepoint1" = "" ]; then
                # ERROR - bad input
                printf -- "%s" ""
                return 1
        fi


        # language sensitive special cases
        case "$____lang" in
        az|tr)
                # Azerbaijani & Turkish
                case "$____codepoint1" in
                0x0049)
                        case "$____codepoint2" in
                        0x0307)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
2
73
775
"
                                        return 0
                                else
                                        printf -- "%s" "\
2
105
"
                                        return 0
                                fi
                                ;;
                        *)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
1
73
"
                                        return 0
                                else
                                        printf -- "%s" "\
1
305
"
                                        return 0
                                fi
                                ;;
                        esac
                        ;;
                0x0069|0x0130)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
1
304
"
                                return 0
                        else
                                printf -- "%s" "\
1
105
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        lt)
                # Lithuanian
                case "$____codepoint1" in
                0x0049)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
1
73
"
                                return 0
                        else
                                printf -- "%s" "\
1
105
775
"
                                return 0
                        fi
                        ;;
                0x004A)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
1
74
"
                                return 0
                        else
                                printf -- "%s" "\
1
106
775
"
                                return 0
                        fi

                        return 0
                        ;;
                0x0069)
                        case "$____codepoint2" in
                        0x0307)
                                case "$____codepoint3" in
                                0x0300)
                                        if [ ! "$____to_titlecase" = "" ]; then
                                                printf -- "%s" "\
3
204
"
                                                return 0
                                        else
                                                printf -- "%s" "\
3
105
775
768
"
                                                return 0
                                        fi
                                        ;;
                                0x0301)
                                        if [ ! "$____to_titlecase" = "" ]; then
                                                printf -- "%s" "\
3
205
"
                                                return 0
                                        else
                                                printf -- "%s" "\
3
105
775
769
"
                                                return 0
                                        fi
                                        ;;
                                0x0303)
                                        if [ ! "$____to_titlecase" = "" ]; then
                                                printf -- "%s" "\
3
296
"
                                                return 0
                                        else
                                                printf -- "%s" "\
3
105
775
771
"
                                                return 0
                                        fi
                                        ;;
                                *)
                                        if [ ! "$____to_titlecase" = "" ]; then
                                                printf -- "%s" "\
2
73
"
                                                return 0
                                        else
                                                printf -- "%s" "\
2
105
775
"
                                                return 0
                                        fi
                                        ;;
                                esac
                                ;;
                        esac
                        ;;
                0x006A)
                        case "$____codepoint2" in
                        0x0307)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
2
74
"
                                        return 0
                                else
                                        printf -- "%s" "\
2
106
775
"
                                        return 0
                                fi
                                ;;
                        esac
                        ;;
                0x00CC)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
1
204
"
                                return 0
                        else
                                printf -- "%s" "\
1
105
775
768
"
                                return 0
                        fi
                        ;;
                0x00CD)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
1
205
"
                                return 0
                        else
                                printf -- "%s" "\
1
105
775
769
"
                                return 0
                        fi
                        ;;
                0x0128)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
1
296
"
                                return 0
                        else
                                printf -- "%s" "\
1
105
775
771
"
                                return 0
                        fi
                        ;;
                0x012E)
                        if [ ! "$____to_titlecase" = "" ]; then
                                ___output_char="\
1
302
"
                                return 0
                        else
                                ___output_char="\
1
303
775
"
                                return 0
                        fi
                        ;;
                0x012F)
                        case "$____codepoint2" in
                        0x0307)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
2
302
"
                                        return 0
                                else
                                        printf -- "%s" "\
2
303
775
"
                                        return 0
                                fi
                                ;;
                        esac
                        ;;
                0x0307)
                        printf -- "%s" "1"
                        return 0
                        ;;
                esac
                ;;
        esac


        # language insensitive special cases
        case "$____codepoint1" in
        0x0041)
                case "$____codepoint2" in
                0x02BE)
                        ;;
                esac
                ;;
        0x0046)
                case "$____codepoint2" in
                0x0046)
                        case "$____codepoint3" in
                        0x0049)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
3
70102105
"
                                        return 0
                                else
                                        printf -- "%s" "\
3
64259
"
                                        return 0
                                fi
                                ;;
                        0x004C)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
3
70102108
"
                                        return 0
                                else
                                        printf -- "%s" "\
3
64260
"
                                        return 0
                                fi
                                ;;
                        *)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
2
70102
"
                                        return 0
                                else
                                        printf -- "%s" "\
2
64256
"
                                        return 0
                                fi
                                ;;
                        esac
                        ;;
                0x0049)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
70105
"
                                return 0
                        else
                                printf -- "%s" "\
2
64257
"
                                return 0
                        fi
                        ;;
                0x004C)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
70108
"
                                return 0
                        else
                                printf -- "%s" "\
2
64258
"
                                return 0
                        fi
                        ;;
                0x0066)
                        case "$____codepoint3" in
                        0x0069)
                                ;;
                        0x006C)
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0069)
                        ;;
                0x006C)
                        ;;
                esac
                ;;
        0x0048)
                case "$____codepoint2" in
                0x0331)
                        ;;
                esac
                ;;
        0x004A)
                case "$____codepoint2" in
                0x030C)
                        ;;
                esac
                ;;
        0x0053)
                case "$____codepoint2" in
                0x0053)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
83115
"
                                return 0
                        else
                                printf -- "%s" "\
2
223
"
                                return 0
                        fi
                        ;;
                0x0054)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
83116
"
                                return 0
                        else
                                printf -- "%s" "\
2
64262
"
                                return 0
                        fi
                        ;;
                0x0073)
                        ;;
                0x0074)
                        ;;
                esac
                ;;
        0x0054)
                case "$____codepoint2" in
                0x0308)
                        ;;
                esac
                ;;
        0x0057)
                case "$____codepoint2" in
                0x030A)
                        ;;
                esac
                ;;
        0x0059)
                case "$____codepoint2" in
                0x030A)
                        ;;
                esac
                ;;
        0x0069)
                case "$____codepoint2" in
                0x0307)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
304
"
                                return 0
                        else
                                printf -- "%s" "\
2
105775
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x00DF)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
83115
"
                        return 0
                else
                        printf -- "%s" "\
1
223
"
                        return 0
                fi
                ;;
        0x0130)
                ;;
        0x0149)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
70078
"
                        return 0
                else
                        printf -- "%s" "\
1
329
"
                        return 0
                fi
                ;;
        0x01F0)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
74780
"
                        return 0
                else
                        printf -- "%s" "\
1
496
"
                        return 0
                fi
                ;;
        0x02BC)
                case "$____codepoint2" in
                0x004E)
                        ;;
                esac
                ;;
        0x0386)
                case "$____codepoint2" in
                0x0345)
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
902837
"
                                return 0
                        else
                                printf -- "%s" "\
2
8116
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x0389)
                case "$____codepoint2" in
                0x0345)
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
905837
"
                                return 0
                        else
                                printf -- "%s" "\
2
8132
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x038F)
                case "$____codepoint2" in
                0x0345)
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
911837
"
                                return 0
                        else
                                printf -- "%s" "\
2
8180
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x0390)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
921776769
"
                        return 0
                else
                        printf -- "%s" "\
1
912
"
                        return 0
                fi
                ;;
        0x0391)
                case "$____codepoint2" in
                0x0342)
                        case "$____codepoint3" in
                        0x0345)
                                ;;
                        0x0399)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
3
913834837
"
                                        return 0
                                else
                                        printf -- "%s" "\
3
8119
"
                                        return 0
                                fi
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8124
"
                                return 0
                        else
                                printf -- "%s" "\
2
8115
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x0397)
                case "$____codepoint2" in
                0x0342)
                        case "$____codepoint3" in
                        0x0345)
                                ;;
                        0x0399)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
3
919834837
"
                                        return 0
                                else
                                        printf -- "%s" "\
3
8135
"
                                        return 0
                                fi
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8140
"
                                return 0
                        else
                                printf -- "%s" "\
2
8131
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x0399)
                case "$____codepoint2" in
                0x0308)
                        case "$____codepoint3" in
                        0x0300)
                                ;;
                        0x0301)
                                ;;
                        0x0342)
                                ;;
                        esac
                        ;;
                0x0342)
                        ;;
                esac
                ;;
        0x03A1)
                case "$____codepoint2" in
                0x0313)
                        ;;
                esac
                ;;
        0x03A3)
                ;;
        0x03A5)
                case "$____codepoint2" in
                0x0308)
                        case "$____codepoint3" in
                        0x0300)
                                ;;
                        0x0301)
                                ;;
                        0x0342)
                                ;;
                        esac
                        ;;
                0x0313)
                        case "$____codepoint3" in
                        0x0300)
                                ;;
                        0x0301)
                                ;;
                        0x0342)
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0342)
                        ;;
                esac
                ;;
        0x03A9)
                case "$____codepoint2" in
                0x0342)
                        case "$____codepoint3" in
                        0x0345)
                                ;;
                        0x0399)
                                if [ ! "$____to_titlecase" = "" ]; then
                                        printf -- "%s" "\
3
937834837
"
                                        return 0
                                else
                                        printf -- "%s" "\
3
8183
"
                                        return 0
                                fi
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8188
"
                                return 0
                        else
                                printf -- "%s" "\
2
8179
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x03B0)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
933776769
"
                        return 0
                else
                        printf -- "%s" "\
1
944
"
                        return 0
                fi
                ;;
        0x03C2)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
931
"
                        return 0
                else
                        printf -- "%s" "\
1
962
"
                        return 0
                fi
                ;;
        0x0535)
                case "$____codepoint2" in
                0x0552)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
13331410
"
                                return 0
                        else
                                printf -- "%s" "\
2
1415
"
                                return 0
                        fi
                        ;;
                0x0582)
                        ;;
                esac
                ;;
        0x0544)
                case "$____codepoint2" in
                0x0535)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
13481381
"
                                return 0
                        else
                                printf -- "%s" "\
2
64276
"
                                return 0
                        fi
                        ;;
                0x053B)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
13481387
"
                                return 0
                        else
                                printf -- "%s" "\
2
64277
"
                                return 0
                        fi
                        ;;
                0x053D)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
13481389
"
                                return 0
                        else
                                printf -- "%s" "\
2
64279
"
                                return 0
                        fi
                        ;;
                0x0546)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
13481398
"
                                return 0
                        else
                                printf -- "%s" "\
2
64275
"
                                return 0
                        fi
                        ;;
                0x0565)
                        ;;
                0x056B)
                        ;;
                0x056D)
                        ;;
                0x0576)
                        ;;
                esac
                ;;
        0x054E)
                case "$____codepoint2" in
                0x0546)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
13581398
"
                                return 0
                        else
                                printf -- "%s" "\
2
64278
"
                                return 0
                        fi
                        ;;
                0x0576)
                        ;;
                esac
                ;;
        0x0587)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
13331410
"
                        return 0
                else
                        printf -- "%s" "\
1
1415
"
                        return 0
                fi
                ;;
        0x1E96)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
72817
"
                        return 0
                else
                        printf -- "%s" "\
1
7830
"
                        return 0
                fi
                ;;
        0x1E97)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
84776
"
                        return 0
                else
                        printf -- "%s" "\
1
7831
"
                        return 0
                fi
                ;;
        0x1E98)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
87778
"
                        return 0
                else
                        printf -- "%s" "\
1
7832
"
                        return 0
                fi
                ;;
        0x1E99)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
89778
"
                        return 0
                else
                        printf -- "%s" "\
1
7833
"
                        return 0
                fi
                ;;
        0x1E9A)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
65702
"
                        return 0
                else
                        printf -- "%s" "\
1
7834
"
                        return 0
                fi
                ;;
        0x1F08)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8072
"
                                return 0
                        else
                                printf -- "%s" "\
2
8064
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F09)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8073
"
                                return 0
                        else
                                printf -- "%s" "\
2
8065
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F0A)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8074
"
                                return 0
                        else
                                printf -- "%s" "\
2
8066
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F0B)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8075
"
                                return 0
                        else
                                printf -- "%s" "\
2
8067
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F0C)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8076
"
                                return 0
                        else
                                printf -- "%s" "\
2
8068
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F0D)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8077
"
                                return 0
                        else
                                printf -- "%s" "\
2
8069
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F0E)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8078
"
                                return 0
                        else
                                printf -- "%s" "\
2
8070
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F0F)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8079
"
                                return 0
                        else
                                printf -- "%s" "\
2
8071
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F28)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8088
"
                                return 0
                        else
                                printf -- "%s" "\
2
8080
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F29)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8089
"
                                return 0
                        else
                                printf -- "%s" "\
2
8081
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F2A)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8090
"
                                return 0
                        else
                                printf -- "%s" "\
2
8082
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F2B)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8091
"
                                return 0
                        else
                                printf -- "%s" "\
2
8083
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F2C)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8092
"
                                return 0
                        else
                                printf -- "%s" "\
2
8084
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F2D)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8093
"
                                return 0
                        else
                                printf -- "%s" "\
2
8085
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F2E)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8094
"
                                return 0
                        else
                                printf -- "%s" "\
2
8086
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F2F)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8095
"
                                return 0
                        else
                                printf -- "%s" "\
2
8087
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F50)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
933787
"
                        return 0
                else
                        printf -- "%s" "\
1
8016
"
                        return 0
                fi
                ;;
        0x1F52)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
933787768
"
                        return 0
                else
                        printf -- "%s" "\
1
8018
"
                        return 0
                fi
                ;;
        0x1F54)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
933787769
"
                        return 0
                else
                        printf -- "%s" "\
1
8020
"
                        return 0
                fi
                ;;
        0x1F56)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
933787834
"
                        return 0
                else
                        printf -- "%s" "\
1
8022
"
                        return 0
                fi
                ;;
        0x1F68)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8104
"
                                return 0
                        else
                                printf -- "%s" "\
2
8096
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F69)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8105
"
                                return 0
                        else
                                printf -- "%s" "\
2
8097
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F6A)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8106
"
                                return 0
                        else
                                printf -- "%s" "\
2
8098
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F6B)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8107
"
                                return 0
                        else
                                printf -- "%s" "\
2
8099
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F6C)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8108
"
                                return 0
                        else
                                printf -- "%s" "\
2
8100
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F6D)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8109
"
                                return 0
                        else
                                printf -- "%s" "\
2
8101
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F6E)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8110
"
                                return 0
                        else
                                printf -- "%s" "\
2
8102
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F6F)
                case "$____codepoint2" in
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8111
"
                                return 0
                        else
                                printf -- "%s" "\
2
8103
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1F80)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8072
"
                        return 0
                else
                        printf -- "%s" "\
1
8064
"
                        return 0
                fi
                ;;
        0x1F81)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8073
"
                        return 0
                else
                        printf -- "%s" "\
1
8065
"
                        return 0
                fi
                ;;
        0x1F82)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8074
"
                        return 0
                else
                        printf -- "%s" "\
1
8066
"
                        return 0
                fi
                ;;
        0x1F83)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8075
"
                        return 0
                else
                        printf -- "%s" "\
1
8067
"
                        return 0
                fi
                ;;
        0x1F84)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8076
"
                        return 0
                else
                        printf -- "%s" "\
1
8068
"
                        return 0
                fi
                ;;
        0x1F85)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8077
"
                        return 0
                else
                        printf -- "%s" "\
1
8069
"
                        return 0
                fi
                ;;
        0x1F86)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8078
"
                        return 0
                else
                        printf -- "%s" "\
1
8070
"
                        return 0
                fi
                ;;
        0x1F87)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8079
"
                        return 0
                else
                        printf -- "%s" "\
1
8071
"
                        return 0
                fi
                ;;
        0x1F88)
                ;;
        0x1F89)
                ;;
        0x1F8A)
                ;;
        0x1F8B)
                ;;
        0x1F8C)
                ;;
        0x1F8D)
                ;;
        0x1F8E)
                ;;
        0x1F8F)
                ;;
        0x1F90)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8088
"
                        return 0
                else
                        printf -- "%s" "\
1
8080
"
                        return 0
                fi
                ;;
        0x1F91)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8089
"
                        return 0
                else
                        printf -- "%s" "\
1
8081
"
                        return 0
                fi
                ;;
        0x1F92)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8090
"
                        return 0
                else
                        printf -- "%s" "\
1
8082
"
                        return 0
                fi
                ;;
        0x1F93)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8091
"
                        return 0
                else
                        printf -- "%s" "\
1
8083
"
                        return 0
                fi
                ;;
        0x1F94)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8092
"
                        return 0
                else
                        printf -- "%s" "\
1
8084
"
                        return 0
                fi
                ;;
        0x1F95)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8093
"
                        return 0
                else
                        printf -- "%s" "\
1
8085
"
                        return 0
                fi
                ;;
        0x1F96)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8094
"
                        return 0
                else
                        printf -- "%s" "\
1
8086
"
                        return 0
                fi
                ;;
        0x1F97)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8095
"
                        return 0
                else
                        printf -- "%s" "\
1
8087
"
                        return 0
                fi
                ;;
        0x1F98)
                ;;
        0x1F99)
                ;;
        0x1F9A)
                ;;
        0x1F9B)
                ;;
        0x1F9C)
                ;;
        0x1F9D)
                ;;
        0x1F9E)
                ;;
        0x1F9F)
                ;;
        0x1FA0)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8104
"
                        return 0
                else
                        printf -- "%s" "\
1
8096
"
                        return 0
                fi
                ;;
        0x1FA1)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8105
"
                        return 0
                else
                        printf -- "%s" "\
1
8097
"
                        return 0
                fi
                ;;
        0x1FA2)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8106
"
                        return 0
                else
                        printf -- "%s" "\
1
8098
"
                        return 0
                fi
                ;;
        0x1FA3)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8107
"
                        return 0
                else
                        printf -- "%s" "\
1
8099
"
                        return 0
                fi
                ;;
        0x1FA4)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8108
"
                        return 0
                else
                        printf -- "%s" "\
1
8100
"
                        return 0
                fi
                ;;
        0x1FA5)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8109
"
                        return 0
                else
                        printf -- "%s" "\
1
8101
"
                        return 0
                fi
                ;;
        0x1FA6)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8110
"
                        return 0
                else
                        printf -- "%s" "\
1
8102
"
                        return 0
                fi
                ;;
        0x1FA7)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8111
"
                        return 0
                else
                        printf -- "%s" "\
1
8103
"
                        return 0
                fi
                ;;
        0x1FA8)
                ;;
        0x1FA9)
                ;;
        0x1FAA)
                ;;
        0x1FAB)
                ;;
        0x1FAC)
                ;;
        0x1FAD)
                ;;
        0x1FAE)
                ;;
        0x1FAF)
                ;;
        0x1FB2)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8122837
"
                        return 0
                else
                        printf -- "%s" "\
1
8114
"
                        return 0
                fi
                ;;
        0x1FB3)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8124
"
                        return 0
                else
                        printf -- "%s" "\
1
8115
"
                        return 0
                fi
                ;;
        0x1FB4)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
902837
"
                        return 0
                else
                        printf -- "%s" "\
1
8116
"
                        return 0
                fi
                ;;
        0x1FB6)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
913834
"
                        return 0
                else
                        printf -- "%s" "\
1
8118
"
                        return 0
                fi
                ;;
        0x1FB7)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
913834837
"
                        return 0
                else
                        printf -- "%s" "\
1
8119
"
                        return 0
                fi
                ;;
        0x1FBA)
                case "$____codepoint2" in
                0x0345)
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8122837
"
                                return 0
                        else
                                printf -- "%s" "\
2
8114
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1FBC)
                ;;
        0x1FC2)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8138837
"
                        return 0
                else
                        printf -- "%s" "\
1
8130
"
                        return 0
                fi
                ;;
        0x1FC3)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8140
"
                        return 0
                else
                        printf -- "%s" "\
1
8131
"
                        return 0
                fi
                ;;
        0x1FC4)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
905837
"
                        return 0
                else
                        printf -- "%s" "\
1
8132
"
                        return 0
                fi
                ;;
        0x1FC6)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
919834
"
                        return 0
                else
                        printf -- "%s" "\
1
8134
"
                        return 0
                fi
                ;;
        0x1FC7)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
919834837
"
                        return 0
                else
                        printf -- "%s" "\
1
8135
"
                        return 0
                fi
                ;;
        0x1FCA)
                case "$____codepoint2" in
                0x0345)
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8138837
"
                                return 0
                        else
                                printf -- "%s" "\
2
8130
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1FCC)
                ;;
        0x1FD2)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
921776768
"
                        return 0
                else
                        printf -- "%s" "\
1
8146
"
                        return 0
                fi
                ;;
        0x1FD6)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
921834
"
                        return 0
                else
                        printf -- "%s" "\
1
8150
"
                        return 0
                fi
                ;;
        0x1FD7)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
921776834
"
                        return 0
                else
                        printf -- "%s" "\
1
8151
"
                        return 0
                fi
                ;;
        0x1FE2)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
933776768
"
                        return 0
                else
                        printf -- "%s" "\
1
8162
"
                        return 0
                fi
                ;;
        0x1FE4)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
929787
"
                        return 0
                else
                        printf -- "%s" "\
1
8164
"
                        return 0
                fi
                ;;
        0x1FE6)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
933834
"
                        return 0
                else
                        printf -- "%s" "\
1
8166
"
                        return 0
                fi
                ;;
        0x1FE7)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
933776834
"
                        return 0
                else
                        printf -- "%s" "\
1
8167
"
                        return 0
                fi
                ;;
        0x1FF2)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8186837
"
                        return 0
                else
                        printf -- "%s" "\
1
8178
"
                        return 0
                fi
                ;;
        0x1FF3)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
8188
"
                        return 0
                else
                        printf -- "%s" "\
1
8179
"
                        return 0
                fi
                ;;
        0x1FF4)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
911837
"
                        return 0
                else
                        printf -- "%s" "\
1
8180
"
                        return 0
                fi
                ;;
        0x1FF6)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
937834
"
                        return 0
                else
                        printf -- "%s" "\
1
8182
"
                        return 0
                fi
                ;;
        0x1FF7)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
937834837
"
                        return 0
                else
                        printf -- "%s" "\
1
8183
"
                        return 0
                fi
                ;;
        0x1FFA)
                case "$____codepoint2" in
                0x0345)
                        ;;
                0x0399)
                        if [ ! "$____to_titlecase" = "" ]; then
                                printf -- "%s" "\
2
8186837
"
                                return 0
                        else
                                printf -- "%s" "\
2
8178
"
                                return 0
                        fi
                        ;;
                esac
                ;;
        0x1FFC)
                ;;
        0xFB00)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
70102
"
                        return 0
                else
                        printf -- "%s" "\
1
64256
"
                        return 0
                fi
                ;;
        0xFB01)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
70105
"
                        return 0
                else
                        printf -- "%s" "\
1
64257
"
                        return 0
                fi
                ;;
        0xFB02)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
70108
"
                        return 0
                else
                        printf -- "%s" "\
1
64258
"
                        return 0
                fi
                ;;
        0xFB03)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
70102105
"
                        return 0
                else
                        printf -- "%s" "\
1
64259
"
                        return 0
                fi
                ;;
        0xFB04)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
70102108
"
                        return 0
                else
                        printf -- "%s" "\
1
64260
"
                        return 0
                fi
                ;;
        0xFB06)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
83116
"
                        return 0
                else
                        printf -- "%s" "\
1
64262
"
                        return 0
                fi
                ;;
        0xFB13)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
13481398
"
                        return 0
                else
                        printf -- "%s" "\
1
64275
"
                        return 0
                fi
                ;;
        0xFB14)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
13481381
"
                        return 0
                else
                        printf -- "%s" "\
1
64276
"
                        return 0
                fi
                ;;
        0xFB15)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
13481387
"
                        return 0
                else
                        printf -- "%s" "\
1
64277
"
                        return 0
                fi
                ;;
        0xFB16)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
13581398
"
                        return 0
                else
                        printf -- "%s" "\
1
64278
"
                        return 0
                fi
                ;;
        0xFB17)
                if [ ! "$____to_titlecase" = "" ]; then
                        printf -- "%s" "\
1
13481389
"
                        return 0
                else
                        printf -- "%s" "\
1
64279
"
                        return 0
                fi
                ;;
        esac


        # switching non-special 1:1 casing now
        if [ ! "$____to_titlecase" = "" ]; then
                printf -- "%s" "$( \
                        hestiaUNICODES_Rune_To_Uppercase "$1" "$2" "$3" "$4" \
                )"
                return $?
        fi

        printf -- "%s" "$( \
                hestiaUNICODES_Rune_To_Lowercase "$1" "$2" "$3" "$4" \
        )"
        return $?
}




# report import status
return 0
