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

@docs ThemeColorSet
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
    , tintSubtle : String
    , tint : String
    , tintHover : String
    , tintActive : String
    , borderSubtle : String
    , border : String
    , borderHover : String
    , solid : String
    , solidHover : String
    , solidActive : String
    , solidText : String
    , textSubtle : String
    , text : String
    }



-- Colors : Light


{-| -}
gray : ThemeColorSet
gray =
    { bg = "#fcfcfc"
    , tintSubtle = "#f9f9f9"
    , tint = "#f0f0f0"
    , tintHover = "#e8e8e8"
    , tintActive = "#e0e0e0"
    , borderSubtle = "#d9d9d9"
    , border = "#cecece"
    , borderHover = "#bbbbbb"
    , solid = "#838383"
    , solidHover = "#8d8d8d"
    , solidActive = "#8d8d8d"
    , solidText = "#ffffff"
    , textSubtle = "#646464"
    , text = "#202020"
    }


{-| -}
mauve : ThemeColorSet
mauve =
    { bg = "#fdfcfd"
    , tintSubtle = "#faf9fb"
    , tint = "#f2eff3"
    , tintHover = "#eae7ec"
    , tintActive = "#e3dfe6"
    , borderSubtle = "#dbd8e0"
    , border = "#d0cdd7"
    , borderHover = "#bcbac7"
    , solid = "#84828e"
    , solidHover = "#8e8c99"
    , solidActive = "#8e8c99"
    , solidText = "#ffffff"
    , textSubtle = "#65636d"
    , text = "#211f26"
    }


{-| -}
slate : ThemeColorSet
slate =
    { bg = "#fcfcfd"
    , tintSubtle = "#f9f9fb"
    , tint = "#f0f0f3"
    , tintHover = "#e8e8ec"
    , tintActive = "#e0e1e6"
    , borderSubtle = "#d9d9e0"
    , border = "#cdced6"
    , borderHover = "#b9bbc6"
    , solid = "#80838d"
    , solidHover = "#8b8d98"
    , solidActive = "#8b8d98"
    , solidText = "#ffffff"
    , textSubtle = "#60646c"
    , text = "#1c2024"
    }


{-| -}
sage : ThemeColorSet
sage =
    { bg = "#fbfdfc"
    , tintSubtle = "#f7f9f8"
    , tint = "#eef1f0"
    , tintHover = "#e6e9e8"
    , tintActive = "#dfe2e0"
    , borderSubtle = "#d7dad9"
    , border = "#cbcfcd"
    , borderHover = "#b8bcba"
    , solid = "#7c8481"
    , solidHover = "#868e8b"
    , solidActive = "#868e8b"
    , solidText = "#ffffff"
    , textSubtle = "#5f6563"
    , text = "#1a211e"
    }


{-| -}
olive : ThemeColorSet
olive =
    { bg = "#fcfdfc"
    , tintSubtle = "#f8faf8"
    , tint = "#eff1ef"
    , tintHover = "#e7e9e7"
    , tintActive = "#dfe2df"
    , borderSubtle = "#d7dad7"
    , border = "#cccfcc"
    , borderHover = "#b9bcb8"
    , solid = "#7f847d"
    , solidHover = "#898e87"
    , solidActive = "#898e87"
    , solidText = "#ffffff"
    , textSubtle = "#60655f"
    , text = "#1d211c"
    }


{-| -}
sand : ThemeColorSet
sand =
    { bg = "#fdfdfc"
    , tintSubtle = "#f9f9f8"
    , tint = "#f1f0ef"
    , tintHover = "#e9e8e6"
    , tintActive = "#e2e1de"
    , borderSubtle = "#dad9d6"
    , border = "#cfceca"
    , borderHover = "#bcbbb5"
    , solid = "#82827c"
    , solidHover = "#8d8d86"
    , solidActive = "#8d8d86"
    , solidText = "#ffffff"
    , textSubtle = "#63635e"
    , text = "#21201c"
    }


{-| -}
tomato : ThemeColorSet
tomato =
    { bg = "#fffcfc"
    , tintSubtle = "#fff8f7"
    , tint = "#feebe7"
    , tintHover = "#ffdcd3"
    , tintActive = "#ffcdc2"
    , borderSubtle = "#fdbdaf"
    , border = "#f5a898"
    , borderHover = "#ec8e7b"
    , solid = "#dd4425"
    , solidHover = "#e54d2e"
    , solidActive = "#e54d2e"
    , solidText = "#ffffff"
    , textSubtle = "#d13415"
    , text = "#5c271f"
    }


