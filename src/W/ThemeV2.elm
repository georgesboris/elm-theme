module W.Theme exposing
    ( lightTheme, darkTheme, lightWithDarkModeTheme
    , global, view, styles
    , new, ThemeData, FontFamilies, RadiusScale, Theme
    , fromTheme, toTheme, ThemeBuilder
    , withFontFamilies, withSpacing, withBorderRadius, withBorderRadiusScale
    , withDarkColorScheme, withBase, withPrimary, withSecondary, withSuccess, withWarning, withDanger
    , withThemeData, toThemeData, withExtraVariables
    , toThemeWithDarkMode, fromClass, fromSystemPreferences, DarkModeSource
    , styleList, styleListIf
    , fontFamily, FontFamilyVariables
    , ColorScale, ColorScaleVariables, base, primary, secondary, success, warning, danger, withSpacingScale
    )

{-|


# Built-in Themes

@docs lightTheme, darkTheme, lightWithDarkModeTheme


# Using themes

@docs global, view, styles


# Creating Themes

@docs new, ThemeData, ThemeColorSet, ThemeFontSet, ThemeRadiusSet, Theme


# Extending Themes

@docs fromTheme, toTheme, ThemeBuilder
@docs withFontFamilies, withSpacingScale, withSpacing, withBorderRadiusScale, withBorderRadius
@docs withDarkColorScheme, withBase, withPrimary, withSecondary, withSuccess, withWarning, withDanger
@docs withThemeData, toThemeData, withExtraVariables


## Dark Mode

@docs toThemeWithDarkMode, classStrategy, systemStrategy, DarkModeSource


# Theme Sampler

@docs sample


# Theme Html Helpers

Elm doesn't always play nice with CSS variables. These functions are a workaround for that issue.
**Please note that you can only use one of these functions per element and it can't be used alongside `Html.Attributes.style`.**

@docs styleList, styleListIf


# Theme Values

@docs fontFamily, FontFamilyVariables
@docs ThemeColorSetVariables, base, primary, secondary, success, warning, danger

-}

import Html as H
import Html.Attributes as HA
import W.Theme.Colors
import W.Theme.Hash
import Color exposing (Color)


{-| -}
type Theme
    = Theme
        { class : String
        , string : String
        , builder : ThemeBuilder
        , darkMode :
            Maybe
                { theme : Theme
                , strategy : DarkModeSource
                }
        }

{-| -}
type ThemeV2
    = ThemeV2
        { id : String
        , useDarkColorScheme : Bool
        , fonts : FontFamilies
        , radius : RadiusScale
        , spacing : SpacingScale
        , base : ColorScale
        , primary : ColorScale
        , secondary : ColorScale
        , success : ColorScale
        , warning : ColorScale
        , danger : ColorScale
        , extraCSSVariables : List (String, String)
        }


{-| -}
type ThemeBuilder
    = ThemeBuilder
        { data : ThemeData
        , extra : List ( String, String )
        }


{-| -}
type alias ThemeData =
    { useDarkColorScheme : Bool
    , fonts : FontFamilies
    , radius : RadiusScale
    , spacing : SpacingScale
    , base : ColorScale
    , primary : ColorScale
    , secondary : ColorScale
    , success : ColorScale
    , warning : ColorScale
    , danger : ColorScale
    }

