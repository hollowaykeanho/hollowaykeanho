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




# Returns:
#       (1)   String
hestiaUNICODES_Rune_To_Uppercase() {
        ____codepoint1="$1"
        ____codepoint2="$2"
        ____codepoint3="$3"
        ____lang="$4"


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
                0x0069)
                        printf -- "%s" "\
1
304
"
                        return 0
                        ;;
                0x0131)
                        printf -- "%s" "\
1
73
"
                        return 0
                        ;;
                esac
                ;;
        lt)
                # Lithuanian
                case "$____codepoint1" in
                0x0069)
                        case "$____codepoint2" in
                        0x0307)
                                case "$____codepoint3" in
                                0x0300)
                                        printf -- "%s" "\
3
204
"
                                        return 0
                                        ;;
                                0x0301)
                                        printf -- "%s" "\
3
205
"
                                        return 0
                                        ;;
                                0x0303)
                                        printf -- "%s" "\
3
296
"
                                        return 0
                                        ;;
                                *)
                                        printf -- "%s" "\
2
73
"
                                        return 0
                                        ;;
                                esac
                                ;;
                        esac
                        ;;
                0x006A)
                        case "$____codepoint2" in
                        0x0307)
                                printf -- "%s" "\
2
74
"
                                return 0
                                ;;
                        esac
                        ;;
                0x012F)
                        case "$____codepoint2" in
                        0x0307)
                                printf -- "%s" "\
2
302
"
                                return 0
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
                                ;;
                        0x004C)
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0049)
                        ;;
                0x004C)
                        ;;
                0x0066)
                        case "$____codepoint3" in
                        0x0069)
                                printf -- "%s" "\
3
70
70
73
"
                                return 0
                                ;;
                        0x006C)
                                printf -- "%s" "\
3
70
70
76
"
                                return 0
                                ;;
                        *)
                                printf -- "%s" "\
2
70
70
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0069)
                        printf -- "%s" "\
2
70
73
"
                        return 0
                        ;;
                0x006C)
                        printf -- "%s" "\
2
70
76
"
                        return 0
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
                        ;;
                0x0054)
                        ;;
                0x0073)
                        printf -- "%s" "\
2
83
83
"
                        return 0
                        ;;
                0x0074)
                        printf -- "%s" "\
2
83
84
"
                        return 0
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
                        printf -- "%s" "\
2
304
"
                        return 0
                        ;;
                esac
                ;;
        0x00DF)
                printf -- "%s" "\
1
83
83
"
                return 0
                ;;
        0x0130)
                ;;
        0x0149)
                printf -- "%s" "\
1
700
78
"
                return 0
                ;;
        0x01F0)
                printf -- "%s" "\
1
74
780
"
                return 0
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
                        printf -- "%s" "\
2
902
921
"
                        return 0
                        ;;
                0x0399)
                        ;;
                esac
                ;;
        0x0389)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
905
921
"
                        return 0
                        ;;
                0x0399)
                        ;;
                esac
                ;;
        0x038F)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
