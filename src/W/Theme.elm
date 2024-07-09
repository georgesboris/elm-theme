module W.Theme exposing
    ( lightTheme, darkTheme
    , globalThemeStyles, classThemeStyles
    , darkModeFromClass, darkModeFromSystemPreferences, DarkMode
    , Theme, ColorScale, FontFamilies, RadiusScale, SpacingScale
    , withHeadingFont, withBodyFont, withCodeFont
    , withSpacing, withRadius
    , withBaseColor, withPrimaryColor, withSecondaryColor, withSuccessColor, withWarningColor, withDangerColor
    , styleList
    , font, spacing, radius, base, primary, secondary, success, warning, danger
    , ColorScaleValues, RadiusScaleValues, SpacingScaleValues
    )

{-|


## Setting Themes

@docs lightTheme, darkTheme
@docs baseStyles, globalThemeStyles, classThemeStyles
@docs darkModeFromClass, darkModeFromSystemPreferences, DarkMode


## Creating Custom Themes

@docs Theme, ColorScale, FontFamilies, RadiusScale, SpacingScale
@docs withHeadingFont, withBodyFont, withCodeFont
@docs withSpacing, withRadius
@docs withBaseColor, withPrimaryColor, withSecondaryColor, withSuccessColor, withWarningColor, withDangerColor


## Using Theme Values

@docs styleList
@docs font, spacing, radius, base, primary, secondary, success, warning, danger
@docs ColorScaleValues, RadiusScaleValues, SpacingScaleValues

-}

import Color exposing (Color)
import Html as H
import Html.Attributes as HA
import W.Theme.Colors



-- Theme Values


{-| -}
type Theme
    = Theme ThemeData