{-| -}
type alias ColorScale =
    { bg : Color
    , bgSubtle : Color
    , tint : Color
    , tintSubtle : Color
    , tintStrong : Color
    , detail : Color
    , detailSubtle : Color
    , detailStrong : Color
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

defaultSpacing : SpacingScale
defaultSpacing =
    { xs = 3
    , sm = 8
    , md = 12
    , lg = 16
    , xl = 24
    , xl2 = 24
    , xl3 = 24
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





defaultBorderRadius : RadiusScale
defaultBorderRadius =
    { xs = 3
    , sm = 8
    , md = 12
    , lg = 16
    , xl = 24
    , xl2 = 24
    , xl3 = 24
    }





-- Builder


{-| -}
new : ThemeData -> Theme
new data =
    ThemeBuilder
        { data = data
        , extra = []
        }
        |> toTheme


{-| -}
fromTheme : Theme -> ThemeBuilder
fromTheme (Theme theme) =
    theme.builder


{-| -}
toTheme : ThemeBuilder -> Theme
toTheme =
    toTheme_ Nothing


{-| -}
toThemeWithDarkMode : { theme : Theme, strategy : DarkModeSource } -> ThemeBuilder -> Theme
toThemeWithDarkMode props =
    toTheme_ (Just props)


toTheme_ : Maybe { theme : Theme, strategy : DarkModeSource } -> ThemeBuilder -> Theme
toTheme_ darkMode builder =
    let
        themeString : String
        themeString =
            toThemeString builder

        themeClass : String
        themeClass =
            toThemeClass themeString (Maybe.map .theme darkMode)
    in
    Theme
        { class = themeClass
        , string = themeString
        , builder = builder
        , darkMode = darkMode
        }


toThemeClass : String -> Maybe Theme -> String
toThemeClass themeString maybeDarkMode =
    maybeDarkMode
        |> Maybe.map (\(Theme darkTheme_) -> darkTheme_.string)
        |> Maybe.withDefault ""
        |> (++) themeString
        |> hashString
        |> String.fromInt
        |> (++) (namespace ++ "-th-")


{-| -}
toThemeData : Theme -> ThemeData
toThemeData (Theme theme) =
    case theme.builder of
        ThemeBuilder builder ->
            builder.data


{-| -}
withDarkColorScheme : Bool -> ThemeBuilder -> ThemeBuilder
withDarkColorScheme useDarkColorScheme (ThemeBuilder theme) =
    let
        data : ThemeData
        data =
            theme.data
    in
    ThemeBuilder { theme | data = { data | useDarkColorScheme = useDarkColorScheme } }


{-| -}
withThemeData : (ThemeData -> ThemeData) -> ThemeBuilder -> ThemeBuilder
withThemeData fn (ThemeBuilder theme) =
    ThemeBuilder { theme | data = fn theme.data }



{-| -}
withBorderRadius : RadiusScale -> ThemeBuilder -> ThemeBuilder
withBorderRadius v (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | radius = v } }


{-| -}
withSpacing : SpacingScale -> ThemeBuilder -> ThemeBuilder
withSpacing v (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | spacing = v } }

{-| -}
withFontFamilies : (FontFamilies -> FontFamilies) -> ThemeBuilder -> ThemeBuilder
withFontFamilies fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | fonts = fn data.fonts } }


{-| -}
withBase : (ColorScale -> ColorScale) -> ThemeBuilder -> ThemeBuilder
withBase fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | base = fn data.base } }


{-| -}
withPrimary : (ColorScale -> ColorScale) -> ThemeBuilder -> ThemeBuilder
withPrimary fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | primary = fn data.primary } }


{-| -}
withSecondary : (ColorScale -> ColorScale) -> ThemeBuilder -> ThemeBuilder
withSecondary fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | secondary = fn data.secondary } }


{-| -}
withSuccess : (ColorScale -> ColorScale) -> ThemeBuilder -> ThemeBuilder
withSuccess fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | success = fn data.success } }


{-| -}
withWarning : (ColorScale -> ColorScale) -> ThemeBuilder -> ThemeBuilder
withWarning fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | warning = fn data.warning } }


{-| -}
withDanger : (ColorScale -> ColorScale) -> ThemeBuilder -> ThemeBuilder
withDanger fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | danger = fn data.danger } }


{-| -}
withExtraVariables : (List ( String, String ) -> List ( String, String )) -> ThemeBuilder -> ThemeBuilder
withExtraVariables fn (ThemeBuilder theme) =
    ThemeBuilder { theme | extra = fn theme.extra }



-- Values


{-| -}
fontFamily : FontFamilyVariables
fontFamily =
    { heading = cssVar "font-heading"
    , text = cssVar "font-text"
    , code = cssVar "font-code"
    }


{-| -}
base : ColorScaleVariables
base =
    toThemeColorSetValues "base"


{-| -}
primary : ColorScaleVariables
primary =
    toThemeColorSetValues "primary"


{-| -}
secondary : ColorScaleVariables
secondary =
    toThemeColorSetValues "secondary"


{-| -}
success : ColorScaleVariables
success =
    toThemeColorSetValues "success"


{-| -}
warning : ColorScaleVariables
warning =
    toThemeColorSetValues "warning"


{-| -}
danger : ColorScaleVariables
danger =
    toThemeColorSetValues "danger"



-- Theme Html Helpers


{-|

    div
        [ styleList
            [ ( "color", W.Theme.base.text )
            , ( "background", W.Theme.base.bg )
            ]
        ]
        []

-}
styleList : List ( String, String ) -> H.Attribute msg
styleList xs =
    xs
        |> styleListString
        |> HA.attribute "style"


styleListString : List ( String, String ) -> String
styleListString xs =
    xs
        |> List.map (\( k, v ) -> k ++ ":" ++ v)
        |> String.join ";"
        |> (\s -> s ++ ";")