{-| -}
red : ThemeColorSet
red =
    { bg = "#fffcfc"
    , tintSubtle = "#fff7f7"
    , tint = "#feebec"
    , tintHover = "#ffdbdc"
    , tintActive = "#ffcdce"
    , borderSubtle = "#fdbdbe"
    , border = "#f4a9aa"
    , borderHover = "#eb8e90"
    , solid = "#dc3e42"
    , solidHover = "#e5484d"
    , solidActive = "#e5484d"
    , solidText = "#ffffff"
    , textSubtle = "#ce2c31"
    , text = "#641723"
    }


{-| -}
ruby : ThemeColorSet
ruby =
    { bg = "#fffcfd"
    , tintSubtle = "#fff7f8"
    , tint = "#feeaed"
    , tintHover = "#ffdce1"
    , tintActive = "#ffced6"
    , borderSubtle = "#f8bfc8"
    , border = "#efacb8"
    , borderHover = "#e592a3"
    , solid = "#dc3b5d"
    , solidHover = "#e54666"
    , solidActive = "#e54666"
    , solidText = "#ffffff"
    , textSubtle = "#ca244d"
    , text = "#64172b"
    }


{-| -}
crimson : ThemeColorSet
crimson =
    { bg = "#fffcfd"
    , tintSubtle = "#fef7f9"
    , tint = "#ffe9f0"
    , tintHover = "#fedce7"
    , tintActive = "#facedd"
    , borderSubtle = "#f3bed1"
    , border = "#eaacc3"
    , borderHover = "#e093b2"
    , solid = "#df3478"
    , solidHover = "#e93d82"
    , solidActive = "#e93d82"
    , solidText = "#ffffff"
    , textSubtle = "#cb1d63"
    , text = "#621639"
    }


{-| -}
pink : ThemeColorSet
pink =
    { bg = "#fffcfe"
    , tintSubtle = "#fef7fb"
    , tint = "#fee9f5"
    , tintHover = "#fbdcef"
    , tintActive = "#f6cee7"
    , borderSubtle = "#efbfdd"
    , border = "#e7acd0"
    , borderHover = "#dd93c2"
    , solid = "#cf3897"
    , solidHover = "#d6409f"
    , solidActive = "#d6409f"
    , solidText = "#ffffff"
    , textSubtle = "#c2298a"
    , text = "#651249"
    }


{-| -}
plum : ThemeColorSet
plum =
    { bg = "#fefcff"
    , tintSubtle = "#fdf7fd"
    , tint = "#fbebfb"
    , tintHover = "#f7def8"
    , tintActive = "#f2d1f3"
    , borderSubtle = "#e9c2ec"
    , border = "#deade3"
    , borderHover = "#cf91d8"
    , solid = "#a144af"
    , solidHover = "#ab4aba"
    , solidActive = "#ab4aba"
    , solidText = "#ffffff"
    , textSubtle = "#953ea3"
    , text = "#53195d"
    }


{-| -}
purple : ThemeColorSet
purple =
    { bg = "#fefcfe"
    , tintSubtle = "#fbf7fe"
    , tint = "#f7edfe"
    , tintHover = "#f2e2fc"
    , tintActive = "#ead5f9"
    , borderSubtle = "#e0c4f4"
    , border = "#d1afec"
    , borderHover = "#be93e4"
    , solid = "#8347b9"
    , solidHover = "#8e4ec6"
    , solidActive = "#8e4ec6"
    , solidText = "#ffffff"
    , textSubtle = "#8145b5"
    , text = "#402060"
    }


{-| -}
violet : ThemeColorSet
violet =
    { bg = "#fdfcfe"
    , tintSubtle = "#faf8ff"
    , tint = "#f4f0fe"
    , tintHover = "#ebe4ff"
    , tintActive = "#e1d9ff"
    , borderSubtle = "#d4cafe"
    , border = "#c2b5f5"
    , borderHover = "#aa99ec"
    , solid = "#654dc4"
    , solidHover = "#6e56cf"
    , solidActive = "#6e56cf"
    , solidText = "#ffffff"
    , textSubtle = "#6550b9"
    , text = "#2f265f"
    }


{-| -}
iris : ThemeColorSet
iris =
    { bg = "#fdfdff"
    , tintSubtle = "#f8f8ff"
    , tint = "#f0f1fe"
    , tintHover = "#e6e7ff"
    , tintActive = "#dadcff"
    , borderSubtle = "#cbcdff"
    , border = "#b8baf8"
    , borderHover = "#9b9ef0"
    , solid = "#5151cd"
    , solidHover = "#5b5bd6"
    , solidActive = "#5b5bd6"
    , solidText = "#ffffff"
    , textSubtle = "#5753c6"
    , text = "#272962"
    }


