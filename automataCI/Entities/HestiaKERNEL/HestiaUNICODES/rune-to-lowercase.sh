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
hestiaUNICODES_Rune_To_Lowercase() {
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
                0x0130)
                        printf -- "%s" "\
1
105
"
                        return 0
                        ;;
                0x0049)
                        case "$____codepoint2" in
                        0x0307)
                                printf -- "%s" "\
2
105
"
                                return 0
                                ;;
                        *)
                                printf -- "%s" "\
1
305
"
                                return 0
                                ;;
                        esac
                        ;;
                esac
                ;;
        lt)
                # Lithuanian
                case "$____codepoint1" in
                0x0049)
                        printf -- "%s" "\
1
105
775
"
                        return 0
                        ;;
                0x004A)
                        printf -- "%s" "\
1
106
775
"
                        return 0
                        ;;
                0x012E)
                        printf -- "%s" "\
1
303
775
"
                        return 0
                        ;;
                0x00CC)
                        printf -- "%s" "\
1
303
775
768
"
                        return 0
                        ;;
                0x00CD)
                        printf -- "%s" "\
1
105
775
769
"
                        return 0
                        ;;
                0x0128)
                        printf -- "%s" "\
1
105
775
771
"
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
                        printf -- "%s" "\
2
7834
"
                        return 0
                        ;;
                esac
                ;;
        0x0046)
                case "$____codepoint2" in
                0x0046)
                        case "$____codepoint3" in
                        0x0049)
                                printf -- "%s" "\
3
64259
"
                                return 0
                                ;;
                        0x004C)
                                printf -- "%s" "\
3
64260
"
                                return 0
                                ;;
                        *)
                                printf -- "%s" "\
2
64256
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0049)
                        printf -- "%s" "\
2
64257
"
                        return 0
                        ;;
                0x004C)
                        printf -- "%s" "\
2
64258
"
                        return 0
                        ;;
                0x0066)
                        case "$____codepoint3" in
                        0x0069)
                                printf -- "%s" "\
3
64259
"
                                return 0
                                ;;
                        0x006C)
                                printf -- "%s" "\
3
64260
"
                                return 0
                                ;;
                        *)
                                printf -- "%s" "\
2
64256
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0069)
                        printf -- "%s" "\
2
64257
"
                        return 0
                        ;;
                0x006C)
                        printf -- "%s" "\
2
64258
"
                        return 0
                        ;;
                esac
                ;;
        0x0048)
                case "$____codepoint2" in
                0x0331)
                        printf -- "%s" "\
2
7830
"
                        return 0
                        ;;
                esac
                ;;
        0x004A)
                case "$____codepoint2" in
                0x030C)
                        printf -- "%s" "\
2
496
"
                        return 0
                        ;;
                esac
                ;;
        0x0053)
                case "$____codepoint2" in
                0x0053)
                        printf -- "%s" "\
2
223
"
                        return 0
                        ;;
                0x0054)
                        printf -- "%s" "\
2
64262
"
                        return 0
                        ;;
                0x0073)
                        printf -- "%s" "\
2
223
"
                        return 0
                        ;;
                0x0074)
                        printf -- "%s" "\
2
64262
"
                        return 0
                        ;;
                esac
                ;;
        0x0054)
                case "$____codepoint2" in
                0x0308)
                        printf -- "%s" "\
2
7831
"
                        return 0
                        ;;
                esac
                ;;
        0x0057)
                case "$____codepoint2" in
                0x030A)
                        printf -- "%s" "\
2
7832
"
                        return 0
                        ;;
                esac
                ;;
        0x0059)
                case "$____codepoint2" in
                0x030A)
                        printf -- "%s" "\
2
7833
"
                        return 0
                        ;;
                esac
                ;;
        0x0069)
                case "$____codepoint2" in
                0x0307)
                        ;;
                esac
                ;;
        0x00DF)
                ;;
        0x0130)
                printf -- "%s" "\
1
105
775
"
                return 0
                ;;
        0x0149)
                ;;
        0x01F0)
                ;;
        0x02BC)
                case "$____codepoint2" in
                0x004E)
                        printf -- "%s" "\
2
329
"
                        return 0
                        ;;
                esac
                ;;
        0x0386)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8116
