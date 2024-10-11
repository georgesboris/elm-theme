module W.Theme exposing
    ( globalTheme
    , classTheme
    , themeComponents
    , DarkMode, noDarkMode, darkModeFromClass, darkModeFromSystemPreferences
    , Theme, lightTheme, darkTheme
    , withId
    , withHeadingFont, withTextFont, withCodeFont
    , withSpacing, withSizing, withRadius
    , withColorPalette, withBaseColor, withPrimaryColor, withSecondaryColor, withSuccessColor, withWarningColor, withDangerColor
    , styleList, styleListIf
    , toId, toFontPalette, toColorPalette, toSpacingScale, toSizingScale, toRadiusScale, toExtraVariables
    )

{-|


# Setting Up

@docs globalTheme

Theme's are most commonly set globally. By using `globalTheme` the theme will be applied to the `body` element directly.

@docs classTheme

However, if you want to set up multiple themes in the same page, or if you don't want to use Elm Theme for your whole application but just for part of it, you can set `class` based themes.

@docs themeComponents

**When not using global themes**, you should add the styles for your theme components manually. These will enable features such as `W.Theme.Color.asPrimary` and `W.Theme.Color.asSolid`.


# Dark Modes

When applying a theme using any of the available methods, you can also provide a dark mode strategy.

Not that the themes passed in for dark modes will only change color tokens. Other tokens will still be configured based on the main theme.

@docs DarkMode, noDarkMode, darkModeFromClass, darkModeFromSystemPreferences


# Creating Custom Themes

You should always start a new theme by extending one of the default themes:

    W.Theme.lightTheme
        |> W.Theme.withTextFont "Roboto"
        |> W.Theme.withPrimaryColor myProductColor

@docs Theme, lightTheme, darkTheme


## Theme Id

@docs withId

This setting can be useful for debugging theme inheritance.


## Theme Fonts

@docs withHeadingFont, withTextFont, withCodeFont


## Theme Radius, Sizing & Spacing

@docs withSpacing, withSizing, withRadius


## Theme Colors

@docs withColorPalette, withBaseColor, withPrimaryColor, withSecondaryColor, withSuccessColor, withWarningColor, withDangerColor


# Styling Helpers

@docs styleList, styleListIf


# Extracting Theme Values

@docs toId, toFontPalette, toColorPalette, toSpacingScale, toSizingScale, toRadiusScale, toExtraVariables

-}

import Color
import Html as H
import Html.Attributes as HA
import W.Color
import W.Internal.Helpers as WH
import W.Theme.Color
import W.Theme.Font
import W.Theme.Radius
import W.Theme.Sizing
import W.Theme.Spacing



-- Theme Types


{-| -}
type Theme
    = Theme ThemeData


type alias ThemeData =
    { id : String
    , fontPalette : W.Theme.Font.FontPalette
    , radius : W.Theme.Radius.RadiusScale
    , spacing : W.Theme.Spacing.SpacingScale
    , sizing : W.Theme.Sizing.SizingScale
    , colorPalette : W.Theme.Color.ColorPalette
    , extraCSSVariables : List ( String, String )
    }



-- Retrieving theme values


{-| -}
toId : Theme -> String
toId (Theme theme) =
    theme.id


{-| -}
toFontPalette : Theme -> W.Theme.Font.FontPalette
toFontPalette (Theme theme) =
    theme.fontPalette


{-| -}
toSpacingScale : Theme -> W.Theme.Spacing.SpacingScale
toSpacingScale (Theme theme) =
    theme.spacing


{-| -}
toSizingScale : Theme -> W.Theme.Sizing.SizingScale
toSizingScale (Theme theme) =
    theme.sizing


{-| -}
toRadiusScale : Theme -> W.Theme.Radius.RadiusScale
toRadiusScale (Theme theme) =
    theme.radius


{-| -}
toColorPalette : Theme -> W.Theme.Color.ColorPalette
toColorPalette (Theme theme) =
    theme.colorPalette