{-| -}
indigo : ThemeColorSet
indigo =
    { bg = "#fdfdfe"
    , tintSubtle = "#f7f9ff"
    , tint = "#edf2fe"
    , tintHover = "#e1e9ff"
    , tintActive = "#d2deff"
    , borderSubtle = "#c1d0ff"
    , border = "#abbdf9"
    , borderHover = "#8da4ef"
    , solid = "#3358d4"
    , solidHover = "#3e63dd"
    , solidActive = "#3e63dd"
    , solidText = "#ffffff"
    , textSubtle = "#3a5bc7"
    , text = "#1f2d5c"
    }


{-| -}
blue : ThemeColorSet
blue =
    { bg = "#fbfdff"
    , tintSubtle = "#f4faff"
    , tint = "#e6f4fe"
    , tintHover = "#d5efff"
    , tintActive = "#c2e5ff"
    , borderSubtle = "#acd8fc"
    , border = "#8ec8f6"
    , borderHover = "#5eb1ef"
    , solid = "#0588f0"
    , solidHover = "#0090ff"
    , solidActive = "#0090ff"
    , solidText = "#ffffff"
    , textSubtle = "#0d74ce"
    , text = "#113264"
    }


{-| -}
steel : ThemeColorSet
steel =
    { bg = "#fbfcfd"
    , tintSubtle = "#f7f9fb"
    , tint = "#ecf1f5"
    , tintHover = "#e2eaef"
    , tintActive = "#d9e2e9"
    , borderSubtle = "#cedae3"
    , border = "#bfced9"
    , borderHover = "#a7bbca"
    , solid = "#5b6f7d"
    , solidHover = "#4e616f"
    , solidActive = "#4e616f"
    , solidText = "#ffffff"
    , textSubtle = "#546876"
    , text = "#1b262d"
    }


{-| -}
steelDark : ThemeColorSet
steelDark =
    { bg = "#0f1114"
    , tintSubtle = "#16191c"
    , tint = "#1e2428"
    , tintHover = "#232c32"
    , tintActive = "#2a343b"
    , borderSubtle = "#323d45"
    , border = "#3e4c56"
    , borderHover = "#536573"
    , solid = "#5b6f7d"
    , solidHover = "#4f616e"
    , solidActive = "#4f616e"
    , solidText = "#ffffff"
    , textSubtle = "#a6b7c3"
    , text = "#e6eef3"
    }


{-| -}
cyan : ThemeColorSet
cyan =
    { bg = "#fafdfe"
    , tintSubtle = "#f2fafb"
    , tint = "#def7f9"
    , tintHover = "#caf1f6"
    , tintActive = "#b5e9f0"
    , borderSubtle = "#9ddde7"
    , border = "#7dcedc"
    , borderHover = "#3db9cf"
    , solid = "#0797b9"
    , solidHover = "#00a2c7"
    , solidActive = "#00a2c7"
    , solidText = "#ffffff"
    , textSubtle = "#107d98"
    , text = "#0d3c48"
    }


{-| -}
teal : ThemeColorSet
teal =
    { bg = "#fafefd"
    , tintSubtle = "#f3fbf9"
    , tint = "#e0f8f3"
    , tintHover = "#ccf3ea"
    , tintActive = "#b8eae0"
    , borderSubtle = "#a1ded2"
    , border = "#83cdc1"
    , borderHover = "#53b9ab"
    , solid = "#0d9b8a"
    , solidHover = "#12a594"
    , solidActive = "#12a594"
    , solidText = "#ffffff"
    , textSubtle = "#008573"
    , text = "#0d3d38"
    }


{-| -}
jade : ThemeColorSet
jade =
    { bg = "#fbfefd"
    , tintSubtle = "#f4fbf7"
    , tint = "#e6f7ed"
    , tintHover = "#d6f1e3"
    , tintActive = "#c3e9d7"
    , borderSubtle = "#acdec8"
    , border = "#8bceb6"
    , borderHover = "#56ba9f"
    , solid = "#26997b"
    , solidHover = "#29a383"
    , solidActive = "#29a383"
    , solidText = "#ffffff"
    , textSubtle = "#208368"
    , text = "#1d3b31"
    }


{-| -}
green : ThemeColorSet
green =
    { bg = "#fbfefc"
    , tintSubtle = "#f4fbf6"
    , tint = "#e6f6eb"
    , tintHover = "#d6f1df"
    , tintActive = "#c4e8d1"
    , borderSubtle = "#adddc0"
    , border = "#8eceaa"
    , borderHover = "#5bb98b"
    , solid = "#2b9a66"
    , solidHover = "#30a46c"
    , solidActive = "#30a46c"
    , solidText = "#ffffff"
    , textSubtle = "#218358"
    , text = "#193b2d"
    }