{-|

    div
        [ styleListIf
            [ ( "background", W.Theme.base.bg, True )
            , ( "color", W.Theme.primary.text, isPrimary )
            , ( "color", W.Theme.base.text, not isPrimary )
            ]
        ]
        []

-}
styleListIf : List ( String, String, Bool ) -> H.Attribute msg
styleListIf xs =
    xs
        |> List.filterMap
            (\( k, v, f ) ->
                if f then
                    Just ( k, v )

                else
                    Nothing
            )
        |> styleList



-- Helpers


toThemeString : ThemeBuilder -> String
toThemeString (ThemeBuilder { data, extra }) =
    [ [ ( "font-heading", data.fonts.heading )
      , ( "font-text", data.fonts.text )
      , ( "font-code", data.fonts.code )
      , ( "radius-xs", px data.radius.xs )
      , ( "radius-sm", px data.radius.sm )
      , ( "radius-md", px data.radius.md )
      , ( "radius-lg", px data.radius.lg )
      , ( "radius-xl", px data.radius.xl )
      , ( "radius-2xl", px data.radius.xl2 )
      , ( "radius-3xl", px data.radius.xl3 )
      ]
    , colorSpec "base" data.base
    , colorSpec "primary" data.primary
    , colorSpec "secondary" data.secondary
    , colorSpec "success" data.success
    , colorSpec "warning" data.warning
    , colorSpec "danger" data.danger
    , extra
    ]
        |> List.concat
        |> List.map (Tuple.mapFirst cssVarId)
        |> List.append
            [ ( "color-scheme"
              , if data.useDarkColorScheme then
                    "dark"

                else
                    "light"
              )
            ]
        |> styleListString


colorSpec : String -> ColorScale -> List ( String, String )
colorSpec name color =
    [ colorVars (name ++ "-bg") color.bg
    , colorVars (name ++ "-bg-subtle") color.bgSubtle
    , colorVars (name ++ "-tint") color.tint
    , colorVars (name ++ "-tint-subtle") color.tintSubtle
    , colorVars (name ++ "-tint-strong") color.tintStrong
    , colorVars (name ++ "-detail") color.detail
    , colorVars (name ++ "-detail-subtle") color.detailSubtle
    , colorVars (name ++ "-detail-strong") color.detailStrong
    , colorVars (name ++ "-solid") color.solid
    , colorVars (name ++ "-solid-subtle") color.solidSubtle
    , colorVars (name ++ "-solid-strong") color.solidStrong
    , colorVars (name ++ "-solid-text") color.solidText
    , colorVars (name ++ "-text-subtle") color.textSubtle
    , colorVars (name ++ "-text") color.text
    ]


colorVars : String -> String -> ( String, String )
colorVars name color =
    ( name, color )


namespace : String
namespace =
    "w"


cssVarId : String -> String
cssVarId v =
    "--" ++ namespace ++ "-" ++ v


cssVar : String -> String
cssVar v =
    "var(" ++ cssVarId v ++ ")"


{-| -}
type alias FontFamilyVariables =
    { heading : String
    , text : String
    , code : String
    }


{-| -}
type alias ColorScaleVariables =
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
    , text : String
    , textSubtle : String
    }


toThemeColorSetValues : String -> ColorScaleVariables
toThemeColorSetValues name =
    { bg = cssVar (name ++ "-bg")
    , bgSubtle = cssVar (name ++ "-bg-subtle")
    , tint = cssVar (name ++ "-tint")
    , tintSubtle = cssVar (name ++ "-tint-subtle")
    , tintStrong = cssVar (name ++ "-tint-strong")
    , detail = cssVar (name ++ "-detail")
    , detailSubtle = cssVar (name ++ "-detail-subtle")
    , detailStrong = cssVar (name ++ "-detail-strong")
    , solid = cssVar (name ++ "-solid")
    , solidSubtle = cssVar (name ++ "-solid-subtle")
    , solidStrong = cssVar (name ++ "-solid-strong")
    , solidText = cssVar (name ++ "-solid-text")
    , text = cssVar (name ++ "-text-subtle")
    , textSubtle = cssVar (name ++ "-text")
    }



-- Theme Providers


{-| Use different themes in specific parts of your html node tree.

    main : Html msg
    main =
        div []
            [ -- defaulTheme is applied to the body of the page
              W.Theme.global defaultTheme

              -- the styles and classes of the orange theme are calculated
              -- and rendered only once for the whole app
            , W.Theme.styles orangeTheme

              -- section using the default theme
            , section [] [ .. ]

              -- section using the orange theme
            , W.Theme.view orangeTheme [] [ .. ]
            ]

-}
view :
    Theme
    -> List (H.Attribute msg)
    -> List (H.Html msg)
    -> H.Html msg
view (Theme theme) attrs children =
    H.div
        (HA.class theme.class :: attrs)
        children