911
921
"
                        return 0
                        ;;
                0x0399)
                        ;;
                esac
                ;;
        0x0390)
                printf -- "%s" "\
1
921
776
769
"
                return 0
                ;;
        0x0391)
                case "$____codepoint2" in
                0x0342)
                        case "$____codepoint3" in
                        0x0345)
                                printf -- "%s" "\
3
913
834
921
"
                                return 0
                                ;;
                        0x0399)
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0399)
                        ;;
                esac
                ;;
        0x0397)
                case "$____codepoint2" in
                0x0342)
                        case "$____codepoint3" in
                        0x0345)
                                printf -- "%s" "\
3
919
834
921
"
                                return 0
                                ;;
                        0x0399)
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0399)
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
                                printf -- "%s" "\
3
937
834
921
"
                                return 0
                                ;;
                        0x0399)
                                ;;
                        *)
                                ;;
                        esac
                        ;;
                0x0399)
                        ;;
                esac
                ;;
        0x03B0)
                printf -- "%s" "\
1
933
776
769
"
                return 0
                ;;
        0x03C2)
                printf -- "%s" "\
1
931
"
                return 0
                ;;
        0x0535)
                case "$____codepoint2" in
                0x0552)
                        ;;
                0x0582)
                        printf -- "%s" "\
2
1333
1362
"
                        return 0
                        ;;
                esac
                ;;
        0x0544)
                case "$____codepoint2" in
                0x0535)
                        ;;
                0x053B)
                        ;;
                0x053D)
                        ;;
                0x0546)
                        ;;
                0x0565)
                        printf -- "%s" "\
2
1348
1333
"
                        return 0
                        ;;
                0x056B)
                        printf -- "%s" "\
2
1348
1339
"
                        return 0
                        ;;
                0x056D)
                        printf -- "%s" "\
2
1348
1341
"
                        return 0
                        ;;
                0x0576)
                        printf -- "%s" "\
2
1348
1350
"
                        return 0
                        ;;
                esac
                ;;
        0x054E)
                case "$____codepoint2" in
                0x0546)
                        ;;
                0x0576)
                        printf -- "%s" "\
2
1358
1350
"
                        return 0
                        ;;
                esac
                ;;
        0x0587)
                printf -- "%s" "\
1
1333
1362
"
                return 0
                ;;
        0x1E96)
                printf -- "%s" "\
1
72
817
"
                return 0
                ;;
        0x1E97)
                printf -- "%s" "\
1
84
776
"
                return 0
                ;;
        0x1E98)
                printf -- "%s" "\
1
87
778
"
                return 0
                ;;
        0x1E99)
                printf -- "%s" "\
1
89
778
"
                return 0
                ;;
        0x1E9A)
                printf -- "%s" "\
1
65
702
"
                return 0
                ;;
        0x1F08)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F09)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F0A)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F0B)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F0C)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F0D)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F0E)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F0F)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F28)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F29)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F2A)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F2B)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F2C)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F2D)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F2E)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F2F)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F50)
                printf -- "%s" "\
1
933
787
"
                return 0
                ;;
        0x1F52)
                printf -- "%s" "\
1
933
787
768
"
                return 0
                ;;
        0x1F54)
                printf -- "%s" "\
1
933
787
769
"
                return 0
                ;;
        0x1F56)
                printf -- "%s" "\
1
933
787
834
"
                return 0
                ;;
        0x1F68)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F69)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F6A)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F6B)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F6C)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F6D)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F6E)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F6F)
                case "$____codepoint2" in
                0x0399)
                        ;;
                esac
                ;;
        0x1F80)
                printf -- "%s" "\
1
7944
921
"
                return 0
                ;;
        0x1F81)
                printf -- "%s" "\
1
7945
921
"
                return 0
                ;;
        0x1F82)
                printf -- "%s" "\
1
7946
921
"
                return 0
                ;;
        0x1F83)
                printf -- "%s" "\
1
7947
921
"
                return 0
                ;;
        0x1F84)
                printf -- "%s" "\
1
7948
921
"
                return 0
                ;;
        0x1F85)
                printf -- "%s" "\
1
7949
921
"
                return 0
                ;;
        0x1F86)
                printf -- "%s" "\
1
7950
921
"
                return 0
                ;;
        0x1F87)
                printf -- "%s" "\
1
7951
921
"
                return 0
                ;;
        0x1F88)
                printf -- "%s" "\
1
7944
921
"
                return 0
                ;;
        0x1F89)
                printf -- "%s" "\
1
7945
921
"
                return 0
                ;;
        0x1F8A)
                printf -- "%s" "\
1
7946
921
"
                return 0
                ;;
        0x1F8B)
                printf -- "%s" "\
1
7947
921
"
                return 0
                ;;
        0x1F8C)
                printf -- "%s" "\
1
7948
921
"
                return 0
                ;;
        0x1F8D)
                printf -- "%s" "\
1
7949
921
"
                return 0
                ;;
        0x1F8E)
                printf -- "%s" "\
1
7950
921
"
                return 0
                ;;
        0x1F8F)
                printf -- "%s" "\
1
7951
921
"
                return 0
                ;;
        0x1F90)
                printf -- "%s" "\
1
7976
921
"
                return 0
                ;;
        0x1F91)
                printf -- "%s" "\
1
7977
921
"
                return 0
                ;;
        0x1F92)
                printf -- "%s" "\
1
7978
921
"
                return 0
                ;;
        0x1F93)
                printf -- "%s" "\
1
7979
921
"
                return 0
                ;;
        0x1F94)
                printf -- "%s" "\
1
7980
921
"
                return 0
                ;;
        0x1F95)
                printf -- "%s" "\
1
7981
921
"
                return 0
                ;;
        0x1F96)
                printf -- "%s" "\
1
7982
921
"
                return 0
                ;;
        0x1F97)
                printf -- "%s" "\
1
7983
921
"
                return 0
                ;;
        0x1F98)
                printf -- "%s" "\
1
7976
921
"
                return 0
                ;;
        0x1F99)
                printf -- "%s" "\
1
7977
921
"
                return 0
                ;;
        0x1F9A)
                printf -- "%s" "\
1
7978
921
"
                return 0
                ;;
        0x1F9B)
                printf -- "%s" "\
1
7979
921
"
                return 0
                ;;
        0x1F9C)
                printf -- "%s" "\
1
7980
921
"
                return 0
                ;;
        0x1F9D)
                printf -- "%s" "\
1
7981
921
"
                return 0
                ;;
        0x1F9E)
                printf -- "%s" "\
1
7982
921
"
                return 0
                ;;
        0x1F9F)
                printf -- "%s" "\
1
7983
921
"
                return 0
                ;;
        0x1FA0)
                printf -- "%s" "\
1
8040
921
"
                return 0
                ;;
        0x1FA1)
                printf -- "%s" "\
1
8041
921
"
                return 0
                ;;
        0x1FA2)
                printf -- "%s" "\
1
8042
921
"
                return 0
                ;;
        0x1FA3)
                printf -- "%s" "\
1
8043
921
"
                return 0
                ;;
        0x1FA4)
                printf -- "%s" "\
1
8044
921
"
                return 0
                ;;
        0x1FA5)
                printf -- "%s" "\
1
8045
921
"
                return 0
                ;;
        0x1FA6)
                printf -- "%s" "\
1
8046
921
"
                return 0
                ;;
        0x1FA7)
                printf -- "%s" "\
1
8047
921
"
                return 0
                ;;
        0x1FA8)
                printf -- "%s" "\
1
8040
921
"
                return 0
                ;;
        0x1FA9)
                printf -- "%s" "\
1
8041
921
"
                return 0
                ;;
        0x1FAA)
                printf -- "%s" "\
1
8042
921
"
                return 0
                ;;
        0x1FAB)
                printf -- "%s" "\
1
8043
921
"
                return 0
                ;;
        0x1FAC)
                printf -- "%s" "\
1
8044
921
"
                return 0
                ;;
        0x1FAD)
                printf -- "%s" "\
1
8045
921
"
                return 0
                ;;
        0x1FAE)
                printf -- "%s" "\
1
8046
921
"
                return 0
                ;;
        0x1FAF)
                printf -- "%s" "\
1
8047
921
"
                return 0
                ;;
        0x1FB2)
                printf -- "%s" "\
1
8122
921
"
                return 0
                ;;
        0x1FB3)
                printf -- "%s" "\
1
913
921
"
                return 0
                ;;
        0x1FB4)
                printf -- "%s" "\
1
902
921
"
                return 0
                ;;
        0x1FB6)
                printf -- "%s" "\
1
913
834
"
                return 0
                ;;
        0x1FB7)
                printf -- "%s" "\
1
913
834
921
"
                return 0
                ;;
        0x1FBA)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8122