{-| -}
grass : ThemeColorSet
grass =
    { bg = "#fbfefb"
    , tintSubtle = "#f5fbf5"
    , tint = "#e9f6e9"
    , tintHover = "#daf1db"
    , tintActive = "#c9e8ca"
    , borderSubtle = "#b2ddb5"
    , border = "#94ce9a"
    , borderHover = "#65ba74"
    , solid = "#3e9b4f"
    , solidHover = "#46a758"
    , solidActive = "#46a758"
    , solidText = "#ffffff"
    , textSubtle = "#2a7e3b"
    , text = "#203c25"
    }


{-| -}
brown : ThemeColorSet
brown =
    { bg = "#fefdfc"
    , tintSubtle = "#fcf9f6"
    , tint = "#f6eee7"
    , tintHover = "#f0e4d9"
    , tintActive = "#ebdaca"
    , borderSubtle = "#e4cdb7"
    , border = "#dcbc9f"
    , borderHover = "#cea37e"
    , solid = "#a07553"
    , solidHover = "#ad7f58"
    , solidActive = "#ad7f58"
    , solidText = "#ffffff"
    , textSubtle = "#815e46"
    , text = "#3e332e"
    }


{-| -}
bronze : ThemeColorSet
bronze =
    { bg = "#fdfcfc"
    , tintSubtle = "#fdf7f5"
    , tint = "#f6edea"
    , tintHover = "#efe4df"
    , tintActive = "#e7d9d3"
    , borderSubtle = "#dfcdc5"
    , border = "#d3bcb3"
    , borderHover = "#c2a499"
    , solid = "#957468"
    , solidHover = "#a18072"
    , solidActive = "#a18072"
    , solidText = "#ffffff"
    , textSubtle = "#7d5e54"
    , text = "#43302b"
    }


{-| -}
gold : ThemeColorSet
gold =
    { bg = "#fdfdfc"
    , tintSubtle = "#faf9f2"
    , tint = "#f2f0e7"
    , tintHover = "#eae6db"
    , tintActive = "#e1dccf"
    , borderSubtle = "#d8d0bf"
    , border = "#cbc0aa"
    , borderHover = "#b9a88d"
    , solid = "#8c7a5e"
    , solidHover = "#978365"
    , solidActive = "#978365"
    , solidText = "#ffffff"
    , textSubtle = "#71624b"
    , text = "#3b352b"
    }


{-| -}
sky : ThemeColorSet
sky =
    { bg = "#f9feff"
    , tintSubtle = "#f1fafd"
    , tint = "#e1f6fd"
    , tintHover = "#d1f0fa"
    , tintActive = "#bee7f5"
    , borderSubtle = "#a9daed"
    , border = "#8dcae3"
    , borderHover = "#60b3d7"
    , solid = "#74daf8"
    , solidHover = "#7ce2fe"
    , solidActive = "#7ce2fe"
    , solidText = "#0d141f"
    , textSubtle = "#00749e"
    , text = "#1d3e56"
    }


{-| -}
mint : ThemeColorSet
mint =
    { bg = "#f9fefd"
    , tintSubtle = "#f2fbf9"
    , tint = "#ddf9f2"
    , tintHover = "#c8f4e9"
    , tintActive = "#b3ecde"
    , borderSubtle = "#9ce0d0"
    , border = "#7ecfbd"
    , borderHover = "#4cbba5"
    , solid = "#7de0cb"
    , solidHover = "#86ead4"
    , solidActive = "#86ead4"
    , solidText = "#0e1515"
    , textSubtle = "#027864"
    , text = "#16433c"
    }


{-| -}
lime : ThemeColorSet
lime =
    { bg = "#fbfdfa"
    , tintSubtle = "#f6fbf3"
    , tint = "#e6f9d9"
    , tintHover = "#d6f4c1"
    , tintActive = "#c6ebaa"
    , borderSubtle = "#b4de94"
    , border = "#9ecd7a"
    , borderHover = "#81b952"
    , solid = "#9aea4c"
    , solidHover = "#a8f365"
    , solidActive = "#a8f365"
    , solidText = "#0e130b"
    , textSubtle = "#537e2d"
    , text = "#2f421f"
    }


{-| -}
yellow : ThemeColorSet
yellow =
    { bg = "#fdfdf9"
    , tintSubtle = "#fefce9"
    , tint = "#fffab8"
    , tintHover = "#fff394"
    , tintActive = "#ffe770"
    , borderSubtle = "#f3d768"
    , border = "#e4c767"
    , borderHover = "#d5ae39"
    , solid = "#ffdc00"
    , solidHover = "#ffe629"
    , solidActive = "#ffe629"
    , solidText = "#473b1f"
    , textSubtle = "#9e6c00"
    , text = "#473b1f"
    }