"
                        return 0
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8116
"
                        return 0
                        ;;
                esac
                ;;
        0x0389)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8132
"
                        return 0
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8132
"
                        return 0
                        ;;
                esac
                ;;
        0x038F)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8180
"
                        return 0
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8180
"
                        return 0
                        ;;
                esac
                ;;
        0x0390)
                ;;
        0x0391)
                case "$____codepoint2" in
                0x0342)
                        case "$____codepoint3" in
                        0x0345)
                                printf -- "%s" "\
3
8119
"
                                return 0
                                ;;
                        0x0399)
                                printf -- "%s" "\
3
8119
"
                                return 0
                                ;;
                        *)
                                printf -- "%s" "\
2
8118
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8115
"
                        return 0
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
8135
"
                                return 0
                                ;;
                        0x0399)
                                printf -- "%s" "\
3
8135
"
                                return 0
                                ;;
                        *)
                                printf -- "%s" "\
2
8134
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8131
"
                        return 0
                        ;;
                esac
                ;;
        0x0399)
                case "$____codepoint2" in
                0x0308)
                        case "$____codepoint3" in
                        0x0300)
                                printf -- "%s" "\
3
8146
"
                                return 0
                                ;;
                        0x0301)
                                printf -- "%s" "\
3
912
"
                                return 0
                                ;;
                        0x0342)
                                printf -- "%s" "\
3
8151
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0342)
                        printf -- "%s" "\
2
8150
"
                        return 0
                        ;;
                esac
                ;;
        0x03A1)
                case "$____codepoint2" in
                0x0313)
                        printf -- "%s" "\
2
8164
"
                        return 0
                        ;;
                esac
                ;;
        0x03A3)
                printf -- "%s" "\
1
962
"
                return 0
                ;;
        0x03A5)
                case "$____codepoint2" in
                0x0308)
                        case "$____codepoint3" in
                        0x0300)
                                printf -- "%s" "\
3
8162
"
                                return 0
                                ;;
                        0x0301)
                                printf -- "%s" "\
3
944
"
                                return 0
                                ;;
                        0x0342)
                                printf -- "%s" "\
3
8167
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0313)
                        case "$____codepoint3" in
                        0x0300)
                                printf -- "%s" "\
3
8018
"
                                return 0
                                ;;
                        0x0301)
                                printf -- "%s" "\
3
8020
"
                                return 0
                                ;;
                        0x0342)
                                printf -- "%s" "\
3
8022
"
                                return 0
                                ;;
                        *)
                                printf -- "%s" "\
2
8016
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0342)
                        printf -- "%s" "\
2
8166
"
                        return 0
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
8183
"
                                return 0
                                ;;
                        0x0399)
                                printf -- "%s" "\
3
8183
"
                                return 0
                                ;;
                        *)
                                printf -- "%s" "\
2
8182
"
                                return 0
                                ;;
                        esac
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8179
"
                        return 0
                        ;;
                esac
                ;;
        0x03B0)
                ;;
        0x03C2)
                ;;
        0x0535)
                case "$____codepoint2" in
                0x0552)
                        printf -- "%s" "\
2
1415
"
                        return 0
                        ;;
                0x0582)
                        printf -- "%s" "\
2
1415
"
                        return 0
                        ;;
                esac
                ;;
        0x0544)
                case "$____codepoint2" in
                0x0535)
                        printf -- "%s" "\
2
64276
"
                        return 0
                        ;;
                0x053B)
                        printf -- "%s" "\
2
64277
"
                        return 0
                        ;;
                0x053D)
                        printf -- "%s" "\
2
64279
"
                        return 0
                        ;;
                0x0546)
                        printf -- "%s" "\
2
64275
"
                        return 0
                        ;;
                0x0565)
                        printf -- "%s" "\
2
64276
"
                        return 0
                        ;;
                0x056B)
                        printf -- "%s" "\
2
64277
"
                        return 0
                        ;;
                0x056D)
                        printf -- "%s" "\
2
64279
"
                        return 0
                        ;;
                0x0576)
                        printf -- "%s" "\
2
64275
"
                        return 0
                        ;;
                esac
                ;;
        0x054E)
                case "$____codepoint2" in
                0x0546)
                        printf -- "%s" "\
2
64278
"
                        return 0
                        ;;
                0x0576)
                        printf -- "%s" "\
2
64278
"
                        return 0
                        ;;
                esac
                ;;
        0x0587)
                ;;
        0x1E96)
                ;;
        0x1E97)
                ;;
        0x1E98)
                ;;
        0x1E99)
                ;;
        0x1E9A)
                ;;
        0x1F08)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8064