{-| -}
styles : Theme -> H.Html msg
styles (Theme theme) =
    case theme.darkMode of
        Just darkMode ->
            case darkMode.strategy of
                ClassStrategy darkClass ->
                    H.node "style"
                        []
                        [ H.text
                            ("."
                                ++ theme.class
                                ++ " { "
                                ++ theme.string
                                ++ baseStylesString
                                ++ " } ."
                                ++ darkClass
                                ++ " ."
                                ++ theme.class
                                ++ " { "
                                ++ toString darkMode.theme
                                ++ " }"
                            )
                        ]

                SystemStrategy ->
                    H.node "style"
                        []
                        [ H.text
                            ("."
                                ++ theme.class
                                ++ " { "
                                ++ theme.string
                                ++ baseStylesString
                                ++ " } @media (prefers-color-scheme: dark) { ."
                                ++ theme.class
                                ++ " { "
                                ++ toString darkMode.theme
                                ++ " } }"
                            )
                        ]

        Nothing ->
            H.node "style"
                []
                [ H.text ("." ++ theme.class ++ " { " ++ theme.string ++ " }") ]


{-| -}
type DarkModeSource
    = SystemStrategy
    | ClassStrategy String


{-| Uses the user system settings to decide between light and dark mode.
-}
fromSystemPreferences : DarkModeSource
fromSystemPreferences =
    SystemStrategy


{-| Uses the presence of a given CSS class in the element scope to decide between light and dark mode.
-}
fromClass : String -> DarkModeSource
fromClass =
    ClassStrategy


{-| Used to provide a Theme globally with a dark mode alternative. Themes will automatically switch based on the strategy condition.

    main : Html msg
    main =
        div []
            [ W.Theme.global lightTheme
            , p [ style "color" W.Theme.base.text ]
                [ text "I'm colored using the `base.text` color!" ]
            ]

**Note**: You are still able to overwrite this theme in for a given part of your HTML tree by using the `view` function.

-}
global : Theme -> H.Html msg
global (Theme theme) =
    H.div []
        [ H.node "style"
            []
            [ H.text ("body { " ++ theme.string ++ baseStylesString ++ "  }") ]
        , case theme.darkMode of
            Just darkMode ->
                case darkMode.strategy of
                    ClassStrategy darkClass ->
                        H.node "style"
                            []
                            [ H.text ("body." ++ darkClass ++ ", body ." ++ darkClass ++ " { " ++ toString darkMode.theme ++ " }") ]

                    SystemStrategy ->
                        H.node "style"
                            []
                            [ H.text ("@media (prefers-color-scheme: dark) { body { " ++ toString darkMode.theme ++ " } }") ]

            Nothing ->
                H.text ""
        ]


baseStylesString : String
baseStylesString =
    styleListString
        [ ( "background", cssVar "base-bg" )
        , ( "color", cssVar "base-text" )
        , ( "font-family", cssVar "font-text" )
        ]



-- Helpers


hashString : String -> Int
hashString =
    W.Theme.Hash.hashString 0


toString : Theme -> String
toString (Theme theme) =
    theme.string


px : Float -> String
px v =
    String.fromFloat v ++ "px"



-- Default Themes


{-| -}
lightTheme : Theme
lightTheme =
    new
        { useDarkColorScheme = False
        , fonts =
            { heading = "system-ui, sans-serif"
            , text = "system-ui, sans-serif"
            , code = "monospace"
            }
        , radius = defaultBorderRadius
        , spacing = defaultSpacing
        , base = W.Theme.Colors.slate
        , primary = W.Theme.Colors.blue
        , secondary = W.Theme.Colors.crimson
        , success = W.Theme.Colors.lime
        , warning = W.Theme.Colors.yellow
        , danger = W.Theme.Colors.red
        }


{-| -}
darkTheme : Theme
darkTheme =
    new
        { useDarkColorScheme = True
        , fonts =
            { heading = "system-ui, sans-serif"
            , text = "system-ui, sans-serif"
            , code = "monospace"
            }
        , radius = defaultBorderRadius
        , spacing = defaultSpacing
        , base = W.Theme.Colors.slateDark
        , primary = W.Theme.Colors.blueDark
        , secondary = W.Theme.Colors.crimsonDark
        , success = W.Theme.Colors.limeDark
        , warning = W.Theme.Colors.amberDark
        , danger = W.Theme.Colors.redDark
        }


{-| -}
lightWithDarkModeTheme : DarkModeSource -> Theme
lightWithDarkModeTheme strategy =
    lightTheme
        |> fromTheme
        |> toThemeWithDarkMode
            { theme = darkTheme
            , strategy = strategy
            }