{-| -}
amber : ThemeColorSet
amber =
    { bg = "#fefdfb"
    , tintSubtle = "#fefbe9"
    , tint = "#fff7c2"
    , tintHover = "#ffee9c"
    , tintActive = "#fbe577"
    , borderSubtle = "#f3d673"
    , border = "#e9c162"
    , borderHover = "#e2a336"
    , solid = "#ffba18"
    , solidHover = "#ffc53d"
    , solidActive = "#ffc53d"
    , solidText = "#16120c"
    , textSubtle = "#ab6400"
    , text = "#4f3422"
    }


{-| -}
orange : ThemeColorSet
orange =
    { bg = "#fefcfb"
    , tintSubtle = "#fff7ed"
    , tint = "#ffefd6"
    , tintHover = "#ffdfb5"
    , tintActive = "#ffd19a"
    , borderSubtle = "#ffc182"
    , border = "#f5ae73"
    , borderHover = "#ec9455"
    , solid = "#ef5f00"
    , solidHover = "#f76b15"
    , solidActive = "#f76b15"
    , solidText = "#ffffff"
    , textSubtle = "#cc4e00"
    , text = "#582d1d"
    }



-- Colors : Dark


{-| -}
grayDark : ThemeColorSet
grayDark =
    { bg = "#111111"
    , tintSubtle = "#191919"
    , tint = "#222222"
    , tintHover = "#2a2a2a"
    , tintActive = "#313131"
    , borderSubtle = "#3a3a3a"
    , border = "#484848"
    , borderHover = "#606060"
    , solid = "#7b7b7b"
    , solidHover = "#6e6e6e"
    , solidActive = "#6e6e6e"
    , solidText = "#ffffff"
    , textSubtle = "#b4b4b4"
    , text = "#eeeeee"
    }


{-| -}
mauveDark : ThemeColorSet
mauveDark =
    { bg = "#121113"
    , tintSubtle = "#1a191b"
    , tint = "#232225"
    , tintHover = "#2b292d"
    , tintActive = "#323035"
    , borderSubtle = "#3c393f"
    , border = "#49474e"
    , borderHover = "#625f69"
    , solid = "#7c7a85"
    , solidHover = "#6f6d78"
    , solidActive = "#6f6d78"
    , solidText = "#ffffff"
    , textSubtle = "#b5b2bc"
    , text = "#eeeef0"
    }


{-| -}
slateDark : ThemeColorSet
slateDark =
    { bg = "#111113"
    , tintSubtle = "#18191b"
    , tint = "#212225"
    , tintHover = "#272a2d"
    , tintActive = "#2e3135"
    , borderSubtle = "#363a3f"
    , border = "#43484e"
    , borderHover = "#5a6169"
    , solid = "#777b84"
    , solidHover = "#696e77"
    , solidActive = "#696e77"
    , solidText = "#ffffff"
    , textSubtle = "#b0b4ba"
    , text = "#edeef0"
    }


{-| -}
sageDark : ThemeColorSet
sageDark =
    { bg = "#101211"
    , tintSubtle = "#171918"
    , tint = "#202221"
    , tintHover = "#272a29"
    , tintActive = "#2e3130"
    , borderSubtle = "#373b39"
    , border = "#444947"
    , borderHover = "#5b625f"
    , solid = "#717d79"
    , solidHover = "#63706b"
    , solidActive = "#63706b"
    , solidText = "#ffffff"
    , textSubtle = "#adb5b2"
    , text = "#eceeed"
    }


{-| -}
oliveDark : ThemeColorSet
oliveDark =
    { bg = "#111210"
    , tintSubtle = "#181917"
    , tint = "#212220"
    , tintHover = "#282a27"
    , tintActive = "#2f312e"
    , borderSubtle = "#383a36"
    , border = "#454843"
    , borderHover = "#5c625b"
    , solid = "#767d74"
    , solidHover = "#687066"
    , solidActive = "#687066"
    , solidText = "#ffffff"
    , textSubtle = "#afb5ad"
    , text = "#eceeec"
    }


{-| -}
sandDark : ThemeColorSet
sandDark =
    { bg = "#111110"
    , tintSubtle = "#191918"
    , tint = "#222221"
    , tintHover = "#2a2a28"
    , tintActive = "#31312e"
    , borderSubtle = "#3b3a37"
    , border = "#494844"
    , borderHover = "#62605b"
    , solid = "#7c7b74"
    , solidHover = "#6f6d66"
    , solidActive = "#6f6d66"
    , solidText = "#ffffff"
    , textSubtle = "#b5b3ad"
    , text = "#eeeeec"
    }