"
                        return 0
                        ;;
                esac
                ;;
        0x1F09)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8065
"
                        return 0
                        ;;
                esac
                ;;
        0x1F0A)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8066
"
                        return 0
                        ;;
                esac
                ;;
        0x1F0B)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8067
"
                        return 0
                        ;;
                esac
                ;;
        0x1F0C)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8068
"
                        return 0
                        ;;
                esac
                ;;
        0x1F0D)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8069
"
                        return 0
                        ;;
                esac
                ;;
        0x1F0E)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8070
"
                        return 0
                        ;;
                esac
                ;;
        0x1F0F)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8071
"
                        return 0
                        ;;
                esac
                ;;
        0x1F28)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8080
"
                        return 0
                        ;;
                esac
                ;;
        0x1F29)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8081
"
                        return 0
                        ;;
                esac
                ;;
        0x1F2A)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8082
"
                        return 0
                        ;;
                esac
                ;;
        0x1F2B)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8083
"
                        return 0
                        ;;
                esac
                ;;
        0x1F2C)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8084
"
                        return 0
                        ;;
                esac
                ;;
        0x1F2D)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8085
"
                        return 0
                        ;;
                esac
                ;;
        0x1F2E)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8086
"
                        return 0
                        ;;
                esac
                ;;
        0x1F2F)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8087
"
                        return 0
                        ;;
                esac
                ;;
        0x1F50)
                ;;
        0x1F52)
                ;;
        0x1F54)
                ;;
        0x1F56)
                ;;
        0x1F68)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8096
"
                        return 0
                        ;;
                esac
                ;;
        0x1F69)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8097
"
                        return 0
                        ;;
                esac
                ;;
        0x1F6A)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8098
"
                        return 0
                        ;;
                esac
                ;;
        0x1F6B)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8099
"
                        return 0
                        ;;
                esac
                ;;
        0x1F6C)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8100
"
                        return 0
                        ;;
                esac
                ;;
        0x1F6D)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8101
"
                        return 0
                        ;;
                esac
                ;;
        0x1F6E)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8102
