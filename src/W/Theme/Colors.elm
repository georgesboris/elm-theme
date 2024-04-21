module W.Theme.Colors exposing
    ( ThemeColorSet
    , amber, amberDark
    , blue, blueDark
    , bronze, bronzeDark
    , brown, brownDark
    , crimson, crimsonDark
    , cyan, cyanDark
    , gold, goldDark
    , grass, grassDark
    , gray, grayDark
    , green, greenDark
    , indigo, indigoDark
    , iris, irisDark
    , jade, jadeDark
    , lime, limeDark
    , mauve, mauveDark
    , mint, mintDark
    , olive, oliveDark
    , orange, orangeDark
    , pink, pinkDark
    , plum, plumDark
    , purple, purpleDark
    , red, redDark
    , ruby, rubyDark
    , sage, sageDark
    , sand, sandDark
    , sky, skyDark
    , slate, slateDark
    , teal, tealDark
    , tomato, tomatoDark
    , violet, violetDark
    , yellow, yellowDark
    , steel, steelDark
    )

{-|

Based on https://www.radix-ui.com/colors with subtle changes.

- `bg` and `bgSubtle` are basically shades 1 and 2 of radix ui but `bgSubtle` is always **darker** than `bg`.
- There is an additional `solidText` variable so we can always make sure what color has proper contrast with a solid background (instead of mixing rules based on colors).
- There is an additional `solidSubtle` variable so `tint`, `detail` and `solid` sets have standard behavior (`*Strong` is used for hovers and `*Subtle` can both be used for subtle things as well as active state - this can be unexpected but clicking on a button having it become faded actually gives the impression of "pressing" it instead of highlighting it).

@docs amber, amberDark
@docs blue, blueDark
@docs bronze, bronzeDark
@docs brown, brownDark
@docs crimson, crimsonDark
@docs cyan, cyanDark
@docs gold, goldDark
@docs grass, grassDark
@docs gray, grayDark
@docs green, greenDark
@docs indigo, indigoDark
@docs iris, irisDark
@docs jade, jadeDark
@docs lime, limeDark
@docs mauve, mauveDark
@docs mint, mintDark
@docs olive, oliveDark
@docs orange, orangeDark
@docs pink, pinkDark
@docs plum, plumDark
@docs purple, purpleDark
@docs red, redDark
@docs ruby, rubyDark
@docs sage, sageDark
@docs sand, sandDark
@docs sky, skyDark
@docs slate, slateDark
@docs teal, tealDark
@docs tomato, tomatoDark
@docs violet, violetDark
@docs yellow, yellowDark

-}


{-| -}
type alias ThemeColorSet =
    { bg : String
    , bgSubtle : String
    , tint : String
    , tintSubtle : String
    , tintStrong : String
    , detail : String
    , detailSubtle : String
    , detailStrong : String
    , solid : String
    , solidSubtle : String
    , solidStrong : String
    , solidText : String
    , textSubtle : String
    , text : String
    }



-- Colors : Light


{-| -}
gray : ThemeColorSet
gray =
    { bg = "#fcfcfc"
    , bgSubtle = "#f9f9f9"
    , tintSubtle = "#f0f0f0"
    , tint = "#e8e8e8"
    , tintStrong = "#e0e0e0"
    , detailSubtle = "#d9d9d9"
    , detail = "#cecece"
    , detailStrong = "#bbbbbb"
    , solid = "#8d8d8d"
    , solidSubtle = "#bbbbbb"
    , solidStrong = "#838383"
    , solidText = "#ffffff"
    , textSubtle = "#202020"
    , text = "#646464"
    }


{-| -}
mauve : ThemeColorSet
mauve =
    { bg = "#fdfcfd"
    , bgSubtle = "#faf9fb"
    , tintSubtle = "#f2eff3"
    , tint = "#eae7ec"
    , tintStrong = "#e3dfe6"
    , detailSubtle = "#dbd8e0"
    , detail = "#d0cdd7"
    , detailStrong = "#bcbac7"
    , solid = "#8e8c99"
    , solidSubtle = "#bcbac7"
    , solidStrong = "#84828e"
    , solidText = "#ffffff"
    , textSubtle = "#211f26"
    , text = "#65636d"
    }


{-| -}
slate : ThemeColorSet
slate =
    { bg = "#fcfcfd"
    , bgSubtle = "#f9f9fb"
    , tintSubtle = "#f0f0f3"
    , tint = "#e8e8ec"
    , tintStrong = "#e0e1e6"
    , detailSubtle = "#d9d9e0"
    , detail = "#cdced6"
    , detailStrong = "#b9bbc6"
    , solid = "#8b8d98"
    , solidSubtle = "#b9bbc6"
    , solidStrong = "#80838d"
    , solidText = "#ffffff"
    , textSubtle = "#1c2024"
    , text = "#60646c"
    }


{-| -}
sage : ThemeColorSet
sage =
    { bg = "#fbfdfc"
    , bgSubtle = "#f7f9f8"
    , tintSubtle = "#eef1f0"
    , tint = "#e6e9e8"
    , tintStrong = "#dfe2e0"
    , detailSubtle = "#d7dad9"
    , detail = "#cbcfcd"
    , detailStrong = "#b8bcba"
    , solid = "#868e8b"
    , solidSubtle = "#b8bcba"
    , solidStrong = "#7c8481"
    , solidText = "#ffffff"
    , textSubtle = "#1a211e"
    , text = "#5f6563"
    }