{-| -}
tomatoDark : ThemeColorSet
tomatoDark =
    { bg = "#181111"
    , tintSubtle = "#1f1513"
    , tint = "#391714"
    , tintHover = "#4e1511"
    , tintActive = "#5e1c16"
    , borderSubtle = "#6e2920"
    , border = "#853a2d"
    , borderHover = "#ac4d39"
    , solid = "#ec6142"
    , solidHover = "#e54d2e"
    , solidActive = "#e54d2e"
    , solidText = "#ffffff"
    , textSubtle = "#ff977d"
    , text = "#fbd3cb"
    }


{-| -}
redDark : ThemeColorSet
redDark =
    { bg = "#191111"
    , tintSubtle = "#201314"
    , tint = "#3b1219"
    , tintHover = "#500f1c"
    , tintActive = "#611623"
    , borderSubtle = "#72232d"
    , border = "#8c333a"
    , borderHover = "#b54548"
    , solid = "#ec5d5e"
    , solidHover = "#e5484d"
    , solidActive = "#e5484d"
    , solidText = "#ffffff"
    , textSubtle = "#ff9592"
    , text = "#ffd1d9"
    }


{-| -}
rubyDark : ThemeColorSet
rubyDark =
    { bg = "#191113"
    , tintSubtle = "#1e1517"
    , tint = "#3a141e"
    , tintHover = "#4e1325"
    , tintActive = "#5e1a2e"
    , borderSubtle = "#6f2539"
    , border = "#883447"
    , borderHover = "#b3445a"
    , solid = "#ec5a72"
    , solidHover = "#e54666"
    , solidActive = "#e54666"
    , solidText = "#ffffff"
    , textSubtle = "#ff949d"
    , text = "#fed2e1"
    }


{-| -}
crimsonDark : ThemeColorSet
crimsonDark =
    { bg = "#191114"
    , tintSubtle = "#201318"
    , tint = "#381525"
    , tintHover = "#4d122f"
    , tintActive = "#5c1839"
    , borderSubtle = "#6d2545"
    , border = "#873356"
    , borderHover = "#b0436e"
    , solid = "#ee518a"
    , solidHover = "#e93d82"
    , solidActive = "#e93d82"
    , solidText = "#ffffff"
    , textSubtle = "#ff92ad"
    , text = "#fdd3e8"
    }


{-| -}
pinkDark : ThemeColorSet
pinkDark =
    { bg = "#191117"
    , tintSubtle = "#21121d"
    , tint = "#37172f"
    , tintHover = "#4b143d"
    , tintActive = "#591c47"
    , borderSubtle = "#692955"
    , border = "#833869"
    , borderHover = "#a84885"
    , solid = "#de51a8"
    , solidHover = "#d6409f"
    , solidActive = "#d6409f"
    , solidText = "#ffffff"
    , textSubtle = "#ff8dcc"
    , text = "#fdd1ea"
    }


{-| -}
plumDark : ThemeColorSet
plumDark =
    { bg = "#181118"
    , tintSubtle = "#201320"
    , tint = "#351a35"
    , tintHover = "#451d47"
    , tintActive = "#512454"
    , borderSubtle = "#5e3061"
    , border = "#734079"
    , borderHover = "#92549c"
    , solid = "#b658c4"
    , solidHover = "#ab4aba"
    , solidActive = "#ab4aba"
    , solidText = "#ffffff"
    , textSubtle = "#e796f3"
    , text = "#f4d4f4"
    }


{-| -}
purpleDark : ThemeColorSet
purpleDark =
    { bg = "#18111b"
    , tintSubtle = "#1e1523"
    , tint = "#301c3b"
    , tintHover = "#3d224e"
    , tintActive = "#48295c"
    , borderSubtle = "#54346b"
    , border = "#664282"
    , borderHover = "#8457aa"
    , solid = "#9a5cd0"
    , solidHover = "#8e4ec6"
    , solidActive = "#8e4ec6"
    , solidText = "#ffffff"
    , textSubtle = "#d19dff"
    , text = "#ecd9fa"
    }


{-| -}
violetDark : ThemeColorSet
violetDark =
    { bg = "#14121f"
    , tintSubtle = "#1b1525"
    , tint = "#291f43"
    , tintHover = "#33255b"
    , tintActive = "#3c2e69"
    , borderSubtle = "#473876"
    , border = "#56468b"
    , borderHover = "#6958ad"
    , solid = "#7d66d9"
    , solidHover = "#6e56cf"
    , solidActive = "#6e56cf"
    , solidText = "#ffffff"
    , textSubtle = "#baa7ff"
    , text = "#e2ddfe"
    }


{-| -}
irisDark : ThemeColorSet
irisDark =
    { bg = "#13131e"
    , tintSubtle = "#171625"
    , tint = "#202248"
    , tintHover = "#262a65"
    , tintActive = "#303374"
    , borderSubtle = "#3d3e82"
    , border = "#4a4a95"
    , borderHover = "#5958b1"
    , solid = "#6e6ade"
    , solidHover = "#5b5bd6"
    , solidActive = "#5b5bd6"
    , solidText = "#ffffff"
    , textSubtle = "#b1a9ff"
    , text = "#e0dffe"
    }