{-| -}
toExtraVariables : Theme -> List ( String, String )
toExtraVariables (Theme theme) =
    theme.extraCSSVariables



-- Default Themes


{-| -}
lightTheme : Theme
lightTheme =
    Theme
        { id = "light"
        , fontPalette = defaultFonts
        , radius = defaultRadiusScale
        , spacing = defaultSpacingScale
        , sizing = defaultSizingScale
        , colorPalette =
            { base = W.Color.slate
            , primary = W.Color.blue
            , secondary = W.Color.crimson
            , success = W.Color.lime
            , warning = W.Color.amber
            , danger = W.Color.red
            }
        , extraCSSVariables = []
        }


{-| -}
darkTheme : Theme
darkTheme =
    Theme
        { id = "dark"
        , fontPalette = defaultFonts
        , radius = defaultRadiusScale
        , spacing = defaultSpacingScale
        , sizing = defaultSizingScale
        , colorPalette =
            { base = W.Color.slateDark
            , primary = W.Color.blueDark
            , secondary = W.Color.crimsonDark
            , success = W.Color.limeDark
            , warning = W.Color.amberDark
            , danger = W.Color.redDark
            }
        , extraCSSVariables = []
        }


defaultSans : String
defaultSans =
    "ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, \"Noto Sans\", sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\""


defaultCode : String
defaultCode =
    "ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, \"Liberation Mono\", \"Courier New\", monospace"


defaultFonts : W.Theme.Font.FontPalette
defaultFonts =
    { heading = defaultSans
    , text = defaultSans
    , code = defaultCode
    }


defaultSpacingScale : W.Theme.Spacing.SpacingScale
defaultSpacingScale =
    { xs = 0.25
    , sm = 0.5
    , md = 0.75
    , lg = 1.0
    , xl = 1.5
    , xl2 = 2.5
    , xl3 = 4.0
    }


defaultRadiusScale : W.Theme.Radius.RadiusScale
defaultRadiusScale =
    { xs = 0.125
    , sm = 0.25
    , md = 0.375
    , lg = 0.5
    , xl = 0.75
    , xl2 = 1.0
    , xl3 = 1.5
    }


defaultSizingScale : W.Theme.Sizing.SizingScale
defaultSizingScale =
    { xs = 16
    , sm = 20
    , md = 24
    , lg = 36
    , xl = 48
    , xl2 = 64
    , xl3 = 80
    }



-- Dark Themes


{-| -}
type DarkMode
    = DarkModeFromSystemPreferences Theme
    | DarkModeFromClass String Theme
    | DarkModeDisabled


{-| -}
noDarkMode : DarkMode
noDarkMode =
    DarkModeDisabled


{-| -}
darkModeFromSystemPreferences : Theme -> DarkMode
darkModeFromSystemPreferences =
    DarkModeFromSystemPreferences


{-| -}
darkModeFromClass : String -> Theme -> DarkMode
darkModeFromClass =
    DarkModeFromClass



-- Customizing Themes


{-| -}
withId : String -> Theme -> Theme
withId value (Theme theme) =
    Theme { theme | id = value }


{-| -}
withHeadingFont : String -> Theme -> Theme
withHeadingFont value (Theme theme) =
    let
        themeFonts : W.Theme.Font.FontPalette
        themeFonts =
            theme.fontPalette
    in
    Theme { theme | fontPalette = { themeFonts | heading = value } }


{-| -}
withTextFont : String -> Theme -> Theme
withTextFont value (Theme theme) =
    let
        themeFonts : W.Theme.Font.FontPalette
        themeFonts =
            theme.fontPalette
    in
    Theme { theme | fontPalette = { themeFonts | text = value } }


{-| -}
withCodeFont : String -> Theme -> Theme
withCodeFont value (Theme theme) =
    let
        themeFonts : W.Theme.Font.FontPalette
        themeFonts =
            theme.fontPalette
    in
    Theme { theme | fontPalette = { themeFonts | code = value } }