{-| -}
olive : ThemeColorSet
olive =
    { bg = "#fcfdfc"
    , bgSubtle = "#f8faf8"
    , tintSubtle = "#eff1ef"
    , tint = "#e7e9e7"
    , tintStrong = "#dfe2df"
    , detailSubtle = "#d7dad7"
    , detail = "#cccfcc"
    , detailStrong = "#b9bcb8"
    , solid = "#898e87"
    , solidSubtle = "#b9bcb8"
    , solidStrong = "#7f847d"
    , solidText = "#ffffff"
    , textSubtle = "#1d211c"
    , text = "#60655f"
    }


{-| -}
sand : ThemeColorSet
sand =
    { bg = "#fdfdfc"
    , bgSubtle = "#f9f9f8"
    , tintSubtle = "#f1f0ef"
    , tint = "#e9e8e6"
    , tintStrong = "#e2e1de"
    , detailSubtle = "#dad9d6"
    , detail = "#cfceca"
    , detailStrong = "#bcbbb5"
    , solid = "#8d8d86"
    , solidSubtle = "#bcbbb5"
    , solidStrong = "#82827c"
    , solidText = "#ffffff"
    , textSubtle = "#21201c"
    , text = "#63635e"
    }


{-| -}
tomato : ThemeColorSet
tomato =
    { bg = "#fffcfc"
    , bgSubtle = "#fff8f7"
    , tintSubtle = "#feebe7"
    , tint = "#ffdcd3"
    , tintStrong = "#ffcdc2"
    , detailSubtle = "#fdbdaf"
    , detail = "#f5a898"
    , detailStrong = "#ec8e7b"
    , solid = "#e54d2e"
    , solidSubtle = "#ec8e7b"
    , solidStrong = "#dd4425"
    , solidText = "#ffffff"
    , textSubtle = "#5c271f"
    , text = "#d13415"
    }


{-| -}
red : ThemeColorSet
red =
    { bg = "#fffcfc"
    , bgSubtle = "#fff7f7"
    , tintSubtle = "#feebec"
    , tint = "#ffdbdc"
    , tintStrong = "#ffcdce"
    , detailSubtle = "#fdbdbe"
    , detail = "#f4a9aa"
    , detailStrong = "#eb8e90"
    , solid = "#e5484d"
    , solidSubtle = "#eb8e90"
    , solidStrong = "#dc3e42"
    , solidText = "#ffffff"
    , textSubtle = "#641723"
    , text = "#ce2c31"
    }


{-| -}
ruby : ThemeColorSet
ruby =
    { bg = "#fffcfd"
    , bgSubtle = "#fff7f8"
    , tintSubtle = "#feeaed"
    , tint = "#ffdce1"
    , tintStrong = "#ffced6"
    , detailSubtle = "#f8bfc8"
    , detail = "#efacb8"
    , detailStrong = "#e592a3"
    , solid = "#e54666"
    , solidSubtle = "#e592a3"
    , solidStrong = "#dc3b5d"
    , solidText = "#ffffff"
    , textSubtle = "#64172b"
    , text = "#ca244d"
    }


{-| -}
crimson : ThemeColorSet
crimson =
    { bg = "#fffcfd"
    , bgSubtle = "#fef7f9"
    , tintSubtle = "#ffe9f0"
    , tint = "#fedce7"
    , tintStrong = "#facedd"
    , detailSubtle = "#f3bed1"
    , detail = "#eaacc3"
    , detailStrong = "#e093b2"
    , solid = "#e93d82"
    , solidSubtle = "#e093b2"
    , solidStrong = "#df3478"
    , solidText = "#ffffff"
    , textSubtle = "#621639"
    , text = "#cb1d63"
    }


{-| -}
pink : ThemeColorSet
pink =
    { bg = "#fffcfe"
    , bgSubtle = "#fef7fb"
    , tintSubtle = "#fee9f5"
    , tint = "#fbdcef"
    , tintStrong = "#f6cee7"
    , detailSubtle = "#efbfdd"
    , detail = "#e7acd0"
    , detailStrong = "#dd93c2"
    , solid = "#d6409f"
    , solidSubtle = "#dd93c2"
    , solidStrong = "#cf3897"
    , solidText = "#ffffff"
    , textSubtle = "#651249"
    , text = "#c2298a"
    }


{-| -}
plum : ThemeColorSet
plum =
    { bg = "#fefcff"
    , bgSubtle = "#fdf7fd"
    , tintSubtle = "#fbebfb"
    , tint = "#f7def8"
    , tintStrong = "#f2d1f3"
    , detailSubtle = "#e9c2ec"
    , detail = "#deade3"
    , detailStrong = "#cf91d8"
    , solid = "#ab4aba"
    , solidSubtle = "#cf91d8"
    , solidStrong = "#a144af"
    , solidText = "#ffffff"
    , textSubtle = "#53195d"
    , text = "#953ea3"
    }