{-| -}
indigoDark : ThemeColorSet
indigoDark =
    { bg = "#11131f"
    , tintSubtle = "#141726"
    , tint = "#182449"
    , tintHover = "#1d2e62"
    , tintActive = "#253974"
    , borderSubtle = "#304384"
    , border = "#3a4f97"
    , borderHover = "#435db1"
    , solid = "#5472e4"
    , solidHover = "#3e63dd"
    , solidActive = "#3e63dd"
    , solidText = "#ffffff"
    , textSubtle = "#9eb1ff"
    , text = "#d6e1ff"
    }


{-| -}
blueDark : ThemeColorSet
blueDark =
    { bg = "#0d1520"
    , tintSubtle = "#111927"
    , tint = "#0d2847"
    , tintHover = "#003362"
    , tintActive = "#004074"
    , borderSubtle = "#104d87"
    , border = "#205d9e"
    , borderHover = "#2870bd"
    , solid = "#3b9eff"
    , solidHover = "#0090ff"
    , solidActive = "#0090ff"
    , solidText = "#ffffff"
    , textSubtle = "#70b8ff"
    , text = "#c2e6ff"
    }


{-| -}
cyanDark : ThemeColorSet
cyanDark =
    { bg = "#0b161a"
    , tintSubtle = "#101b20"
    , tint = "#082c36"
    , tintHover = "#003848"
    , tintActive = "#004558"
    , borderSubtle = "#045468"
    , border = "#12677e"
    , borderHover = "#11809c"
    , solid = "#23afd0"
    , solidHover = "#00a2c7"
    , solidActive = "#00a2c7"
    , solidText = "#ffffff"
    , textSubtle = "#4ccce6"
    , text = "#b6ecf7"
    }


{-| -}
tealDark : ThemeColorSet
tealDark =
    { bg = "#0d1514"
    , tintSubtle = "#111c1b"
    , tint = "#0d2d2a"
    , tintHover = "#023b37"
    , tintActive = "#084843"
    , borderSubtle = "#145750"
    , border = "#1c6961"
    , borderHover = "#207e73"
    , solid = "#0eb39e"
    , solidHover = "#12a594"
    , solidActive = "#12a594"
    , solidText = "#ffffff"
    , textSubtle = "#0bd8b6"
    , text = "#adf0dd"
    }


{-| -}
jadeDark : ThemeColorSet
jadeDark =
    { bg = "#0d1512"
    , tintSubtle = "#121c18"
    , tint = "#0f2e22"
    , tintHover = "#0b3b2c"
    , tintActive = "#114837"
    , borderSubtle = "#1b5745"
    , border = "#246854"
    , borderHover = "#2a7e68"
    , solid = "#27b08b"
    , solidHover = "#29a383"
    , solidActive = "#29a383"
    , solidText = "#ffffff"
    , textSubtle = "#1fd8a4"
    , text = "#adf0d4"
    }


{-| -}
greenDark : ThemeColorSet
greenDark =
    { bg = "#0e1512"
    , tintSubtle = "#121b17"
    , tint = "#132d21"
    , tintHover = "#113b29"
    , tintActive = "#174933"
    , borderSubtle = "#20573e"
    , border = "#28684a"
    , borderHover = "#2f7c57"
    , solid = "#33b074"
    , solidHover = "#30a46c"
    , solidActive = "#30a46c"
    , solidText = "#ffffff"
    , textSubtle = "#3dd68c"
    , text = "#b1f1cb"
    }


{-| -}
grassDark : ThemeColorSet
grassDark =
    { bg = "#0e1511"
    , tintSubtle = "#141a15"
    , tint = "#1b2a1e"
    , tintHover = "#1d3a24"
    , tintActive = "#25482d"
    , borderSubtle = "#2d5736"
    , border = "#366740"
    , borderHover = "#3e7949"
    , solid = "#53b365"
    , solidHover = "#46a758"
    , solidActive = "#46a758"
    , solidText = "#ffffff"
    , textSubtle = "#71d083"
    , text = "#c2f0c2"
    }


{-| -}
brownDark : ThemeColorSet
brownDark =
    { bg = "#12110f"
    , tintSubtle = "#1c1816"
    , tint = "#28211d"
    , tintHover = "#322922"
    , tintActive = "#3e3128"
    , borderSubtle = "#4d3c2f"
    , border = "#614a39"
    , borderHover = "#7c5f46"
    , solid = "#b88c67"
    , solidHover = "#ad7f58"
    , solidActive = "#ad7f58"
    , solidText = "#ffffff"
    , textSubtle = "#dbb594"
    , text = "#f2e1ca"
    }