"
                        return 0
                        ;;
                esac
                ;;
        0x1F6F)
                case "$____codepoint2" in
                0x0399)
                        printf -- "%s" "\
2
8103
"
                        return 0
                        ;;
                esac
                ;;
        0x1F80)
                ;;
        0x1F81)
                ;;
        0x1F82)
                ;;
        0x1F83)
                ;;
        0x1F84)
                ;;
        0x1F85)
                ;;
        0x1F86)
                ;;
        0x1F87)
                ;;
        0x1F88)
                printf -- "%s" "\
1
8064
"
                return 0
                ;;
        0x1F89)
                printf -- "%s" "\
1
8065
"
                return 0
                ;;
        0x1F8A)
                printf -- "%s" "\
1
8066
"
                return 0
                ;;
        0x1F8B)
                printf -- "%s" "\
1
8067
"
                return 0
                ;;
        0x1F8C)
                printf -- "%s" "\
1
8068
"
                return 0
                ;;
        0x1F8D)
                printf -- "%s" "\
1
8069
"
                return 0
                ;;
        0x1F8E)
                printf -- "%s" "\
1
8070
"
                return 0
                ;;
        0x1F8F)
                printf -- "%s" "\
1
8071
"
                return 0
                ;;
        0x1F90)
                ;;
        0x1F91)
                ;;
        0x1F92)
                ;;
        0x1F93)
                ;;
        0x1F94)
                ;;
        0x1F95)
                ;;
        0x1F96)
                ;;
        0x1F97)
                ;;
        0x1F98)
                printf -- "%s" "\
1
8080
"
                return 0
                ;;
        0x1F99)
                printf -- "%s" "\
1
8081
"
                return 0
                ;;
        0x1F9A)
                printf -- "%s" "\
1
8082
"
                return 0
                ;;
        0x1F9B)
                printf -- "%s" "\
1
8083
"
                return 0
                ;;
        0x1F9C)
                printf -- "%s" "\
1
8084
"
                return 0
                ;;
        0x1F9D)
                printf -- "%s" "\
1
8085
"
                return 0
                ;;
        0x1F9E)
                printf -- "%s" "\
1
8086
"
                return 0
                ;;
        0x1F9F)
                printf -- "%s" "\
1
8087
"
                return 0
                ;;
        0x1FA0)
                ;;
        0x1FA1)
                ;;
        0x1FA2)
                ;;
        0x1FA3)
                ;;
        0x1FA4)
                ;;
        0x1FA5)
                ;;
        0x1FA6)
                ;;
        0x1FA7)
                ;;
        0x1FA8)
                printf -- "%s" "\
1
8096
"
                return 0
                ;;
        0x1FA9)
                printf -- "%s" "\
1
8097
"
                return 0
                ;;
        0x1FAA)
                printf -- "%s" "\
1
8098
"
                return 0
                ;;
        0x1FAB)
                printf -- "%s" "\
1
8099
"
                return 0
                ;;
        0x1FAC)
                printf -- "%s" "\
1
8100
"
                return 0
                ;;
        0x1FAD)
                printf -- "%s" "\
1
8101
"
                return 0
                ;;
        0x1FAE)
                printf -- "%s" "\
1
8102
"
                return 0
                ;;
        0x1FAF)
                printf -- "%s" "\
1
8103
"
                return 0
                ;;
        0x1FB2)
                ;;
        0x1FB3)
                ;;
        0x1FB4)
                ;;
        0x1FB6)
                ;;
        0x1FB7)
                ;;
        0x1FBA)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8114
"
                        return 0
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8114
"
                        return 0
                        ;;
                esac
                ;;
        0x1FBC)
                printf -- "%s" "\
1
8115
"
                return 0
                ;;
        0x1FC2)
                ;;
        0x1FC3)
                ;;
        0x1FC4)
                ;;
        0x1FC6)
                ;;
        0x1FC7)
                ;;
        0x1FCA)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8130
"
                        return 0
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8130
"
                        return 0
                        ;;
                esac
                ;;
        0x1FCC)
                printf -- "%s" "\
1
8131
"
                return 0
                ;;
        0x1FD2)
                ;;
        0x1FD6)
                ;;
        0x1FD7)
                ;;
        0x1FE2)
                ;;
        0x1FE4)
                ;;
        0x1FE6)
                ;;
        0x1FE7)
                ;;
        0x1FF2)
                ;;
        0x1FF3)
                ;;
        0x1FF4)
                ;;
        0x1FF6)
                ;;
        0x1FF7)
                ;;
        0x1FFA)
                case "$____codepoint2" in
                0x0345)
                        printf -- "%s" "\
2
8178
"
                        return 0
                        ;;
                0x0399)
                        printf -- "%s" "\
2
8178
"
                        return 0
                        ;;
                esac
                ;;
        0x1FFC)
                printf -- "%s" "\
1
8179
"
                return 0
                ;;
        0xFB00)
                ;;
        0xFB01)
                ;;
        0xFB02)
                ;;
        0xFB03)
                ;;
        0xFB04)
                ;;
        0xFB06)
                ;;
        0xFB13)
                ;;
        0xFB14)
                ;;
        0xFB15)
                ;;
        0xFB16)
                ;;
        0xFB17)
                ;;
        esac


        # switching non-special 1:1 casing now
        if [ $____codepoint1 -ge 65 ] && [ $____codepoint1 -le 90 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 216 ] && [ $____codepoint1 -le 222 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 224 ] && [ $____codepoint1 -le 246 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 248 ] && [ $____codepoint1 -le 254 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -eq 256 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 258 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 260 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 262 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 264 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 266 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 268 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 270 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 272 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 274 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 276 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 278 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 280 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 282 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 284 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 286 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 288 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 290 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 292 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 294 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 296 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 298 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 300 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 302 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 304 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 199 ))