type alias ThemeData =
    { id : String
    , font : FontFamilies
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
type alias ColorScaleValues =
    { bg : String
    , bgSubtle : String
    , tint : String
    , tintSubtle : String
    , tintStrong : String
    , accent : String
    , accentSubtle : String
    , accentStrong : String
    , solid : String
    , solidSubtle : String
    , solidStrong : String
    , solidText : String
    , textSubtle : String
    , text : String
    }


{-| -}
type alias FontFamilies =
    { heading : String
    , body : String
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
type alias SpacingScaleValues =
    { xs : String
    , sm : String
    , md : String
    , lg : String
    , xl : String
    , xl2 : String
    , xl3 : String
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


{-| -}
type alias RadiusScaleValues =
    { xs : String
    , sm : String
    , md : String
    , lg : String
    , xl : String
    , xl2 : String
    , xl3 : String
    }



-- Default Themes


{-| -}
lightTheme : Theme
lightTheme =
    Theme
        { id = "light"
        , font = defaultFonts
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
        , font = defaultFonts
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


defaultSans : String
defaultSans =
    "ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, \"Noto Sans\", sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\""


defaultCode : String
defaultCode =
    "ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, \"Liberation Mono\", \"Courier New\", monospace"


defaultFonts : FontFamilies
defaultFonts =
    { heading = defaultSans
    , body = defaultSans
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



-- Dark Themes


{-| -}
type DarkMode
    = DarkModeFromSystemPreferences Theme
    | DarkModeFromClass String Theme


{-| -}
darkModeFromSystemPreferences : Theme -> DarkMode
darkModeFromSystemPreferences =
    DarkModeFromSystemPreferences


{-| -}
darkModeFromClass : String -> Theme -> DarkMode
darkModeFromClass =
    DarkModeFromClass



-- Theme Values


font : FontFamilies
font =
    { heading = cssValue "font-heading"
    , body = cssValue "font-body"
    , code = cssValue "font-code"
    }


spacing : SpacingScaleValues
spacing =
    { xs = cssValue "spacing-xs"
    , sm = cssValue "spacing-sm"
    , md = cssValue "spacing-md"
    , lg = cssValue "spacing-lg"
    , xl = cssValue "spacing-xl"
    , xl2 = cssValue "spacing-xl2"
    , xl3 = cssValue "spacing-xl3"
    }


radius : RadiusScaleValues
radius =
    { xs = cssValue "radius-xs"
    , sm = cssValue "radius-sm"
    , md = cssValue "radius-md"
    , lg = cssValue "radius-lg"
    , xl = cssValue "radius-xl"
    , xl2 = cssValue "radius-xl2"
    , xl3 = cssValue "radius-xl3"
    }


base : ColorScaleValues
base =
    toColorValues "base"


primary : ColorScaleValues
primary =
    toColorValues "primary"


secondary : ColorScaleValues
secondary =
    toColorValues "secondary"


success : ColorScaleValues
success =
    toColorValues "success"


warning : ColorScaleValues
warning =
    toColorValues "warning"


danger : ColorScaleValues
danger =
    toColorValues "danger"


toColorValues : String -> ColorScaleValues
toColorValues name =
    { bg = cssColorValue (name ++ "-bg")
    , bgSubtle = cssColorValue (name ++ "-bg-subtle")
    , tint = cssColorValue (name ++ "-tint")
    , tintSubtle = cssColorValue (name ++ "-tint-subtle")
    , tintStrong = cssColorValue (name ++ "-tint-strong")
    , accent = cssColorValue (name ++ "-accent")
    , accentSubtle = cssColorValue (name ++ "-accent-subtle")
    , accentStrong = cssColorValue (name ++ "-accent-strong")
    , solid = cssColorValue (name ++ "-solid")
    , solidSubtle = cssColorValue (name ++ "-solid-subtle")
    , solidStrong = cssColorValue (name ++ "-solid-strong")
    , solidText = cssColorValue (name ++ "-solid-text")
    , textSubtle = cssColorValue (name ++ "-text-subtle")
    , text = cssColorValue (name ++ "-text")
    }



-- Customizing Themes


withHeadingFont : String -> Theme -> Theme
withHeadingFont value (Theme theme) =
    let
        themeFonts : FontFamilies
        themeFonts =
            theme.font
    in
    Theme { theme | font = { themeFonts | heading = value } }


withBodyFont : String -> Theme -> Theme
withBodyFont value (Theme theme) =
    let
        themeFonts : FontFamilies
        themeFonts =
            theme.font
    in
    Theme { theme | font = { themeFonts | body = value } }


withCodeFont : String -> Theme -> Theme
withCodeFont value (Theme theme) =
    let
        themeFonts : FontFamilies
        themeFonts =
            theme.font
    in
    Theme { theme | font = { themeFonts | code = value } }


withRadius : RadiusScale -> Theme -> Theme
withRadius value (Theme theme) =
    Theme { theme | radius = value }


withSpacing : SpacingScale -> Theme -> Theme
withSpacing value (Theme theme) =
    Theme { theme | spacing = value }


withBaseColor : ColorScale -> Theme -> Theme
withBaseColor value (Theme theme) =
    Theme { theme | primary = value }


withPrimaryColor : ColorScale -> Theme -> Theme
withPrimaryColor value (Theme theme) =
    Theme { theme | primary = value }


withSecondaryColor : ColorScale -> Theme -> Theme
withSecondaryColor value (Theme theme) =
    Theme { theme | secondary = value }


withSuccessColor : ColorScale -> Theme -> Theme
withSuccessColor value (Theme theme) =
    Theme { theme | success = value }


withWarningColor : ColorScale -> Theme -> Theme
withWarningColor value (Theme theme) =
    Theme { theme | warning = value }


withDangerColor : ColorScale -> Theme -> Theme
withDangerColor value (Theme theme) =
    Theme { theme | danger = value }



-- Themes to Html elements


{-| -}
baseThemeStyles : H.Html msg
baseThemeStyles =
    H.node "style"
        []
        [ H.text ("""
body {
  background: """ ++ base.bg ++ """;
  font-family: """ ++ font.body ++ """;
  color: """ ++ base.text ++ """;
}
h1, h2, h3, h4, h5, h6 {
  font-family: """ ++ font.heading ++ """;
}
code {
  font-family: """ ++ font.code ++ """;
}

        // .w-variant
        ".w-"
        <> variant
        <> " {"
        <> "background-color:"
        <> css_color_value(variant <> "-tint")
        <> ";border-color:"
        <> css_color_value(variant <> "-accent")
        <> ";color:"
        <> css_color_value(variant <> "-text")
        <> ";}"
        // .w-variant (anchors and buttons) - hover
        <> ".w-"
        <> variant
        <> ":is(a,button):hover {"
        <> "background-color:"
        <> css_color_value(variant <> "-tint-strong")
        <> ";border-color:"
        <> css_color_value(variant <> "-accent-strong")
        <> ";}"
        // .w-variant (anchors and buttons) - active / focus
        <> ".w-"
        <> variant
        <> ":is(a,button):is(:active:focus) {"
        <> "background-color:"
        <> css_color_value(variant <> "-tint-subtle")
        <> ";border-color:"
        <> css_color_value(variant <> "-accent-subtle")
        <> ";}"
        // .w-variant.w-solid
        <> " .w-"
        <> variant
        <> ".w-solid {"
        <> "background-color:"
        <> css_color_value(variant <> "-solid")
        <> ";color:"
        <> css_color_value(variant <> "-solid-text")
        <> ";}"
        // .w-variant.w-solid (anchors and buttons) - hover
        <> ".w-"
        <> variant
        <> ".w-solid:is(a,button):hover {"
        <> "background-color:"
        <> css_color_value(variant <> "-solid-strong")
        <> ";}"
        // .w-variant.w-solid (anchors and buttons) - active / focus
        <> ".w-"
        <> variant
        <> ".w-solid:is(a,button):is(:active:focus) {"
        <> "background-color:"
        <> css_color_value(variant <> "-solid-subtle")
        <> ";}"
""") ]


{-| -}
globalThemeStyles :
    { theme : Theme
    , darkMode : Maybe DarkMode
    }
    -> H.Html msg
globalThemeStyles config =
    let
        lightStyles : String
        lightStyles =
            "body { " ++ toThemeVariables config.theme ++ " }"

        darkStyles : String
        darkStyles =
            case config.darkMode of
                Nothing ->
                    ""

                Just (DarkModeFromSystemPreferences (Theme darkTheme_)) ->
                    "@media (prefers-color-scheme: dark) { " ++ toColorVariables darkTheme_ ++ " }"

                Just (DarkModeFromClass class (Theme darkTheme_)) ->
                    "body." ++ class ++ ", ." ++ class ++ " { " ++ toColorVariables darkTheme_ ++ " }"
    in
    H.node "style"
        [ HA.attribute "data-w-theme" "" ]
        [ H.text (lightStyles ++ " " ++ darkStyles) ]


{-| -}
classThemeStyles :
    { theme : Theme
    , class : String
    , darkMode : Maybe DarkMode
    }
    -> H.Html msg
classThemeStyles config =
    let
        lightStyles : String
        lightStyles =
            "." ++ config.class ++ " { " ++ toThemeVariables config.theme ++ " }"

        darkStyles : String
        darkStyles =
            case config.darkMode of
                Nothing ->
                    ""

                Just (DarkModeFromSystemPreferences (Theme darkTheme_)) ->
                    "@media (prefers-color-scheme: dark) { ." ++ config.class ++ " { " ++ toColorVariables darkTheme_ ++ " }"

                Just (DarkModeFromClass darkClass (Theme darkTheme_)) ->
                    "." ++ config.class ++ "." ++ darkClass ++ " , ." ++ darkClass ++ " ." ++ config.class ++ " { " ++ toColorVariables darkTheme_ ++ " }"
    in
    H.node "style"
        [ HA.attribute "data-w-theme" "" ]
        [ H.text (lightStyles ++ " " ++ darkStyles) ]



-- Themes to Stylesheets


toThemeVariables : Theme -> String
toThemeVariables (Theme theme) =
    [ cssVar "id" theme.id
    , cssVar "font-heading" theme.font.heading
    , cssVar "font-body" theme.font.body
    , cssVar "font-code" theme.font.code
    , cssVar "spacing-xs" (rem theme.spacing.xs)
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
    , toColorVariables theme
    ]
        |> String.join ";"


toColorVariables : ThemeData -> String
toColorVariables theme =
    [ cssVar "color-scheme" (toColorScheme theme)
    , toColorScaleVariables "base" theme.base
    , toColorScaleVariables "primary" theme.primary
    , toColorScaleVariables "secondary" theme.secondary
    , toColorScaleVariables "success" theme.success
    , toColorScaleVariables "warning" theme.warning
    , toColorScaleVariables "danger" theme.danger
    ]
        |> String.join ";"


toColorScheme : ThemeData -> String
toColorScheme theme =
    let
        bgLightness : Float
        bgLightness =
            theme.base.bg
                |> Color.toHsla
                |> .lightness
    in
    if bgLightness > 0.5 then
        "light"

    else
        "dark"


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



-- CSS Helpers


{-| Set styles using CSS variables.
This is used to bypass a current limitation of Elm's `Html.Attribute.style` function, which ignores CSS variables.

**You can't compose this function with other functions that also set the element's style! Unlike `Html.Attribute.class` this function does not compose with other similar functions.**

    div
        [ Theme.styleList
            [ ( "background", Theme.base.bg )
            , ( "color", Theme.base.text )
            ]
        ]
        [ text "Hello!" ]

-}
styleList : List ( String, String ) -> H.Attribute msg
styleList styles =
    styles
        |> List.map (\( k, v ) -> k ++ ":" ++ v)
        |> String.join ";"
        |> HA.attribute "style"


namespace : String
namespace =
    "w"


rem : Float -> String
rem x =
    String.fromFloat x ++ "rem"


cssVar : String -> String -> String
cssVar key value =
    "--" ++ namespace ++ "-" ++ key ++ ":" ++ value


cssValue : String -> String
cssValue key =
    "var(--" ++ namespace ++ "-" ++ key ++ ")"


cssColorValue : String -> String
cssColorValue value =
    cssValue ("rgb(" ++ value ++ ")")


rgbSegments : Color -> String
rgbSegments color =
    let
        c : { red : Float, green : Float, blue : Float, alpha : Float }
        c =
            Color.toRgba color
    in
    String.fromFloat c.red ++ " " ++ String.fromFloat c.green ++ " " ++ String.fromFloat c.blue