{-| -}
purple : ThemeColorSet
purple =
    { bg = "#fefcfe"
    , bgSubtle = "#fbf7fe"
    , tintSubtle = "#f7edfe"
    , tint = "#f2e2fc"
    , tintStrong = "#ead5f9"
    , detailSubtle = "#e0c4f4"
    , detail = "#d1afec"
    , detailStrong = "#be93e4"
    , solid = "#8e4ec6"
    , solidSubtle = "#be93e4"
    , solidStrong = "#8347b9"
    , solidText = "#ffffff"
    , textSubtle = "#402060"
    , text = "#8145b5"
    }


{-| -}
violet : ThemeColorSet
violet =
    { bg = "#fdfcfe"
    , bgSubtle = "#faf8ff"
    , tintSubtle = "#f4f0fe"
    , tint = "#ebe4ff"
    , tintStrong = "#e1d9ff"
    , detailSubtle = "#d4cafe"
    , detail = "#c2b5f5"
    , detailStrong = "#aa99ec"
    , solid = "#6e56cf"
    , solidSubtle = "#aa99ec"
    , solidStrong = "#654dc4"
    , solidText = "#ffffff"
    , textSubtle = "#2f265f"
    , text = "#6550b9"
    }


{-| -}
iris : ThemeColorSet
iris =
    { bg = "#fdfdff"
    , bgSubtle = "#f8f8ff"
    , tintSubtle = "#f0f1fe"
    , tint = "#e6e7ff"
    , tintStrong = "#dadcff"
    , detailSubtle = "#cbcdff"
    , detail = "#b8baf8"
    , detailStrong = "#9b9ef0"
    , solid = "#5b5bd6"
    , solidSubtle = "#9b9ef0"
    , solidStrong = "#5151cd"
    , solidText = "#ffffff"
    , textSubtle = "#272962"
    , text = "#5753c6"
    }


{-| -}
indigo : ThemeColorSet
indigo =
    { bg = "#fdfdfe"
    , bgSubtle = "#f7f9ff"
    , tintSubtle = "#edf2fe"
    , tint = "#e1e9ff"
    , tintStrong = "#d2deff"
    , detailSubtle = "#c1d0ff"
    , detail = "#abbdf9"
    , detailStrong = "#8da4ef"
    , solid = "#3e63dd"
    , solidSubtle = "#8da4ef"
    , solidStrong = "#3358d4"
    , solidText = "#ffffff"
    , textSubtle = "#1f2d5c"
    , text = "#3a5bc7"
    }


{-| -}
blue : ThemeColorSet
blue =
    { bg = "#fbfdff"
    , bgSubtle = "#f4faff"
    , tintSubtle = "#e6f4fe"
    , tint = "#d5efff"
    , tintStrong = "#c2e5ff"
    , detailSubtle = "#acd8fc"
    , detail = "#8ec8f6"
    , detailStrong = "#5eb1ef"
    , solid = "#0090ff"
    , solidSubtle = "#5eb1ef"
    , solidStrong = "#0588f0"
    , solidText = "#ffffff"
    , textSubtle = "#113264"
    , text = "#0d74ce"
    }


{-| -}
steel : ThemeColorSet
steel =
    { bg = "#fbfcfd"
    , bgSubtle = "#f7f9fb"
    , tintSubtle = "#ecf1f5"
    , tint = "#e2eaef"
    , tintStrong = "#d9e2e9"
    , detailSubtle = "#cedae3"
    , detail = "#bfced9"
    , detailStrong = "#a7bbca"
    , solid = "#4e616f"
    , solidSubtle = "#a7bbca"
    , solidStrong = "#5b6f7d"
    , solidText = "#ffffff"
    , textSubtle = "#1b262d"
    , text = "#546876"
    }


{-| -}
steelDark : ThemeColorSet
steelDark =
    { bgSubtle = "#0f1114"
    , bg = "#16191c"
    , tintSubtle = "#1e2428"
    , tint = "#232c32"
    , tintStrong = "#2a343b"
    , detailSubtle = "#323d45"
    , detail = "#3e4c56"
    , detailStrong = "#536573"
    , solid = "#4f616e"
    , solidSubtle = "#536573"
    , solidStrong = "#5b6f7d"
    , solidText = "#ffffff"
    , textSubtle = "#e6eef3"
    , text = "#a6b7c3"
    }


{-| -}
cyan : ThemeColorSet
cyan =
    { bg = "#fafdfe"
    , bgSubtle = "#f2fafb"
    , tintSubtle = "#def7f9"
    , tint = "#caf1f6"
    , tintStrong = "#b5e9f0"
    , detailSubtle = "#9ddde7"
    , detail = "#7dcedc"
    , detailStrong = "#3db9cf"
    , solid = "#00a2c7"
    , solidSubtle = "#3db9cf"
    , solidStrong = "#0797b9"
    , solidText = "#ffffff"
    , textSubtle = "#0d3c48"
    , text = "#107d98"
    }


{-| -}
teal : ThemeColorSet
teal =
    { bg = "#fafefd"
    , bgSubtle = "#f3fbf9"
    , tintSubtle = "#e0f8f3"
    , tint = "#ccf3ea"
    , tintStrong = "#b8eae0"
    , detailSubtle = "#a1ded2"
    , detail = "#83cdc1"
    , detailStrong = "#53b9ab"
    , solid = "#12a594"
    , solidSubtle = "#53b9ab"
    , solidStrong = "#0d9b8a"
    , solidText = "#ffffff"
    , textSubtle = "#0d3d38"
    , text = "#008573"
    }