921
"
                        return 0
                        ;;
                0x0399)
                        ;;
                esac
                ;;
        0x1FBC)
                printf -- "%s" "\
1
913
921
"
                return 0
                ;;
        0x1FC2)
                printf -- "%s" "\
1
8138
921
"
                return 0
                ;;
        0x1FC3)
                printf -- "%s" "\
1
919
921
"
                return 0
                ;;
        0x1FC4)
                printf -- "%s" "\
1
905
921
"
                return 0
                ;;
        0x1FC6)
                printf -- "%s" "\
1
919
834
"
                return 0
                ;;
        0x1FC7)
                printf -- "%s" "\
1
919
834
921
"
                return 0
                ;;
        0x1FCA)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8138
921
"
                        return 0
                        ;;
                0x0399)
                        ;;
                esac
                ;;
        0x1FCC)
                printf -- "%s" "\
1
919
921
"
                return 0
                ;;
        0x1FD2)
                printf -- "%s" "\
1
921
776
768
"
                return 0
                ;;
        0x1FD6)
                printf -- "%s" "\
1
921
834
"
                return 0
                ;;
        0x1FD7)
                printf -- "%s" "\
1
921
776
834
"
                return 0
                ;;
        0x1FE2)
                printf -- "%s" "\
1
933
776
768
"
                return 0
                ;;
        0x1FE4)
                printf -- "%s" "\
1
929
787
"
                return 0
                ;;
        0x1FE6)
                printf -- "%s" "\
1
933
834
"
                return 0
                ;;
        0x1FE7)
                printf -- "%s" "\
1
933
776
834
"
                return 0
                ;;
        0x1FF2)
                printf -- "%s" "\
1
8186
921
"
                return 0
                ;;
        0x1FF3)
                printf -- "%s" "\
1
937
921
"
                return 0
                ;;
        0x1FF4)
                printf -- "%s" "\
1
911
921
"
                return 0
                ;;
        0x1FF6)
                printf -- "%s" "\
1
937
834
"
                return 0
                ;;
        0x1FF7)
                printf -- "%s" "\
1
937
834
921
"
                return 0
                ;;
        0x1FFA)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8186