{-| -}
withRadius : W.Theme.Radius.RadiusScale -> Theme -> Theme
withRadius value (Theme theme) =
    Theme { theme | radius = value }


{-| -}
withSpacing : W.Theme.Spacing.SpacingScale -> Theme -> Theme
withSpacing value (Theme theme) =
    Theme { theme | spacing = value }


{-| -}
withSizing : W.Theme.Sizing.SizingScale -> Theme -> Theme
withSizing value (Theme theme) =
    Theme { theme | sizing = value }


{-| -}
withColorPalette : W.Theme.Color.ColorPalette -> Theme -> Theme
withColorPalette value (Theme theme) =
    Theme { theme | colorPalette = value }


{-| -}
withBaseColor : W.Theme.Color.ColorScale -> Theme -> Theme
withBaseColor value =
    updateColorPalette (\p -> { p | base = value })


{-| -}
withPrimaryColor : W.Theme.Color.ColorScale -> Theme -> Theme
withPrimaryColor value =
    updateColorPalette (\p -> { p | primary = value })


{-| -}
withSecondaryColor : W.Theme.Color.ColorScale -> Theme -> Theme
withSecondaryColor value =
    updateColorPalette (\p -> { p | secondary = value })


{-| -}
withSuccessColor : W.Theme.Color.ColorScale -> Theme -> Theme
withSuccessColor value =
    updateColorPalette (\p -> { p | success = value })


{-| -}
withWarningColor : W.Theme.Color.ColorScale -> Theme -> Theme
withWarningColor value =
    updateColorPalette (\p -> { p | warning = value })


{-| -}
withDangerColor : W.Theme.Color.ColorScale -> Theme -> Theme
withDangerColor value =
    updateColorPalette (\p -> { p | danger = value })


updateColorPalette : (W.Theme.Color.ColorPalette -> W.Theme.Color.ColorPalette) -> Theme -> Theme
updateColorPalette fn (Theme theme) =
    Theme { theme | colorPalette = fn theme.colorPalette }



-- Themes to Html elements


{-| -}
themeComponents : H.Html msg
themeComponents =
    H.node "style"
        [ HA.attribute "data-w-theme" "" ]
        [ H.text variantComponents
        , H.text styleComponents
        ]


variantComponents : String
variantComponents =
    colorPaletteColors
        |> List.map
            (\variant_ ->
                let
                    variantColors : String
                    variantColors =
                        colorScaleColors
                            |> List.map
                                (\c ->
                                    WH.cssVar c (WH.cssValue (variant_ ++ "-" ++ c))
                                )
                            |> String.join "; "
                in
                WH.wClass variant_ ++ """ {
  """ ++ WH.cssVar "color" variant_ ++ """;
  """ ++ variantColors ++ """;
  color: """ ++ WH.cssValue "text" ++ """;
}"""
            )
        |> String.join " "


colorPaletteColors : List String
colorPaletteColors =
    [ "base"
    , "primary"
    , "secondary"
    , "success"
    , "warning"
    , "danger"
    ]


colorScaleColors : List String
colorScaleColors =
    [ "shadow"
    , "bg"
    , "bg-subtle"
    , "base"
    , "base-subtle"
    , "base-strong"
    , "tint"
    , "tint-subtle"
    , "tint-strong"
    , "accent"
    , "accent-subtle"
    , "accent-strong"
    , "solid"
    , "solid-subtle"
    , "solid-strong"
    , "solid-text"
    , "text"
    , "text-subtle"
    ]


