module W.Theme exposing
    ( ColorScale
    , FontFamilies
    , RadiusScale
    , SpacingScale
    , Theme
    , darkModeFromClass
    , darkTheme
    , fromSystemPreferences
    , lightTheme
    )

import Color exposing (Color)
import Html as H
import W.Theme.Colors


{-| -}
type Theme
    = Theme
        { id : String
        , fonts : FontFamilies
        , radius : RadiusScale
        , spacing : SpacingScale
        , base : ColorScale
        , primary : ColorScale
        , secondary : ColorScale
        , success : ColorScale
        , warning : ColorScale
        , danger : ColorScale
        , extraCSSVariables : List ( String, String )
        }


{-| -}
type alias ColorScale =
    { bg : Color
    , bgSubtle : Color
    , tint : Color
    , tintSubtle : Color
    , tintStrong : Color
    , accent : Color
    , accentSubtle : Color
    , accentStrong : Color
    , solid : Color
    , solidSubtle : Color
    , solidStrong : Color
    , solidText : Color
    , textSubtle : Color
    , text : Color
    }


{-| -}
type alias FontFamilies =
    { heading : String
    , text : String
    , code : String
    }


{-| -}
type alias SpacingScale =
    { xs : Float -- small ui elements
    , sm : Float -- regular ui elements and small cards
    , md : Float -- large ui elements and regular cards
    , lg : Float -- large cards
    , xl : Float -- mostly unused
    , xl2 : Float -- mostly unused
    , xl3 : Float -- mostly unused
    }


{-| -}
type alias RadiusScale =
    { xs : Float -- small ui elements
    , sm : Float -- regular ui elements and small cards
    , md : Float -- large ui elements and regular cards
    , lg : Float -- large cards
    , xl : Float -- mostly unused
    , xl2 : Float -- mostly unused
    , xl3 : Float -- mostly unused
    }


defaultSans : String
defaultSans =
    "ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, \"Noto Sans\", sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\""


defaultCode : String
defaultCode =
    "ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, \"Liberation Mono\", \"Courier New\", monospace"


defaultFonts : FontFamilies
defaultFonts =
    { heading = defaultSans
    , text = defaultSans
    , code = defaultCode
    }


defaultSpacingScale : SpacingScale
defaultSpacingScale =
    { xs = 3
    , sm = 8
    , md = 12
    , lg = 16
    , xl = 24
    , xl2 = 24
    , xl3 = 24
    }


defaultRadiusScale : RadiusScale
defaultRadiusScale =
    { xs = 3
    , sm = 8
    , md = 12
    , lg = 16
    , xl = 24
    , xl2 = 24
    , xl3 = 24
    }


{-| -}
lightTheme : Theme
lightTheme =
    Theme
        { id = "light"
        , fonts = defaultFonts
        , radius = defaultRadiusScale
        , spacing = defaultSpacingScale
        , base = W.Theme.Colors.slate
        , primary = W.Theme.Colors.blue
        , secondary = W.Theme.Colors.crimson
        , success = W.Theme.Colors.lime
        , warning = W.Theme.Colors.yellow
        , danger = W.Theme.Colors.red
        , extraCSSVariables = []
        }


{-| -}
darkTheme : Theme
darkTheme =
    Theme
        { id = "dark"
        , fonts = defaultFonts
        , radius = defaultRadiusScale
        , spacing = defaultSpacingScale
        , base = W.Theme.Colors.slateDark
        , primary = W.Theme.Colors.blueDark
        , secondary = W.Theme.Colors.crimsonDark
        , success = W.Theme.Colors.limeDark
        , warning = W.Theme.Colors.amberDark
        , danger = W.Theme.Colors.redDark
        , extraCSSVariables = []
        }


{-| -}
type DarkMode
    = DarkModeFromSystemPreferences Theme
    | DarkModeFromClass String Theme


{-| -}
fromSystemPreferences : Theme -> DarkMode
fromSystemPreferences =
    DarkModeFromSystemPreferences


{-| -}
darkModeFromClass : String -> Theme -> DarkMode
darkModeFromClass =
    DarkModeFromClass


{-| -}
globalThemeStyles :
    { theme : Theme
    , darkMode : Maybe DarkMode
    }
    -> H.Html msg
globalThemeStyles _ =
    H.text ""


toThemeVariables : Theme -> String
toThemeVariables (Theme theme) =
    [ cssVar "spacing-xs" (rem theme.spacing.xs)
    , cssVar "spacing-sm" (rem theme.spacing.sm)
    , cssVar "spacing-md" (rem theme.spacing.md)
    , cssVar "spacing-lg" (rem theme.spacing.lg)
    , cssVar "spacing-xl" (rem theme.spacing.xl)
    , cssVar "spacing-xl2" (rem theme.spacing.xl2)
    , cssVar "spacing-xl3" (rem theme.spacing.xl3)
    , cssVar "radius-xs" (rem theme.radius.xs)
    , cssVar "radius-sm" (rem theme.radius.sm)
    , cssVar "radius-md" (rem theme.radius.md)
    , cssVar "radius-lg" (rem theme.radius.lg)
    , cssVar "radius-xl" (rem theme.radius.xl)
    , cssVar "radius-xl2" (rem theme.radius.xl2)
    , cssVar "radius-xl3" (rem theme.radius.xl3)
    ]
        |> String.join ";"


toColorVariables : Theme -> String
toColorVariables (Theme theme) =
    [ toColorScaleVariables "base" theme.base
    , toColorScaleVariables "primary" theme.primary
    , toColorScaleVariables "secondary" theme.secondary
    , toColorScaleVariables "success" theme.success
    , toColorScaleVariables "warning" theme.warning
    , toColorScaleVariables "danger" theme.danger
    ]
        |> String.join ";"


toColorScaleVariables : String -> ColorScale -> String
toColorScaleVariables name colorScale =
    [ cssVar (name ++ "-bg") (rgbSegments colorScale.bg)
    , cssVar (name ++ "-bg-subtle") (rgbSegments colorScale.bgSubtle)
    , cssVar (name ++ "-tint") (rgbSegments colorScale.tint)
    , cssVar (name ++ "-tint-subtle") (rgbSegments colorScale.tintSubtle)
    , cssVar (name ++ "-tint-strong") (rgbSegments colorScale.tintStrong)
    , cssVar (name ++ "-accent") (rgbSegments colorScale.accent)
    , cssVar (name ++ "-accent-subtle") (rgbSegments colorScale.accentSubtle)
    , cssVar (name ++ "-accent-strong") (rgbSegments colorScale.accentStrong)
    , cssVar (name ++ "-solid") (rgbSegments colorScale.solid)
    , cssVar (name ++ "-solid-subtle") (rgbSegments colorScale.solidSubtle)
    , cssVar (name ++ "-solid-strong") (rgbSegments colorScale.solidStrong)
    , cssVar (name ++ "-solid-text") (rgbSegments colorScale.solidText)
    , cssVar (name ++ "-text") (rgbSegments colorScale.text)
    , cssVar (name ++ "-text-subtle") (rgbSegments colorScale.textSubtle)
    ]
        |> String.join ";"


namespace : String
namespace =
    "w"


rem : Float -> String
rem x =
    String.fromFloat x ++ "rem"


cssVar : String -> String -> String
cssVar key value =
    "--" ++ namespace ++ "-" ++ key ++ ":" ++ value


rgbSegments : Color -> String
rgbSegments =
    Debug.todo ""


{-| -}
classThemeStyles :
    { theme : Theme
    , darkMode : Maybe DarkMode
    }
    -> H.Html msg
classThemeStyles _ =
    H.text ""