921
"
                        return 0
                        ;;
                0x0399)
                        ;;
                esac
                ;;
        0x1FFC)
                printf -- "%s" "\
1
937
921
"
                return 0
                ;;
        0xFB00)
                printf -- "%s" "\
1
70
70
"
                return 0
                ;;
        0xFB01)
                printf -- "%s" "\
1
70
73
"
                return 0
                ;;
        0xFB02)
                printf -- "%s" "\
1
70
76
"
                return 0
                ;;
        0xFB03)
                printf -- "%s" "\
1
70
70
73
"
                return 0
                ;;
        0xFB04)
                printf -- "%s" "\
1
70
70
76
"
                return 0
                ;;
        0xFB06)
                printf -- "%s" "\
1
83
84
"
                return 0
                ;;
        0xFB13)
                printf -- "%s" "\
1
1348
1350
"
                return 0
                ;;
        0xFB14)
                printf -- "%s" "\
1
1348
1333
"
                return 0
                ;;
        0xFB15)
                printf -- "%s" "\
1
1348
1339
"
                return 0
                ;;
        0xFB16)
                printf -- "%s" "\
1
1358
1350
"
                return 0
                ;;
        0xFB17)
                printf -- "%s" "\
1
1348
1341
"
                return 0
                ;;
        esac


        # switching non-special 1:1 casing now
        if [ $____codepoint1 -ge 97 ] && [ $____codepoint1 -le 122 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 192 ] && [ $____codepoint1 -le 214 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -eq 255 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 121 ))
"
                return 0
        elif [ $____codepoint1 -eq 257 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 259 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 261 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 263 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 265 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 267 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 269 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 271 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 273 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 275 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 277 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 279 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 281 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 283 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 285 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 287 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 289 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 291 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 293 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 295 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 297 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 299 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 301 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 303 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 305 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 232 ))
"
                return 0
        elif [ $____codepoint1 -eq 307 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 309 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 311 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 314 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 316 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 318 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 320 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 322 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 324 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 326 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 328 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 331 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 333 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 335 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 337 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 339 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 341 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 343 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 345 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 347 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 349 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 351 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 353 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 355 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 357 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 359 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 361 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 363 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 365 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 367 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 369 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 371 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 373 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 375 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 376 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 121 ))