{-| -}
jade : ThemeColorSet
jade =
    { bg = "#fbfefd"
    , bgSubtle = "#f4fbf7"
    , tintSubtle = "#e6f7ed"
    , tint = "#d6f1e3"
    , tintStrong = "#c3e9d7"
    , detailSubtle = "#acdec8"
    , detail = "#8bceb6"
    , detailStrong = "#56ba9f"
    , solid = "#29a383"
    , solidSubtle = "#56ba9f"
    , solidStrong = "#26997b"
    , solidText = "#ffffff"
    , textSubtle = "#1d3b31"
    , text = "#208368"
    }


{-| -}
green : ThemeColorSet
green =
    { bg = "#fbfefc"
    , bgSubtle = "#f4fbf6"
    , tintSubtle = "#e6f6eb"
    , tint = "#d6f1df"
    , tintStrong = "#c4e8d1"
    , detailSubtle = "#adddc0"
    , detail = "#8eceaa"
    , detailStrong = "#5bb98b"
    , solid = "#30a46c"
    , solidSubtle = "#5bb98b"
    , solidStrong = "#2b9a66"
    , solidText = "#ffffff"
    , textSubtle = "#193b2d"
    , text = "#218358"
    }


{-| -}
grass : ThemeColorSet
grass =
    { bg = "#fbfefb"
    , bgSubtle = "#f5fbf5"
    , tintSubtle = "#e9f6e9"
    , tint = "#daf1db"
    , tintStrong = "#c9e8ca"
    , detailSubtle = "#b2ddb5"
    , detail = "#94ce9a"
    , detailStrong = "#65ba74"
    , solid = "#46a758"
    , solidSubtle = "#65ba74"
    , solidStrong = "#3e9b4f"
    , solidText = "#ffffff"
    , textSubtle = "#203c25"
    , text = "#2a7e3b"
    }


{-| -}
brown : ThemeColorSet
brown =
    { bg = "#fefdfc"
    , bgSubtle = "#fcf9f6"
    , tintSubtle = "#f6eee7"
    , tint = "#f0e4d9"
    , tintStrong = "#ebdaca"
    , detailSubtle = "#e4cdb7"
    , detail = "#dcbc9f"
    , detailStrong = "#cea37e"
    , solid = "#ad7f58"
    , solidSubtle = "#cea37e"
    , solidStrong = "#a07553"
    , solidText = "#ffffff"
    , textSubtle = "#3e332e"
    , text = "#815e46"
    }


{-| -}
bronze : ThemeColorSet
bronze =
    { bg = "#fdfcfc"
    , bgSubtle = "#fdf7f5"
    , tintSubtle = "#f6edea"
    , tint = "#efe4df"
    , tintStrong = "#e7d9d3"
    , detailSubtle = "#dfcdc5"
    , detail = "#d3bcb3"
    , detailStrong = "#c2a499"
    , solid = "#a18072"
    , solidSubtle = "#c2a499"
    , solidStrong = "#957468"
    , solidText = "#ffffff"
    , textSubtle = "#43302b"
    , text = "#7d5e54"
    }


{-| -}
gold : ThemeColorSet
gold =
    { bg = "#fdfdfc"
    , bgSubtle = "#faf9f2"
    , tintSubtle = "#f2f0e7"
    , tint = "#eae6db"
    , tintStrong = "#e1dccf"
    , detailSubtle = "#d8d0bf"
    , detail = "#cbc0aa"
    , detailStrong = "#b9a88d"
    , solid = "#978365"
    , solidSubtle = "#b9a88d"
    , solidStrong = "#8c7a5e"
    , solidText = "#ffffff"
    , textSubtle = "#3b352b"
    , text = "#71624b"
    }


{-| -}
sky : ThemeColorSet
sky =
    { bg = "#f9feff"
    , bgSubtle = "#f1fafd"
    , tintSubtle = "#e1f6fd"
    , tint = "#d1f0fa"
    , tintStrong = "#bee7f5"
    , detailSubtle = "#a9daed"
    , detail = "#8dcae3"
    , detailStrong = "#60b3d7"
    , solid = "#7ce2fe"
    , solidSubtle = "#60b3d7"
    , solidStrong = "#74daf8"
    , solidText = "#0d141f"
    , textSubtle = "#1d3e56"
    , text = "#00749e"
    }


{-| -}
mint : ThemeColorSet
mint =
    { bg = "#f9fefd"
    , bgSubtle = "#f2fbf9"
    , tintSubtle = "#ddf9f2"
    , tint = "#c8f4e9"
    , tintStrong = "#b3ecde"
    , detailSubtle = "#9ce0d0"
    , detail = "#7ecfbd"
    , detailStrong = "#4cbba5"
    , solid = "#86ead4"
    , solidSubtle = "#4cbba5"
    , solidStrong = "#7de0cb"
    , solidText = "#0e1515"
    , textSubtle = "#16433c"
    , text = "#027864"
    }