"
                return 0
        elif [ $____codepoint1 -eq 306 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 308 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 310 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 313 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 315 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 317 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 319 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 321 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 323 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 325 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 327 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 330 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 332 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 334 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 336 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 338 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 340 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 342 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 344 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 346 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 348 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 350 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 352 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 354 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 356 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 358 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 360 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 362 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 364 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 366 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 368 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 370 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 372 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 374 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 377 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 379 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 381 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 382 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 383 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 300 ))
"
                return 0
        elif [ $____codepoint1 -eq 386 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 388 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 391 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 395 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 401 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 404 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 207 ))
"
                return 0
        elif [ $____codepoint1 -eq 408 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 409 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 410 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 163 ))
"
                return 0
        elif [ $____codepoint1 -eq 413 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 213 ))
"
                return 0
        elif [ $____codepoint1 -eq 416 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 418 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 420 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 423 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 428 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 431 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 435 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 437 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 440 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 444 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 453 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 456 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 459 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 461 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 463 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 465 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 467 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 469 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 471 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 473 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 475 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 476 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 478 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 480 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 482 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 484 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 486 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 488 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 490 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 492 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 494 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 498 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 500 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 504 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 506 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 508 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 510 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 512 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 514 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 516 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 518 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 520 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 522 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 524 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 526 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 528 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 530 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 532 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 534 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 536 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 538 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 540 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 542 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 546 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 548 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 550 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 552 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 554 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 556 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 558 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 560 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 562 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 571 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 574 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10792 ))
"
                return 0
        elif [ $____codepoint1 -eq 577 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 582 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 584 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 586 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 588 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 590 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 591 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 592 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10783 ))
"
                return 0
        elif [ $____codepoint1 -eq 593 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10780 ))
"
                return 0
        elif [ $____codepoint1 -eq 594 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10782 ))
"
                return 0
        elif [ $____codepoint1 -eq 595 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 210 ))
"
                return 0
        elif [ $____codepoint1 -eq 596 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 206 ))
"
                return 0
        elif [ $____codepoint1 -ge 598 ] && [ $____codepoint1 -le 599 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 205 ))
"
                return 0
        elif [ $____codepoint1 -eq 601 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 202 ))
"
                return 0
        elif [ $____codepoint1 -eq 603 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 203 ))
"
                return 0
        elif [ $____codepoint1 -eq 604 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42319 ))
"
                return 0
        elif [ $____codepoint1 -eq 608 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 205 ))
"
                return 0
        elif [ $____codepoint1 -eq 609 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42315 ))
"
                return 0
        elif [ $____codepoint1 -eq 611 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 207 ))
"
                return 0
        elif [ $____codepoint1 -eq 612 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42343 ))
"
                return 0
        elif [ $____codepoint1 -eq 613 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42280 ))
"
                return 0
        elif [ $____codepoint1 -eq 614 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42308 ))
"
                return 0
        elif [ $____codepoint1 -eq 616 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 209 ))
"
                return 0
        elif [ $____codepoint1 -eq 617 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 211 ))
"
                return 0
        elif [ $____codepoint1 -eq 619 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10743 ))
"
                return 0
        elif [ $____codepoint1 -eq 620 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42305 ))
"
                return 0
        elif [ $____codepoint1 -eq 623 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 211 ))