"
                return 0
        elif [ $____codepoint1 -eq 378 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 380 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 384 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 195 ))
"
                return 0
        elif [ $____codepoint1 -eq 385 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 210 ))
"
                return 0
        elif [ $____codepoint1 -eq 387 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 389 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 390 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 206 ))
"
                return 0
        elif [ $____codepoint1 -eq 392 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 393 ] && [ $____codepoint1 -le 394 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 205 ))
"
                return 0
        elif [ $____codepoint1 -eq 396 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 398 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 79 ))
"
                return 0
        elif [ $____codepoint1 -eq 399 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 202 ))
"
                return 0
        elif [ $____codepoint1 -eq 400 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 203 ))
"
                return 0
        elif [ $____codepoint1 -eq 402 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 403 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 205 ))
"
                return 0
        elif [ $____codepoint1 -eq 405 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 97 ))
"
                return 0
        elif [ $____codepoint1 -eq 406 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 211 ))
"
                return 0
        elif [ $____codepoint1 -eq 407 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 209 ))
"
                return 0
        elif [ $____codepoint1 -eq 411 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42561 ))
"
                return 0
        elif [ $____codepoint1 -eq 412 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 211 ))
"
                return 0
        elif [ $____codepoint1 -eq 414 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 130 ))
"
                return 0
        elif [ $____codepoint1 -eq 415 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 214 ))
"
                return 0
        elif [ $____codepoint1 -eq 417 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 419 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 421 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 424 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 425 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 218 ))
"
                return 0
        elif [ $____codepoint1 -eq 429 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 430 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 218 ))
"
                return 0
        elif [ $____codepoint1 -eq 432 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 433 ] && [ $____codepoint1 -le 434 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 217 ))
"
                return 0
        elif [ $____codepoint1 -eq 436 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 438 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 439 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 219 ))
"
                return 0
        elif [ $____codepoint1 -eq 441 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 445 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 452 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 2 ))
"
                return 0
        elif [ $____codepoint1 -eq 454 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 455 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 2 ))
"
                return 0
        elif [ $____codepoint1 -eq 457 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 458 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 2 ))
"
                return 0
        elif [ $____codepoint1 -eq 460 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 462 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 464 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 466 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 468 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 470 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 472 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 474 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 477 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 79 ))
"
                return 0
        elif [ $____codepoint1 -eq 479 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 481 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 483 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 485 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 487 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 489 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 491 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 493 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 495 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 497 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 2 ))
"
                return 0
        elif [ $____codepoint1 -eq 499 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 501 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 502 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 97 ))
"
                return 0
        elif [ $____codepoint1 -eq 503 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 56 ))
"
                return 0
        elif [ $____codepoint1 -eq 505 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 507 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 509 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 511 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 513 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 515 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 517 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 519 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 521 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 523 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 525 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 527 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 529 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 531 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 533 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 535 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 537 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 539 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 541 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 543 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 544 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 130 ))
"
                return 0
        elif [ $____codepoint1 -eq 547 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 549 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 551 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 553 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 555 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 557 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 559 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 561 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 563 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 570 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10795 ))
"
                return 0
        elif [ $____codepoint1 -eq 572 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 573 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 163 ))
"
                return 0
        elif [ $____codepoint1 -ge 575 ] && [ $____codepoint1 -le 576 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10815 ))
"
                return 0
        elif [ $____codepoint1 -eq 578 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 579 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 195 ))
"
                return 0
        elif [ $____codepoint1 -eq 580 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 69 ))
"
                return 0
        elif [ $____codepoint1 -eq 581 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 71 ))
"
                return 0
        elif [ $____codepoint1 -eq 583 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 585 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 587 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 589 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 670 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42258 ))
"
                return 0
        elif [ $____codepoint1 -eq 881 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 883 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 891 ] && [ $____codepoint1 -le 893 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 130 ))
"
                return 0
        elif [ $____codepoint1 -eq 895 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 116 ))