{-| -}
lime : ThemeColorSet
lime =
    { bg = "#fbfdfa"
    , bgSubtle = "#f6fbf3"
    , tintSubtle = "#e6f9d9"
    , tint = "#d6f4c1"
    , tintStrong = "#c6ebaa"
    , detailSubtle = "#b4de94"
    , detail = "#9ecd7a"
    , detailStrong = "#81b952"
    , solid = "#a8f365"
    , solidSubtle = "#81b952"
    , solidStrong = "#9aea4c"
    , solidText = "#0e130b"
    , textSubtle = "#2f421f"
    , text = "#537e2d"
    }


{-| -}
yellow : ThemeColorSet
yellow =
    { bg = "#fdfdf9"
    , bgSubtle = "#fefce9"
    , tintSubtle = "#fffab8"
    , tint = "#fff394"
    , tintStrong = "#ffe770"
    , detailSubtle = "#f3d768"
    , detail = "#e4c767"
    , detailStrong = "#d5ae39"
    , solid = "#ffe629"
    , solidSubtle = "#d5ae39"
    , solidStrong = "#ffdc00"
    , solidText = "#473b1f"
    , textSubtle = "#473b1f"
    , text = "#9e6c00"
    }


{-| -}
amber : ThemeColorSet
amber =
    { bg = "#fefdfb"
    , bgSubtle = "#fefbe9"
    , tintSubtle = "#fff7c2"
    , tint = "#ffee9c"
    , tintStrong = "#fbe577"
    , detailSubtle = "#f3d673"
    , detail = "#e9c162"
    , detailStrong = "#e2a336"
    , solid = "#ffc53d"
    , solidSubtle = "#e2a336"
    , solidStrong = "#ffba18"
    , solidText = "#16120c"
    , textSubtle = "#4f3422"
    , text = "#ab6400"
    }


{-| -}
orange : ThemeColorSet
orange =
    { bg = "#fefcfb"
    , bgSubtle = "#fff7ed"
    , tintSubtle = "#ffefd6"
    , tint = "#ffdfb5"
    , tintStrong = "#ffd19a"
    , detailSubtle = "#ffc182"
    , detail = "#f5ae73"
    , detailStrong = "#ec9455"
    , solid = "#f76b15"
    , solidSubtle = "#ec9455"
    , solidStrong = "#ef5f00"
    , solidText = "#ffffff"
    , textSubtle = "#582d1d"
    , text = "#cc4e00"
    }



-- Colors : Dark


{-| -}
grayDark : ThemeColorSet
grayDark =
    { bgSubtle = "#111111"
    , bg = "#191919"
    , tintSubtle = "#222222"
    , tint = "#2a2a2a"
    , tintStrong = "#313131"
    , detailSubtle = "#3a3a3a"
    , detail = "#484848"
    , detailStrong = "#606060"
    , solid = "#6e6e6e"
    , solidSubtle = "#606060"
    , solidStrong = "#7b7b7b"
    , solidText = "#ffffff"
    , textSubtle = "#eeeeee"
    , text = "#b4b4b4"
    }


{-| -}
mauveDark : ThemeColorSet
mauveDark =
    { bgSubtle = "#121113"
    , bg = "#1a191b"
    , tintSubtle = "#232225"
    , tint = "#2b292d"
    , tintStrong = "#323035"
    , detailSubtle = "#3c393f"
    , detail = "#49474e"
    , detailStrong = "#625f69"
    , solid = "#6f6d78"
    , solidSubtle = "#625f69"
    , solidStrong = "#7c7a85"
    , solidText = "#ffffff"
    , textSubtle = "#eeeef0"
    , text = "#b5b2bc"
    }


{-| -}
slateDark : ThemeColorSet
slateDark =
    { bgSubtle = "#111113"
    , bg = "#18191b"
    , tintSubtle = "#212225"
    , tint = "#272a2d"
    , tintStrong = "#2e3135"
    , detailSubtle = "#363a3f"
    , detail = "#43484e"
    , detailStrong = "#5a6169"
    , solid = "#696e77"
    , solidSubtle = "#5a6169"
    , solidStrong = "#777b84"
    , solidText = "#ffffff"
    , textSubtle = "#edeef0"
    , text = "#b0b4ba"
    }


{-| -}
sageDark : ThemeColorSet
sageDark =
    { bgSubtle = "#101211"
    , bg = "#171918"
    , tintSubtle = "#202221"
    , tint = "#272a29"
    , tintStrong = "#2e3130"
    , detailSubtle = "#373b39"
    , detail = "#444947"
    , detailStrong = "#5b625f"
    , solid = "#63706b"
    , solidSubtle = "#5b625f"
    , solidStrong = "#717d79"
    , solidText = "#ffffff"
    , textSubtle = "#eceeed"
    , text = "#adb5b2"
    }


{-| -}
oliveDark : ThemeColorSet
oliveDark =
    { bgSubtle = "#111210"
    , bg = "#181917"
    , tintSubtle = "#212220"
    , tint = "#282a27"
    , tintStrong = "#2f312e"
    , detailSubtle = "#383a36"
    , detail = "#454843"
    , detailStrong = "#5c625b"
    , solid = "#687066"
    , solidSubtle = "#5c625b"
    , solidStrong = "#767d74"
    , solidText = "#ffffff"
    , textSubtle = "#eceeec"
    , text = "#afb5ad"
    }