"
                return 0
        elif [ $____codepoint1 -eq 625 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10749 ))
"
                return 0
        elif [ $____codepoint1 -eq 626 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 213 ))
"
                return 0
        elif [ $____codepoint1 -eq 629 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 214 ))
"
                return 0
        elif [ $____codepoint1 -eq 637 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 10727 ))
"
                return 0
        elif [ $____codepoint1 -eq 642 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42307 ))
"
                return 0
        elif [ $____codepoint1 -eq 643 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 218 ))
"
                return 0
        elif [ $____codepoint1 -eq 647 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42282 ))
"
                return 0
        elif [ $____codepoint1 -eq 648 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 218 ))
"
                return 0
        elif [ $____codepoint1 -eq 649 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 69 ))
"
                return 0
        elif [ $____codepoint1 -ge 650 ] && [ $____codepoint1 -le 651 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 217 ))
"
                return 0
        elif [ $____codepoint1 -eq 652 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 71 ))
"
                return 0
        elif [ $____codepoint1 -eq 658 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 219 ))
"
                return 0
        elif [ $____codepoint1 -eq 669 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 42261 ))
"
                return 0
        elif [ $____codepoint1 -eq 880 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 882 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 886 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 887 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 931 ] && [ $____codepoint1 -le 939 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -eq 940 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 38 ))
"
                return 0
        elif [ $____codepoint1 -ge 941 ] && [ $____codepoint1 -le 943 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 37 ))
"
                return 0
        elif [ $____codepoint1 -ge 945 ] && [ $____codepoint1 -le 961 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -eq 962 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 31 ))
"
                return 0
        elif [ $____codepoint1 -ge 963 ] && [ $____codepoint1 -le 971 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -eq 972 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 64 ))
"
                return 0
        elif [ $____codepoint1 -eq 975 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 985 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 987 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 989 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 991 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 994 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 996 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 998 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1000 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1002 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1004 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1006 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1015 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1018 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 1040 ] && [ $____codepoint1 -le 1071 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 1072 ] && [ $____codepoint1 -le 1103 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 32 ))
"
                return 0
        elif [ $____codepoint1 -eq 1120 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1122 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1124 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1126 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1128 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1130 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1132 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1134 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1136 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1138 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1140 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1142 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1144 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1146 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1148 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1150 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1152 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1162 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1164 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1166 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1168 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1170 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1172 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1174 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1176 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1178 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1180 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1182 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1184 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1186 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1188 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1190 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1192 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1194 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1196 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1198 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1200 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1202 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1204 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1206 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1208 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1210 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1212 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1214 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1217 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1219 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1221 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1223 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1225 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1227 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1229 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1230 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1232 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1234 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1236 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1238 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1240 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1242 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1244 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1246 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1248 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1250 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1252 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1254 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1256 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1258 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1260 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1262 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1264 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1266 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1268 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1270 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1272 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1274 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1276 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1278 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1280 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1282 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1284 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1286 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1288 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1290 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1292 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1294 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1296 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1298 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1300 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1302 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1304 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1306 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1308 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1310 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1312 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1314 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1316 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1318 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1320 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1322 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1324 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 1326 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 1329 ] && [ $____codepoint1 -le 1366 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 48 ))
"
                return 0
        elif [ $____codepoint1 -eq 4301 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 7264 ))
"
                return 0
        elif [ $____codepoint1 -ge 5112 ] && [ $____codepoint1 -le 5117 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 7296 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 6254 ))
"
                return 0
        elif [ $____codepoint1 -eq 7297 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 6253 ))
"
                return 0
        elif [ $____codepoint1 -eq 7298 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 6244 ))
"
                return 0
        elif [ $____codepoint1 -ge 7299 ] && [ $____codepoint1 -le 7300 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 6242 ))
"
                return 0
        elif [ $____codepoint1 -eq 7301 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 6243 ))
"
                return 0
        elif [ $____codepoint1 -eq 7302 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 6236 ))
"
                return 0
        elif [ $____codepoint1 -eq 7303 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 6181 ))