styleComponents : String
styleComponents =
    WH.wClass "tint" ++ """ {
  background-color: """ ++ WH.cssColorValue "tint" ++ """;
}
""" ++ WH.wClass "tint:is(a,button):is(:hover)" ++ """ {
  background-color: """ ++ WH.cssColorValue "tint-strong" ++ """;
}
""" ++ WH.wClass "tint:is(a,button):is(:active)" ++ """ {
  background-color: """ ++ WH.cssColorValue "tint-subtle" ++ """;
}
""" ++ WH.wClass "solid" ++ """ {
  background-color: """ ++ WH.cssColorValue "solid" ++ """;
  color: """ ++ WH.cssColorValue "solid-text" ++ """;
}
""" ++ WH.wClass "solid:is(a,button):is(:hover)" ++ """ {
  background-color: """ ++ WH.cssColorValue "solid-strong" ++ """;
}
""" ++ WH.wClass "solid:is(a,button):is(:active)" ++ """ {
  background-color: """ ++ WH.cssColorValue "solid-subtle" ++ """;
}
""" ++ WH.wClass "tint:is(a,button):is(:focus-visible)" ++ """,
""" ++ WH.wClass "solid:is(a,button):is(:focus-visible)" ++ """,
""" ++ WH.wClass "focus:is(:focus-visible)" ++ """ {
  outline: 2px solid transparent;
  outline-offset: 2px;
  box-shadow: 0 0 0 1px """ ++ WH.cssColorValue "bg" ++ """, 0 0 0 4px """ ++ WH.cssColorValue "accent-subtle" ++ """;
}
"""


{-| -}
globalTheme :
    { theme : Theme
    , darkMode : DarkMode
    }
    -> H.Html msg
globalTheme config =
    let
        (Theme theme) =
            config.theme

        lightStyles : String
        lightStyles =
            "body { " ++ themeBaseStyles config.theme ++ "; " ++ themeColorStyles theme ++ " }"

        darkStyles : String
        darkStyles =
            case config.darkMode of
                DarkModeDisabled ->
                    ""

                DarkModeFromSystemPreferences (Theme darkTheme_) ->
                    "@media (prefers-color-scheme: dark) { body { " ++ themeColorStyles darkTheme_ ++ " } }"

                DarkModeFromClass class (Theme darkTheme_) ->
                    "body." ++ class ++ ", ." ++ class ++ " { " ++ themeColorStyles darkTheme_ ++ " }"
    in
    H.node "style"
        [ HA.attribute "data-w-theme" "" ]
        [ H.text (lightStyles ++ " " ++ darkStyles ++ " " ++ themeRootStyles Nothing)
        , H.text variantComponents
        , H.text styleComponents
        ]


{-| -}
classTheme :
    { theme : Theme
    , class : String
    , darkMode : DarkMode
    }
    -> H.Html msg
classTheme config =
    let
        (Theme theme) =
            config.theme

        lightStyles : String
        lightStyles =
            "." ++ config.class ++ " { " ++ themeBaseStyles config.theme ++ "; " ++ themeColorStyles theme ++ " }"

        darkStyles : String
        darkStyles =
            case config.darkMode of
                DarkModeDisabled ->
                    ""

                DarkModeFromSystemPreferences (Theme darkTheme_) ->
                    "@media (prefers-color-scheme: dark) { ." ++ config.class ++ " { " ++ themeColorStyles darkTheme_ ++ " }"

                DarkModeFromClass darkClass (Theme darkTheme_) ->
                    "." ++ config.class ++ "." ++ darkClass ++ " , ." ++ darkClass ++ " ." ++ config.class ++ " { " ++ themeColorStyles darkTheme_ ++ " }"
    in
    H.node "style"
        [ HA.attribute "data-w-theme" "" ]
        [ H.text (lightStyles ++ " " ++ darkStyles ++ " " ++ themeRootStyles (Just config.class)) ]



-- Themes to Stylesheets


themeRootStyles : Maybe String -> String
themeRootStyles themeClass =
    let
        prefix : String
        prefix =
            themeClass
                |> Maybe.map (\c -> "." ++ c)
                |> Maybe.withDefault "body"
    in
    prefix ++ """ {
  font-family: """ ++ W.Theme.Font.text ++ """;
}
""" ++ prefix ++ """ code,
""" ++ prefix ++ """ kbd,
""" ++ prefix ++ """ samp,
""" ++ prefix ++ """ pre {
  font-family: """ ++ W.Theme.Font.code ++ """;
}
""" ++ prefix ++ """ ::selection {
  background-color: """ ++ W.Theme.Color.text ++ """;
  color: """ ++ W.Theme.Color.bg ++ """;
}
"""