"
                return 0
        elif [ $____codepoint1 -eq 902 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 38 ))
"
                return 0
        elif [ $____codepoint1 -ge 904 ] && [ $____codepoint1 -le 906 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 37 ))
"
                return 0
        elif [ $____codepoint1 -eq 908 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 64 ))
"
                return 0
        elif [ $____codepoint1 -ge 910 ] && [ $____codepoint1 -le 911 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 63 ))
"
                return 0
        elif [ $____codepoint1 -ge 913 ] && [ $____codepoint1 -le 929 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 973 ] && [ $____codepoint1 -le 974 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 63 ))
"
                return 0
        elif [ $____codepoint1 -eq 993 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 995 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 997 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 999 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1001 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1003 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1005 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1007 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1012 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 60 ))
"
                return 0
        elif [ $____codepoint1 -eq 1016 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1017 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 7 ))
"
                return 0
        elif [ $____codepoint1 -eq 1019 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 1021 ] && [ $____codepoint1 -le 1023 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 130 ))
"
                return 0
        elif [ $____codepoint1 -ge 1024 ] && [ $____codepoint1 -le 1039 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 80 ))
"
                return 0
        elif [ $____codepoint1 -ge 1104 ] && [ $____codepoint1 -le 1119 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 80 ))
"
                return 0
        elif [ $____codepoint1 -eq 1121 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1123 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1125 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1127 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1129 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1131 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1133 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1135 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1137 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1139 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1141 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1143 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1145 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1147 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1149 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1151 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1153 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1163 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1165 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1167 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1169 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1171 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1173 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1175 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1177 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1179 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1181 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1183 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1185 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1187 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1189 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1191 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1193 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1195 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1197 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1199 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1201 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1203 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1205 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1207 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1209 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1211 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1213 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1215 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1218 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1220 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1222 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1224 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1226 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1228 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1231 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 15 ))
"
                return 0
        elif [ $____codepoint1 -eq 1233 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1235 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1237 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1239 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1241 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1243 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1245 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1247 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1249 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1251 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1253 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1255 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1257 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1259 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1261 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1263 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1265 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1267 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1269 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1271 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1273 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1275 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1277 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1279 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1281 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1283 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1285 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1287 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1289 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1291 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1293 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1295 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1297 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1299 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1301 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1303 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1305 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1307 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1309 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1311 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1313 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1315 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1317 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1319 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1321 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1323 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1325 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1327 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 1377 ] && [ $____codepoint1 -le 1414 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 48 ))
"
                return 0
        elif [ $____codepoint1 -ge 4256 ] && [ $____codepoint1 -le 4293 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 7264 ))
"
                return 0
        elif [ $____codepoint1 -eq 4295 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 7264 ))
"
                return 0
        elif [ $____codepoint1 -eq 7304 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 35266 ))
"
                return 0
        elif [ $____codepoint1 -eq 7306 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 7312 ] && [ $____codepoint1 -le 7354 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 3008 ))
"
                return 0
        elif [ $____codepoint1 -eq 7566 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 35384 ))
"
                return 0
        elif [ $____codepoint1 -eq 7681 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7683 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7685 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7687 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7689 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7691 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7693 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7695 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7697 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7699 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7701 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7703 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7705 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7707 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7709 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7711 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7713 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7715 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7717 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7719 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7721 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7723 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7725 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7727 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7729 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7731 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7733 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7735 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7737 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7739 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7741 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7743 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7745 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7747 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7749 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7751 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7753 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7755 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7757 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7759 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7761 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7763 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7765 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7767 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7769 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7771 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7773 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7775 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7777 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7779 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7781 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7783 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7785 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7787 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7789 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7791 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7793 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7795 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7797 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7799 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7801 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7803 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7805 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7807 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7809 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7811 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7813 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7815 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7817 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7819 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7821 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7823 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7825 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7827 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7835 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 59 ))
"
                return 0
        elif [ $____codepoint1 -eq 7838 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 7615 ))