{-| -}
sandDark : ThemeColorSet
sandDark =
    { bgSubtle = "#111110"
    , bg = "#191918"
    , tintSubtle = "#222221"
    , tint = "#2a2a28"
    , tintStrong = "#31312e"
    , detailSubtle = "#3b3a37"
    , detail = "#494844"
    , detailStrong = "#62605b"
    , solid = "#6f6d66"
    , solidSubtle = "#62605b"
    , solidStrong = "#7c7b74"
    , solidText = "#ffffff"
    , textSubtle = "#eeeeec"
    , text = "#b5b3ad"
    }


{-| -}
tomatoDark : ThemeColorSet
tomatoDark =
    { bgSubtle = "#181111"
    , bg = "#1f1513"
    , tintSubtle = "#391714"
    , tint = "#4e1511"
    , tintStrong = "#5e1c16"
    , detailSubtle = "#6e2920"
    , detail = "#853a2d"
    , detailStrong = "#ac4d39"
    , solid = "#e54d2e"
    , solidSubtle = "#ac4d39"
    , solidStrong = "#ec6142"
    , solidText = "#ffffff"
    , textSubtle = "#fbd3cb"
    , text = "#ff977d"
    }


{-| -}
redDark : ThemeColorSet
redDark =
    { bgSubtle = "#191111"
    , bg = "#201314"
    , tintSubtle = "#3b1219"
    , tint = "#500f1c"
    , tintStrong = "#611623"
    , detailSubtle = "#72232d"
    , detail = "#8c333a"
    , detailStrong = "#b54548"
    , solid = "#e5484d"
    , solidSubtle = "#b54548"
    , solidStrong = "#ec5d5e"
    , solidText = "#ffffff"
    , textSubtle = "#ffd1d9"
    , text = "#ff9592"
    }


{-| -}
rubyDark : ThemeColorSet
rubyDark =
    { bgSubtle = "#191113"
    , bg = "#1e1517"
    , tintSubtle = "#3a141e"
    , tint = "#4e1325"
    , tintStrong = "#5e1a2e"
    , detailSubtle = "#6f2539"
    , detail = "#883447"
    , detailStrong = "#b3445a"
    , solid = "#e54666"
    , solidSubtle = "#b3445a"
    , solidStrong = "#ec5a72"
    , solidText = "#ffffff"
    , textSubtle = "#fed2e1"
    , text = "#ff949d"
    }


{-| -}
crimsonDark : ThemeColorSet
crimsonDark =
    { bgSubtle = "#191114"
    , bg = "#201318"
    , tintSubtle = "#381525"
    , tint = "#4d122f"
    , tintStrong = "#5c1839"
    , detailSubtle = "#6d2545"
    , detail = "#873356"
    , detailStrong = "#b0436e"
    , solid = "#e93d82"
    , solidSubtle = "#b0436e"
    , solidStrong = "#ee518a"
    , solidText = "#ffffff"
    , textSubtle = "#fdd3e8"
    , text = "#ff92ad"
    }


{-| -}
pinkDark : ThemeColorSet
pinkDark =
    { bgSubtle = "#191117"
    , bg = "#21121d"
    , tintSubtle = "#37172f"
    , tint = "#4b143d"
    , tintStrong = "#591c47"
    , detailSubtle = "#692955"
    , detail = "#833869"
    , detailStrong = "#a84885"
    , solid = "#d6409f"
    , solidSubtle = "#a84885"
    , solidStrong = "#de51a8"
    , solidText = "#ffffff"
    , textSubtle = "#fdd1ea"
    , text = "#ff8dcc"
    }


{-| -}
plumDark : ThemeColorSet
plumDark =
    { bgSubtle = "#181118"
    , bg = "#201320"
    , tintSubtle = "#351a35"
    , tint = "#451d47"
    , tintStrong = "#512454"
    , detailSubtle = "#5e3061"
    , detail = "#734079"
    , detailStrong = "#92549c"
    , solid = "#ab4aba"
    , solidSubtle = "#92549c"
    , solidStrong = "#b658c4"
    , solidText = "#ffffff"
    , textSubtle = "#f4d4f4"
    , text = "#e796f3"
    }


{-| -}
purpleDark : ThemeColorSet
purpleDark =
    { bgSubtle = "#18111b"
    , bg = "#1e1523"
    , tintSubtle = "#301c3b"
    , tint = "#3d224e"
    , tintStrong = "#48295c"
    , detailSubtle = "#54346b"
    , detail = "#664282"
    , detailStrong = "#8457aa"
    , solid = "#8e4ec6"
    , solidSubtle = "#8457aa"
    , solidStrong = "#9a5cd0"
    , solidText = "#ffffff"
    , textSubtle = "#ecd9fa"
    , text = "#d19dff"
    }