"
                return 0
        elif [ $____codepoint1 -eq 7305 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 7357 ] && [ $____codepoint1 -le 7359 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 3008 ))
"
                return 0
        elif [ $____codepoint1 -eq 7545 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 35332 ))
"
                return 0
        elif [ $____codepoint1 -eq 7549 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 3814 ))
"
                return 0
        elif [ $____codepoint1 -eq 7680 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7682 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7684 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7686 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7688 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7690 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7692 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7694 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7696 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7698 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7700 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7702 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7704 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7706 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7708 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7710 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7712 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7714 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7716 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7718 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7720 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7722 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7724 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7726 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7728 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7730 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7732 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7734 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7736 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7738 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7740 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7742 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7744 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7746 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7748 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7750 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7752 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7754 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7756 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7758 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7760 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7762 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7764 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7766 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7768 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7770 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7772 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7774 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7776 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7778 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7780 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7782 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7784 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7786 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7788 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7790 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7792 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7794 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7796 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7798 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7800 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7802 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7804 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7806 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7808 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7810 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7812 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7814 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7816 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7818 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7820 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7822 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7824 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7826 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7828 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7829 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7840 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7842 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7844 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7846 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7848 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7850 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7852 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7854 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7856 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7858 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7860 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7862 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7864 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7866 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7868 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7870 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7872 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7874 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7876 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7878 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7880 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7882 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7884 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7886 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7888 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7890 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7892 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7894 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7896 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7898 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7900 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7902 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7904 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7906 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7908 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7910 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7912 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7914 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7916 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7918 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7920 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7922 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7924 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7926 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7928 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7930 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7932 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7934 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 7935 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 7944 ] && [ $____codepoint1 -le 7951 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 7960 ] && [ $____codepoint1 -le 7965 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 7976 ] && [ $____codepoint1 -le 7983 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 7992 ] && [ $____codepoint1 -le 7999 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8008 ] && [ $____codepoint1 -le 8013 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8017 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8019 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8021 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8031 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8040 ] && [ $____codepoint1 -le 8047 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8048 ] && [ $____codepoint1 -le 8049 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 74 ))
"
                return 0
        elif [ $____codepoint1 -ge 8050 ] && [ $____codepoint1 -le 8053 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 86 ))
"
                return 0
        elif [ $____codepoint1 -ge 8054 ] && [ $____codepoint1 -le 8055 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 100 ))
"
                return 0
        elif [ $____codepoint1 -ge 8056 ] && [ $____codepoint1 -le 8057 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 128 ))
"
                return 0
        elif [ $____codepoint1 -ge 8058 ] && [ $____codepoint1 -le 8059 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 112 ))
"
                return 0
        elif [ $____codepoint1 -ge 8060 ] && [ $____codepoint1 -le 8061 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 126 ))
"
                return 0
        elif [ $____codepoint1 -ge 8072 ] && [ $____codepoint1 -le 8079 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8088 ] && [ $____codepoint1 -le 8095 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8104 ] && [ $____codepoint1 -le 8111 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 8 ))
"
                return 0
        elif [ $____codepoint1 -ge 8112 ] && [ $____codepoint1 -le 8113 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8124 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 9 ))
"
                return 0
        elif [ $____codepoint1 -eq 8140 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 9 ))
"
                return 0
        elif [ $____codepoint1 -ge 8154 ] && [ $____codepoint1 -le 8155 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 100 ))
"
                return 0
        elif [ $____codepoint1 -ge 8160 ] && [ $____codepoint1 -le 8161 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 8 ))
"
                return 0
        elif [ $____codepoint1 -eq 8172 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 7 ))
"
                return 0
        elif [ $____codepoint1 -eq 8498 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 28 ))
"
                return 0
        elif [ $____codepoint1 -eq 8526 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 28 ))
"
                return 0
        elif [ $____codepoint1 -ge 8560 ] && [ $____codepoint1 -le 8575 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 16 ))