themeBaseStyles : Theme -> String
themeBaseStyles (Theme theme) =
    [ WH.cssVar "id" theme.id
    , WH.cssVar "font-heading" theme.fontPalette.heading
    , WH.cssVar "font-text" theme.fontPalette.text
    , WH.cssVar "font-code" theme.fontPalette.code
    , WH.cssVar "spacing-xs" (WH.rem theme.spacing.xs)
    , WH.cssVar "spacing-sm" (WH.rem theme.spacing.sm)
    , WH.cssVar "spacing-md" (WH.rem theme.spacing.md)
    , WH.cssVar "spacing-lg" (WH.rem theme.spacing.lg)
    , WH.cssVar "spacing-xl" (WH.rem theme.spacing.xl)
    , WH.cssVar "spacing-2xl" (WH.rem theme.spacing.xl2)
    , WH.cssVar "spacing-3xl" (WH.rem theme.spacing.xl3)
    , WH.cssVar "radius-xs" (WH.rem theme.radius.xs)
    , WH.cssVar "radius-sm" (WH.rem theme.radius.sm)
    , WH.cssVar "radius-md" (WH.rem theme.radius.md)
    , WH.cssVar "radius-lg" (WH.rem theme.radius.lg)
    , WH.cssVar "radius-xl" (WH.rem theme.radius.xl)
    , WH.cssVar "radius-2xl" (WH.rem theme.radius.xl2)
    , WH.cssVar "radius-3xl" (WH.rem theme.radius.xl3)
    , WH.cssVar "sizing-xs" (WH.rem theme.sizing.xs)
    , WH.cssVar "sizing-sm" (WH.rem theme.sizing.sm)
    , WH.cssVar "sizing-md" (WH.rem theme.sizing.md)
    , WH.cssVar "sizing-lg" (WH.rem theme.sizing.lg)
    , WH.cssVar "sizing-xl" (WH.rem theme.sizing.xl)
    , WH.cssVar "sizing-2xl" (WH.rem theme.sizing.xl2)
    , WH.cssVar "sizing-3xl" (WH.rem theme.sizing.xl3)
    ]
        |> String.join ";"


themeColorStyles : ThemeData -> String
themeColorStyles theme =
    [ [ "color-scheme:" ++ toColorScheme theme ]
    , toColorScaleVariables "base" theme.colorPalette.base
    , toColorScaleVariables "primary" theme.colorPalette.primary
    , toColorScaleVariables "secondary" theme.colorPalette.secondary
    , toColorScaleVariables "success" theme.colorPalette.success
    , toColorScaleVariables "warning" theme.colorPalette.warning
    , toColorScaleVariables "danger" theme.colorPalette.danger
    , baseVariantStyles
    ]
        |> List.concat
        |> String.join ";"


toColorScheme : ThemeData -> String
toColorScheme theme =
    let
        bgLightness : Float
        bgLightness =
            theme.colorPalette.base.bg
                |> Color.toHsla
                |> .lightness
    in
    if bgLightness > 0.5 then
        "light"

    else
        "dark"