{-| -}
bronzeDark : ThemeColorSet
bronzeDark =
    { bg = "#141110"
    , tintSubtle = "#1c1917"
    , tint = "#262220"
    , tintHover = "#302a27"
    , tintActive = "#3b3330"
    , borderSubtle = "#493e3a"
    , border = "#5a4c47"
    , borderHover = "#6f5f58"
    , solid = "#ae8c7e"
    , solidHover = "#a18072"
    , solidActive = "#a18072"
    , solidText = "#ffffff"
    , textSubtle = "#d4b3a5"
    , text = "#ede0d9"
    }


{-| -}
goldDark : ThemeColorSet
goldDark =
    { bg = "#121211"
    , tintSubtle = "#1b1a17"
    , tint = "#24231f"
    , tintHover = "#2d2b26"
    , tintActive = "#38352e"
    , borderSubtle = "#444039"
    , border = "#544f46"
    , borderHover = "#696256"
    , solid = "#a39073"
    , solidHover = "#978365"
    , solidActive = "#978365"
    , solidText = "#ffffff"
    , textSubtle = "#cbb99f"
    , text = "#e8e2d9"
    }


{-| -}
skyDark : ThemeColorSet
skyDark =
    { bg = "#0d141f"
    , tintSubtle = "#111a27"
    , tint = "#112840"
    , tintHover = "#113555"
    , tintActive = "#154467"
    , borderSubtle = "#1b537b"
    , border = "#1f6692"
    , borderHover = "#197cae"
    , solid = "#a8eeff"
    , solidHover = "#7ce2fe"
    , solidActive = "#7ce2fe"
    , solidText = "#0d141f"
    , textSubtle = "#75c7f0"
    , text = "#c2f3ff"
    }


{-| -}
mintDark : ThemeColorSet
mintDark =
    { bg = "#0e1515"
    , tintSubtle = "#0f1b1b"
    , tint = "#092c2b"
    , tintHover = "#003a38"
    , tintActive = "#004744"
    , borderSubtle = "#105650"
    , border = "#1e685f"
    , borderHover = "#277f70"
    , solid = "#a8f5e5"
    , solidHover = "#86ead4"
    , solidActive = "#86ead4"
    , solidText = "#0e1515"
    , textSubtle = "#58d5ba"
    , text = "#c4f5e1"
    }


{-| -}
limeDark : ThemeColorSet
limeDark =
    { bg = "#0e130b"
    , tintSubtle = "#141a10"
    , tint = "#1e2a15"
    , tintHover = "#263818"
    , tintActive = "#2f461c"
    , borderSubtle = "#395421"
    , border = "#446527"
    , borderHover = "#50782c"
    , solid = "#8cdb3a"
    , solidHover = "#96e647"
    , solidActive = "#96e647"
    , solidText = "#0e130b"
    , textSubtle = "#9ee65d"
    , text = "#d2f9b6"
    }


{-| -}
yellowDark : ThemeColorSet
yellowDark =
    { bg = "#14120b"
    , tintSubtle = "#1b180f"
    , tint = "#2d2305"
    , tintHover = "#362b00"
    , tintActive = "#433500"
    , borderSubtle = "#524202"
    , border = "#665417"
    , borderHover = "#836a21"
    , solid = "#ffff57"
    , solidHover = "#ffe629"
    , solidActive = "#ffe629"
    , solidText = "#14120b"
    , textSubtle = "#f5e147"
    , text = "#f6eeb4"
    }


{-| -}
amberDark : ThemeColorSet
amberDark =
    { bg = "#16120c"
    , tintSubtle = "#1d180f"
    , tint = "#302008"
    , tintHover = "#3f2700"
    , tintActive = "#4d3000"
    , borderSubtle = "#5c3d05"
    , border = "#714f19"
    , borderHover = "#8f6424"
    , solid = "#ffd60a"
    , solidHover = "#ffc53d"
    , solidActive = "#ffc53d"
    , solidText = "#16120c"
    , textSubtle = "#ffca16"
    , text = "#ffe7b3"
    }


{-| -}
orangeDark : ThemeColorSet
orangeDark =
    { bg = "#17120e"
    , tintSubtle = "#1e160f"
    , tint = "#331e0b"
    , tintHover = "#462100"
    , tintActive = "#562800"
    , borderSubtle = "#66350c"
    , border = "#7e451d"
    , borderHover = "#a35829"
    , solid = "#ff801f"
    , solidHover = "#f76b15"
    , solidActive = "#f76b15"
    , solidText = "#ffffff"
    , textSubtle = "#ffa057"
    , text = "#ffe0c2"
    }