"
                return 0
        elif [ $____codepoint1 -ge 9398 ] && [ $____codepoint1 -le 9423 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 26 ))
"
                return 0
        elif [ $____codepoint1 -ge 11264 ] && [ $____codepoint1 -le 11311 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 48 ))
"
                return 0
        elif [ $____codepoint1 -eq 11360 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11364 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10727 ))
"
                return 0
        elif [ $____codepoint1 -eq 11365 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 10795 ))
"
                return 0
        elif [ $____codepoint1 -eq 11367 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11369 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11371 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11378 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11381 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11392 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11394 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11396 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11398 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11400 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11402 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11404 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11406 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11408 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11410 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11412 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11414 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11416 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11418 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11420 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11422 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11424 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11426 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11428 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11430 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11432 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11434 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11436 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11438 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11440 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11442 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11444 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11446 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11448 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11450 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11452 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11454 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11456 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11458 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11460 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11462 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11464 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11466 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11468 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11470 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11472 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11474 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11476 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11478 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11480 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11482 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11484 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11486 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11488 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11490 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11499 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11501 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11506 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 11507 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -ge 11520 ] && [ $____codepoint1 -le 11557 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 7264 ))
"
                return 0
        elif [ $____codepoint1 -eq 11559 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 7264 ))
"
                return 0
        elif [ $____codepoint1 -eq 42560 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42562 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42564 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42566 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42568 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42570 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42572 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42574 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42576 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42578 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42580 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42582 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42584 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42586 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42588 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42590 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42592 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42594 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42596 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42598 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42600 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42602 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42604 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42624 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42626 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42628 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42630 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42632 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42634 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42636 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42638 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42640 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42642 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42644 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42646 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42648 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42650 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42786 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42788 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42790 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42792 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42794 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42796 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42798 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42802 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42804 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42806 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42808 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42810 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42812 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42814 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42816 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42818 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42820 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42822 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42824 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42826 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42828 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42830 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42832 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42834 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42836 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42838 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42840 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42842 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42844 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42846 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42848 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42850 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42852 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42854 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42856 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42858 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42860 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42862 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42873 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42875 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42878 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42880 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42882 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42884 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42886 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42891 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42896 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42898 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42899 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42902 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42904 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42906 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42908 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42910 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42912 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42914 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42916 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42918 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42920 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42932 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42934 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42936 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42938 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42940 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42942 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42944 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42946 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42951 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42953 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42956 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42960 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42966 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42968 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42970 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42997 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 42998 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 1 ))
"
                return 0
        elif [ $____codepoint1 -eq 43859 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 928 ))
"
                return 0
        elif [ $____codepoint1 -ge 65313 ] && [ $____codepoint1 -le 65338 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 66560 ] && [ $____codepoint1 -le 66599 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 40 ))
"
                return 0
        elif [ $____codepoint1 -ge 66736 ] && [ $____codepoint1 -le 66771 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 40 ))
"
                return 0
        elif [ $____codepoint1 -ge 66964 ] && [ $____codepoint1 -le 66965 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 39 ))
"
                return 0
        elif [ $____codepoint1 -ge 66967 ] && [ $____codepoint1 -le 66977 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 39 ))
"
                return 0
        elif [ $____codepoint1 -ge 66979 ] && [ $____codepoint1 -le 66993 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 39 ))
"
                return 0
        elif [ $____codepoint1 -ge 66995 ] && [ $____codepoint1 -le 67001 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 - 39 ))
"
                return 0
        elif [ $____codepoint1 -ge 68736 ] && [ $____codepoint1 -le 68786 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 64 ))
"
                return 0
        elif [ $____codepoint1 -ge 68944 ] && [ $____codepoint1 -le 68965 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 71840 ] && [ $____codepoint1 -le 71871 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 93760 ] && [ $____codepoint1 -le 93791 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 32 ))
"
                return 0
        elif [ $____codepoint1 -ge 125184 ] && [ $____codepoint1 -le 125217 ]; then
                printf -- "%s" "\
1
$(( $____codepoint1 + 34 ))
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