"
                return 0
        elif [ $____codepoint1 -eq 7841 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7843 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7845 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7847 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7849 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7851 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7853 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7855 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7857 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7859 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7861 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7863 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7865 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7867 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7869 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7871 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7873 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7875 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7877 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7879 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7881 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7883 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7885 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7887 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7889 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7891 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7893 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7895 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7897 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7899 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7901 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7903 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7905 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7907 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7909 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7911 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7913 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7915 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7917 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7919 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7921 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7923 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7925 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7927 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7929 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7931 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7933 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 7936 ] && [ $____codepoint1 -le 7943 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 7952 ] && [ $____codepoint1 -le 7957 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 7968 ] && [ $____codepoint1 -le 7975 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 7984 ] && [ $____codepoint1 -le 7991 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8000 ] && [ $____codepoint1 -le 8005 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8023 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8025 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8027 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8029 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8032 ] && [ $____codepoint1 -le 8039 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8064 ] && [ $____codepoint1 -le 8071 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8080 ] && [ $____codepoint1 -le 8087 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8096 ] && [ $____codepoint1 -le 8103 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8115 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 9 ))
"
                return 0
        elif [ $____codepoint1 -ge 8120 ] && [ $____codepoint1 -le 8121 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8122 ] && [ $____codepoint1 -le 8123 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 74 ))
"
                return 0
        elif [ $____codepoint1 -eq 8131 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 9 ))
"
                return 0
        elif [ $____codepoint1 -ge 8136 ] && [ $____codepoint1 -le 8139 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 86 ))
"
                return 0
        elif [ $____codepoint1 -ge 8144 ] && [ $____codepoint1 -le 8145 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8152 ] && [ $____codepoint1 -le 8153 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8165 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 7 ))
"
                return 0
        elif [ $____codepoint1 -ge 8168 ] && [ $____codepoint1 -le 8169 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8170 ] && [ $____codepoint1 -le 8171 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 112 ))
"
                return 0
        elif [ $____codepoint1 -eq 8179 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 9 ))
"
                return 0
        elif [ $____codepoint1 -ge 8184 ] && [ $____codepoint1 -le 8185 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 128 ))
"
                return 0
        elif [ $____codepoint1 -ge 8186 ] && [ $____codepoint1 -le 8187 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 126 ))
"
                return 0
        elif [ $____codepoint1 -eq 8188 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 9 ))
"
                return 0
        elif [ $____codepoint1 -eq 8580 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 9424 ] && [ $____codepoint1 -le 9449 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 26 ))
"
                return 0
        elif [ $____codepoint1 -ge 11312 ] && [ $____codepoint1 -le 11359 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 48 ))
"
                return 0
        elif [ $____codepoint1 -eq 11361 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11362 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10743 ))
"
                return 0
        elif [ $____codepoint1 -eq 11363 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 3814 ))
"
                return 0
        elif [ $____codepoint1 -eq 11366 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10792 ))
"
                return 0
        elif [ $____codepoint1 -eq 11368 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11370 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11372 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11373 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10780 ))
"
                return 0
        elif [ $____codepoint1 -eq 11374 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10749 ))
"
                return 0
        elif [ $____codepoint1 -eq 11375 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10783 ))
"
                return 0
        elif [ $____codepoint1 -eq 11376 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10782 ))
"
                return 0
        elif [ $____codepoint1 -eq 11379 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11382 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 11390 ] && [ $____codepoint1 -le 11391 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10815 ))
"
                return 0
        elif [ $____codepoint1 -eq 11393 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11395 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11397 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11399 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11401 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11403 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11405 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11407 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11409 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11411 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11413 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11415 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11417 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11419 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11421 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11423 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11425 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11427 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11429 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11431 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11433 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11435 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11437 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11439 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11441 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11443 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11445 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11447 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11449 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11451 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11453 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11455 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11457 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11459 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11461 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11463 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11465 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11467 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11469 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11471 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11473 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11475 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11477 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11479 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11481 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11483 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11485 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11487 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11489 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11491 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11500 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11502 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11565 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 7264 ))