{-| -}
violetDark : ThemeColorSet
violetDark =
    { bgSubtle = "#14121f"
    , bg = "#1b1525"
    , tintSubtle = "#291f43"
    , tint = "#33255b"
    , tintStrong = "#3c2e69"
    , detailSubtle = "#473876"
    , detail = "#56468b"
    , detailStrong = "#6958ad"
    , solid = "#6e56cf"
    , solidSubtle = "#6958ad"
    , solidStrong = "#7d66d9"
    , solidText = "#ffffff"
    , textSubtle = "#e2ddfe"
    , text = "#baa7ff"
    }


{-| -}
irisDark : ThemeColorSet
irisDark =
    { bgSubtle = "#13131e"
    , bg = "#171625"
    , tintSubtle = "#202248"
    , tint = "#262a65"
    , tintStrong = "#303374"
    , detailSubtle = "#3d3e82"
    , detail = "#4a4a95"
    , detailStrong = "#5958b1"
    , solid = "#5b5bd6"
    , solidSubtle = "#5958b1"
    , solidStrong = "#6e6ade"
    , solidText = "#ffffff"
    , textSubtle = "#e0dffe"
    , text = "#b1a9ff"
    }


{-| -}
indigoDark : ThemeColorSet
indigoDark =
    { bgSubtle = "#11131f"
    , bg = "#141726"
    , tintSubtle = "#182449"
    , tint = "#1d2e62"
    , tintStrong = "#253974"
    , detailSubtle = "#304384"
    , detail = "#3a4f97"
    , detailStrong = "#435db1"
    , solid = "#3e63dd"
    , solidSubtle = "#435db1"
    , solidStrong = "#5472e4"
    , solidText = "#ffffff"
    , textSubtle = "#d6e1ff"
    , text = "#9eb1ff"
    }


{-| -}
blueDark : ThemeColorSet
blueDark =
    { bgSubtle = "#0d1520"
    , bg = "#111927"
    , tintSubtle = "#0d2847"
    , tint = "#003362"
    , tintStrong = "#004074"
    , detailSubtle = "#104d87"
    , detail = "#205d9e"
    , detailStrong = "#2870bd"
    , solid = "#0090ff"
    , solidSubtle = "#2870bd"
    , solidStrong = "#3b9eff"
    , solidText = "#ffffff"
    , textSubtle = "#c2e6ff"
    , text = "#70b8ff"
    }


{-| -}
cyanDark : ThemeColorSet
cyanDark =
    { bgSubtle = "#0b161a"
    , bg = "#101b20"
    , tintSubtle = "#082c36"
    , tint = "#003848"
    , tintStrong = "#004558"
    , detailSubtle = "#045468"
    , detail = "#12677e"
    , detailStrong = "#11809c"
    , solid = "#00a2c7"
    , solidSubtle = "#11809c"
    , solidStrong = "#23afd0"
    , solidText = "#ffffff"
    , textSubtle = "#b6ecf7"
    , text = "#4ccce6"
    }


{-| -}
tealDark : ThemeColorSet
tealDark =
    { bgSubtle = "#0d1514"
    , bg = "#111c1b"
    , tintSubtle = "#0d2d2a"
    , tint = "#023b37"
    , tintStrong = "#084843"
    , detailSubtle = "#145750"
    , detail = "#1c6961"
    , detailStrong = "#207e73"
    , solid = "#12a594"
    , solidSubtle = "#207e73"
    , solidStrong = "#0eb39e"
    , solidText = "#ffffff"
    , textSubtle = "#adf0dd"
    , text = "#0bd8b6"
    }


{-| -}
jadeDark : ThemeColorSet
jadeDark =
    { bgSubtle = "#0d1512"
    , bg = "#121c18"
    , tintSubtle = "#0f2e22"
    , tint = "#0b3b2c"
    , tintStrong = "#114837"
    , detailSubtle = "#1b5745"
    , detail = "#246854"
    , detailStrong = "#2a7e68"
    , solid = "#29a383"
    , solidSubtle = "#2a7e68"
    , solidStrong = "#27b08b"
    , solidText = "#ffffff"
    , textSubtle = "#adf0d4"
    , text = "#1fd8a4"
    }


{-| -}
greenDark : ThemeColorSet
greenDark =
    { bgSubtle = "#0e1512"
    , bg = "#121b17"
    , tintSubtle = "#132d21"
    , tint = "#113b29"
    , tintStrong = "#174933"
    , detailSubtle = "#20573e"
    , detail = "#28684a"
    , detailStrong = "#2f7c57"
    , solid = "#30a46c"
    , solidSubtle = "#2f7c57"
    , solidStrong = "#33b074"
    , solidText = "#ffffff"
    , textSubtle = "#b1f1cb"
    , text = "#3dd68c"
    }


{-| -}
grassDark : ThemeColorSet
grassDark =
    { bgSubtle = "#0e1511"
    , bg = "#141a15"
    , tintSubtle = "#1b2a1e"
    , tint = "#1d3a24"
    , tintStrong = "#25482d"
    , detailSubtle = "#2d5736"
    , detail = "#366740"
    , detailStrong = "#3e7949"
    , solid = "#46a758"
    , solidSubtle = "#3e7949"
    , solidStrong = "#53b365"
    , solidText = "#ffffff"
    , textSubtle = "#c2f0c2"
    , text = "#71d083"
    }


