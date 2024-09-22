module W.Theme.Font exposing
    ( FontPalette
    , code, heading, text
    )

{-| The font palette of your theme defines the font families across your different elements.

@docs FontPalette

    pixelatedFonts : FontPalette
    pixelatedFonts =
        { heading = "'Jacquard 24', system-ui"
        , text = "'Tiny5', sans-serif"
        , code = "monospace"
        }


# Using Fonts

**When setting up a theme you will automatically set up the default font families for some elements.** However, you can still set them up manually when it makes sense:

    Html.h1
        [ W.Theme.styleList
            [ ( "font-family", W.Theme.Font.heading )
            ]
        ]
        [ Html.text "" ]

@docs code, heading, text


# Importing custom fonts

Make sure to import your fonts using the various approaches available. Here we're showcasing the simple approach of importing the font through CSS, though there are other approaches that are more optimized for performance.

    Html.node "style"
        []
        [ Html.text "@import url('https://fonts.googleapis.com/css2?family=Jacquard+24&family=Tiny5&display=swap')"
        ]

-}

import W.Internal.Helpers as WH


{-| -}
type alias FontPalette =
    { heading : String
    , text : String
    , code : String
    }


{-| -}
heading : String
heading =
    WH.cssValue "font-heading"


{-| -}
text : String
text =
    WH.cssValue "font-text"


{-| -}
code : String
code =
    WH.cssValue "font-code"