"
                return 0
        elif [ $____codepoint1 -eq 42561 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42563 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42565 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42567 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42569 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42571 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42573 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42575 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42577 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42579 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42581 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42583 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42585 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42587 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42589 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42591 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42593 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42595 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42597 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42599 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42601 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42603 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42605 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42625 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42627 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42629 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42631 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42633 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42635 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42637 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42639 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42641 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42643 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42645 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42647 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42649 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42651 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42787 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42789 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42791 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42793 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42795 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42797 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42799 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42803 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42805 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42807 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42809 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42811 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42813 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42815 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42817 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42819 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42821 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42823 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42825 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42827 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42829 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42831 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42833 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42835 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42837 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42839 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42841 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42843 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42845 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42847 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42849 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42851 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42853 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42855 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42857 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42859 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42861 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42863 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42874 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42876 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42877 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 35332 ))
"
                return 0
        elif [ $____codepoint1 -eq 42879 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42881 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42883 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42885 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42887 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42892 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42893 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42280 ))
"
                return 0
        elif [ $____codepoint1 -eq 42897 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42900 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 48 ))
"
                return 0
        elif [ $____codepoint1 -eq 42903 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42905 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42907 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42909 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42911 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42913 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42915 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42917 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42919 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42921 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42922 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42308 ))
"
                return 0
        elif [ $____codepoint1 -eq 42923 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42319 ))
"
                return 0
        elif [ $____codepoint1 -eq 42924 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42315 ))
"
                return 0
        elif [ $____codepoint1 -eq 42925 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42305 ))
"
                return 0
        elif [ $____codepoint1 -eq 42926 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42308 ))
"
                return 0
        elif [ $____codepoint1 -eq 42928 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42258 ))
"
                return 0
        elif [ $____codepoint1 -eq 42929 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42282 ))
"
                return 0
        elif [ $____codepoint1 -eq 42930 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42261 ))
"
                return 0
        elif [ $____codepoint1 -eq 42931 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 928 ))
"
                return 0
        elif [ $____codepoint1 -eq 42933 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42935 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42937 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42939 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42941 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42943 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42945 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42947 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42948 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 48 ))
"
                return 0
        elif [ $____codepoint1 -eq 42949 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42307 ))
"
                return 0
        elif [ $____codepoint1 -eq 42950 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 35384 ))
"
                return 0
        elif [ $____codepoint1 -eq 42952 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42954 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42955 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42343 ))
"
                return 0
        elif [ $____codepoint1 -eq 42957 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42961 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42967 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42969 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42971 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42972 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 42561 ))
"
                return 0
        elif [ $____codepoint1 -ge 43888 ] && [ $____codepoint1 -le 43967 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 38864 ))
"
                return 0
        elif [ $____codepoint1 -ge 65345 ] && [ $____codepoint1 -le 65370 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 66600 ] && [ $____codepoint1 -le 66639 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 40 ))
"
                return 0
        elif [ $____codepoint1 -ge 66776 ] && [ $____codepoint1 -le 66811 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 40 ))
"
                return 0
        elif [ $____codepoint1 -ge 66928 ] && [ $____codepoint1 -le 66938 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 39 ))
"
                return 0
        elif [ $____codepoint1 -ge 66940 ] && [ $____codepoint1 -le 66954 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 39 ))
"
                return 0
        elif [ $____codepoint1 -ge 66956 ] && [ $____codepoint1 -le 66962 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 39 ))
"
                return 0
        elif [ $____codepoint1 -ge 67003 ] && [ $____codepoint1 -le 67004 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 39 ))
"
                return 0
        elif [ $____codepoint1 -ge 68800 ] && [ $____codepoint1 -le 68850 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 64 ))
"
                return 0
        elif [ $____codepoint1 -ge 68976 ] && [ $____codepoint1 -le 68997 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 71872 ] && [ $____codepoint1 -le 71903 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 93792 ] && [ $____codepoint1 -le 93823 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        else
                printf -- "%s" "\
1
$(( $____codepoint1 ))
"
                return 0
        fi
}




# report import status
return 0