{-| -}
brownDark : ThemeColorSet
brownDark =
    { bgSubtle = "#12110f"
    , bg = "#1c1816"
    , tintSubtle = "#28211d"
    , tint = "#322922"
    , tintStrong = "#3e3128"
    , detailSubtle = "#4d3c2f"
    , detail = "#614a39"
    , detailStrong = "#7c5f46"
    , solid = "#ad7f58"
    , solidSubtle = "#7c5f46"
    , solidStrong = "#b88c67"
    , solidText = "#ffffff"
    , textSubtle = "#f2e1ca"
    , text = "#dbb594"
    }


{-| -}
bronzeDark : ThemeColorSet
bronzeDark =
    { bgSubtle = "#141110"
    , bg = "#1c1917"
    , tintSubtle = "#262220"
    , tint = "#302a27"
    , tintStrong = "#3b3330"
    , detailSubtle = "#493e3a"
    , detail = "#5a4c47"
    , detailStrong = "#6f5f58"
    , solid = "#a18072"
    , solidSubtle = "#6f5f58"
    , solidStrong = "#ae8c7e"
    , solidText = "#ffffff"
    , textSubtle = "#ede0d9"
    , text = "#d4b3a5"
    }


{-| -}
goldDark : ThemeColorSet
goldDark =
    { bgSubtle = "#121211"
    , bg = "#1b1a17"
    , tintSubtle = "#24231f"
    , tint = "#2d2b26"
    , tintStrong = "#38352e"
    , detailSubtle = "#444039"
    , detail = "#544f46"
    , detailStrong = "#696256"
    , solid = "#978365"
    , solidSubtle = "#696256"
    , solidStrong = "#a39073"
    , solidText = "#ffffff"
    , textSubtle = "#e8e2d9"
    , text = "#cbb99f"
    }


{-| -}
skyDark : ThemeColorSet
skyDark =
    { bgSubtle = "#0d141f"
    , bg = "#111a27"
    , tintSubtle = "#112840"
    , tint = "#113555"
    , tintStrong = "#154467"
    , detailSubtle = "#1b537b"
    , detail = "#1f6692"
    , detailStrong = "#197cae"
    , solid = "#7ce2fe"
    , solidSubtle = "#197cae"
    , solidStrong = "#a8eeff"
    , solidText = "#0d141f"
    , textSubtle = "#c2f3ff"
    , text = "#75c7f0"
    }


{-| -}
mintDark : ThemeColorSet
mintDark =
    { bgSubtle = "#0e1515"
    , bg = "#0f1b1b"
    , tintSubtle = "#092c2b"
    , tint = "#003a38"
    , tintStrong = "#004744"
    , detailSubtle = "#105650"
    , detail = "#1e685f"
    , detailStrong = "#277f70"
    , solid = "#86ead4"
    , solidSubtle = "#277f70"
    , solidStrong = "#a8f5e5"
    , solidText = "#0e1515"
    , textSubtle = "#c4f5e1"
    , text = "#58d5ba"
    }


{-| -}
limeDark : ThemeColorSet
limeDark =
    { bgSubtle = "#0e130b"
    , bg = "#141a10"
    , tintSubtle = "#1e2a15"
    , tint = "#263818"
    , tintStrong = "#2f461c"
    , detailSubtle = "#395421"
    , detail = "#446527"
    , detailStrong = "#50782c"
    , solid = "#96e647"
    , solidSubtle = "#50782c"
    , solidStrong = "#8cdb3a"
    , solidText = "#0e130b"
    , textSubtle = "#d2f9b6"
    , text = "#9ee65d"
    }


{-| -}
yellowDark : ThemeColorSet
yellowDark =
    { bgSubtle = "#14120b"
    , bg = "#1b180f"
    , tintSubtle = "#2d2305"
    , tint = "#362b00"
    , tintStrong = "#433500"
    , detailSubtle = "#524202"
    , detail = "#665417"
    , detailStrong = "#836a21"
    , solid = "#ffe629"
    , solidSubtle = "#836a21"
    , solidStrong = "#ffff57"
    , solidText = "#14120b"
    , textSubtle = "#f6eeb4"
    , text = "#f5e147"
    }


{-| -}
amberDark : ThemeColorSet
amberDark =
    { bgSubtle = "#16120c"
    , bg = "#1d180f"
    , tintSubtle = "#302008"
    , tint = "#3f2700"
    , tintStrong = "#4d3000"
    , detailSubtle = "#5c3d05"
    , detail = "#714f19"
    , detailStrong = "#8f6424"
    , solid = "#ffc53d"
    , solidSubtle = "#8f6424"
    , solidStrong = "#ffd60a"
    , solidText = "#16120c"
    , textSubtle = "#ffe7b3"
    , text = "#ffca16"
    }


{-| -}
orangeDark : ThemeColorSet
orangeDark =
    { bgSubtle = "#17120e"
    , bg = "#1e160f"
    , tintSubtle = "#331e0b"
    , tint = "#462100"
    , tintStrong = "#562800"
    , detailSubtle = "#66350c"
    , detail = "#7e451d"
    , detailStrong = "#a35829"
    , solid = "#f76b15"
    , solidSubtle = "#a35829"
    , solidStrong = "#ff801f"
    , solidText = "#ffffff"
    , textSubtle = "#ffe0c2"
    , text = "#ffa057"
    }