toColorScaleVariables : String -> W.Theme.Color.ColorScale -> List String
toColorScaleVariables name colorScale =
    [ WH.cssVar (name ++ "-bg") (WH.rgbSegments colorScale.bg)
    , WH.cssVar (name ++ "-bg-subtle") (WH.rgbSegments colorScale.bgSubtle)
    , WH.cssVar (name ++ "-tint") (WH.rgbSegments colorScale.tint)
    , WH.cssVar (name ++ "-tint-subtle") (WH.rgbSegments colorScale.tintSubtle)
    , WH.cssVar (name ++ "-tint-strong") (WH.rgbSegments colorScale.tintStrong)
    , WH.cssVar (name ++ "-accent") (WH.rgbSegments colorScale.accent)
    , WH.cssVar (name ++ "-accent-subtle") (WH.rgbSegments colorScale.accentSubtle)
    , WH.cssVar (name ++ "-accent-strong") (WH.rgbSegments colorScale.accentStrong)
    , WH.cssVar (name ++ "-solid") (WH.rgbSegments colorScale.solid)
    , WH.cssVar (name ++ "-solid-subtle") (WH.rgbSegments colorScale.solidSubtle)
    , WH.cssVar (name ++ "-solid-strong") (WH.rgbSegments colorScale.solidStrong)
    , WH.cssVar (name ++ "-solid-text") (WH.rgbSegments colorScale.solidText)
    , WH.cssVar (name ++ "-text") (WH.rgbSegments colorScale.text)
    , WH.cssVar (name ++ "-text-subtle") (WH.rgbSegments colorScale.textSubtle)
    , WH.cssVar (name ++ "-shadow") (WH.rgbSegments colorScale.shadow)
    ]


baseVariantStyles : List String
baseVariantStyles =
    [ WH.cssVar "color" "base"
    , WH.cssVar "bg" (WH.cssValue "base-bg")
    , WH.cssVar "bg-subtle" (WH.cssValue "base-bg-subtle")
    , WH.cssVar "tint" (WH.cssValue "base-tint")
    , WH.cssVar "tint-subtle" (WH.cssValue "base-tint-subtle")
    , WH.cssVar "tint-strong" (WH.cssValue "base-tint-strong")
    , WH.cssVar "accent" (WH.cssValue "base-accent")
    , WH.cssVar "accent-subtle" (WH.cssValue "base-accent-subtle")
    , WH.cssVar "accent-strong" (WH.cssValue "base-accent-strong")
    , WH.cssVar "solid" (WH.cssValue "base-solid")
    , WH.cssVar "solid-subtle" (WH.cssValue "base-solid-subtle")
    , WH.cssVar "solid-strong" (WH.cssValue "base-solid-strong")
    , WH.cssVar "solid-text" (WH.cssValue "base-solid-text")
    , WH.cssVar "text" (WH.cssValue "base-text")
    , WH.cssVar "text-subtle" (WH.cssValue "base-text-subtle")
    , WH.cssVar "shadow" (WH.cssValue "base-shadow")
    ]



-- CSS Helpers


{-| Set styles using CSS variables.

This is used to bypass a current limitation of Elm's `Html.Attribute.style` function, which ignores CSS variables.

**You can't compose this function with other functions that also set the element's style! Unlike `Html.Attribute.class` this function does not compose with other similar functions.**

    Html.input
        [ W.Theme.styleList
            [ ( "background", W.Theme.Color.bg )
            , ( "color", W.Theme.Color.text )
            ]
        ]
        []

-}
styleList : List ( String, String ) -> H.Attribute msg
styleList styles =
    styles
        |> List.map (\( k, v ) -> k ++ ":" ++ v)
        |> String.join ";"
        |> HA.attribute "style"


{-| Conditionally set styles using CSS variables.

This is used to bypass a current limitation of Elm's `Html.Attribute.style` function, which ignores CSS variables.

**You can't compose this function with other functions that also set the element's style! Unlike `Html.Attribute.class` this function does not compose with other similar functions.**

    Html.input
        [ Theme.styleListIf
            [ ( "background", W.Theme.Color.background, True )
            , ( "color", W.Theme.Color.text, True )
            , ( "border-color", W.Theme.Color.dangerAccent, hasErrors )
            ]
        ]
        []

-}
styleListIf : List ( String, String, Bool ) -> H.Attribute msg
styleListIf styles =
    styles
        |> List.foldl
            (\( k, v, predicate ) acc ->
                if predicate then
                    k ++ ":" ++ v ++ ";" ++ acc

                else
                    acc
            )
            ""
        |> HA.attribute "style"
