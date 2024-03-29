module W.Theme exposing
    ( lightTheme, darkTheme, lightWithDarkModeTheme
    , global, view, styles
    , new, ThemeData, ThemeFontSet, ThemeRadiusSet, Theme
    , fromTheme, toTheme, ThemeBuilder
    , withFonts, withRadiusScaleFactor, withRadiusSet
    , withDarkColorScheme, withBase, withPrimary, withSecondary, withSuccess, withWarning, withDanger
    , withThemeData, toThemeData, withExtraVariables
    , toThemeWithDarkMode, classStrategy, systemStrategy, DarkModeStrategy
    , styleList, styleListIf
    , font, ThemeFontVariables
    , ThemeColorSetVariables, base, primary, secondary, success, warning, danger
    )

{-|


# Built-in Themes

@docs lightTheme, darkTheme, lightWithDarkModeTheme


# Using themes

@docs global, view, styles


# Creating Themes

@docs new, ThemeData, ThemeFontSet, ThemeRadiusSet, Theme


# Extending Themes

@docs fromTheme, toTheme, ThemeBuilder
@docs withFonts, withRadiusScaleFactor, withRadiusSet
@docs withDarkColorScheme, withBase, withPrimary, withSecondary, withSuccess, withWarning, withDanger
@docs withThemeData, toThemeData, withExtraVariables


## Dark Mode

@docs toThemeWithDarkMode, classStrategy, systemStrategy, DarkModeStrategy


# Theme Sampler

@docs sample


# Theme Html Helpers

Elm doesn't always play nice with CSS variables. These functions are a workaround for that issue.
**Please note that you can only use one of these functions per element and it can't be used alongside `Html.Attributes.style`.**

@docs styleList, styleListIf


# Theme Values

@docs font, ThemeFontVariables
@docs ThemeColorSetVariables, base, primary, secondary, success, warning, danger

-}

import Html as H
import Html.Attributes as HA
import W.Theme.Colors exposing (ThemeColorSet)
import W.Theme.Hash


{-| -}
type Theme
    = Theme
        { class : String
        , string : String
        , builder : ThemeBuilder
        , darkMode :
            Maybe
                { theme : Theme
                , strategy : DarkModeStrategy
                }
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
    , fonts : ThemeFontSet
    , radius : ThemeRadiusSet
    , base : ThemeColorSet
    , primary : ThemeColorSet
    , secondary : ThemeColorSet
    , success : ThemeColorSet
    , warning : ThemeColorSet
    , danger : ThemeColorSet
    }


{-| -}
type alias ThemeFontSet =
    { heading : String
    , text : String
    , code : String
    }


{-| -}
type alias ThemeRadiusSet =
    { xs : Float -- small ui elements
    , sm : Float -- regular ui elements and small cards
    , md : Float -- large ui elements and regular cards
    , lg : Float -- large cards
    , xl : Float -- mostly unused
    }


defaultRadiusSet : ThemeRadiusSet
defaultRadiusSet =
    { xs = 3
    , sm = 8
    , md = 12
    , lg = 16
    , xl = 24
    }


radiusSetWithScaleFactor : Float -> ThemeRadiusSet
radiusSetWithScaleFactor scaleFactor =
    { xs = defaultRadiusSet.xs * scaleFactor
    , sm = defaultRadiusSet.sm * scaleFactor
    , md = defaultRadiusSet.md * scaleFactor
    , lg = defaultRadiusSet.lg * scaleFactor
    , xl = defaultRadiusSet.xl * scaleFactor
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
toThemeWithDarkMode : { theme : Theme, strategy : DarkModeStrategy } -> ThemeBuilder -> Theme
toThemeWithDarkMode props =
    toTheme_ (Just props)


toTheme_ : Maybe { theme : Theme, strategy : DarkModeStrategy } -> ThemeBuilder -> Theme
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
withRadiusScaleFactor : Float -> ThemeBuilder -> ThemeBuilder
withRadiusScaleFactor scaleFactor (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | radius = radiusSetWithScaleFactor scaleFactor } }


{-| -}
withRadiusSet : ThemeRadiusSet -> ThemeBuilder -> ThemeBuilder
withRadiusSet v (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | radius = v } }


{-| -}
withFonts : (ThemeFontSet -> ThemeFontSet) -> ThemeBuilder -> ThemeBuilder
withFonts fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | fonts = fn data.fonts } }


{-| -}
withBase : (ThemeColorSet -> ThemeColorSet) -> ThemeBuilder -> ThemeBuilder
withBase fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | base = fn data.base } }


{-| -}
withPrimary : (ThemeColorSet -> ThemeColorSet) -> ThemeBuilder -> ThemeBuilder
withPrimary fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | primary = fn data.primary } }


{-| -}
withSecondary : (ThemeColorSet -> ThemeColorSet) -> ThemeBuilder -> ThemeBuilder
withSecondary fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | secondary = fn data.secondary } }


{-| -}
withSuccess : (ThemeColorSet -> ThemeColorSet) -> ThemeBuilder -> ThemeBuilder
withSuccess fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | success = fn data.success } }


{-| -}
withWarning : (ThemeColorSet -> ThemeColorSet) -> ThemeBuilder -> ThemeBuilder
withWarning fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | warning = fn data.warning } }


{-| -}
withDanger : (ThemeColorSet -> ThemeColorSet) -> ThemeBuilder -> ThemeBuilder
withDanger fn (ThemeBuilder ({ data } as theme)) =
    ThemeBuilder { theme | data = { data | danger = fn data.danger } }


{-| -}
withExtraVariables : (List ( String, String ) -> List ( String, String )) -> ThemeBuilder -> ThemeBuilder
withExtraVariables fn (ThemeBuilder theme) =
    ThemeBuilder { theme | extra = fn theme.extra }



-- Values


{-| -}
font : ThemeFontVariables
font =
    { heading = cssVar "font-heading"
    , text = cssVar "font-text"
    , code = cssVar "font-code"
    }


{-| -}
base : ThemeColorSetVariables
base =
    toThemeColorSetValues "base"


{-| -}
primary : ThemeColorSetVariables
primary =
    toThemeColorSetValues "primary"


{-| -}
secondary : ThemeColorSetVariables
secondary =
    toThemeColorSetValues "secondary"


{-| -}
success : ThemeColorSetVariables
success =
    toThemeColorSetValues "success"


{-| -}
warning : ThemeColorSetVariables
warning =
    toThemeColorSetValues "warning"


{-| -}
danger : ThemeColorSetVariables
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
        |> List.map cssVarDef
        |> String.join ";"
        |> (\s -> s ++ "color-scheme: dark;")


colorSpec : String -> ThemeColorSet -> List ( String, String )
colorSpec name color =
    [ colorVars (name ++ "-bg") color.bg
    , colorVars (name ++ "-tint-subtle") color.tintSubtle
    , colorVars (name ++ "-tint") color.tint
    , colorVars (name ++ "-tint-hover") color.tintHover
    , colorVars (name ++ "-tint-active") color.tintActive
    , colorVars (name ++ "-border-subtle") color.borderSubtle
    , colorVars (name ++ "-border") color.border
    , colorVars (name ++ "-border-hover") color.borderHover
    , colorVars (name ++ "-solid") color.solid
    , colorVars (name ++ "-solid-hover") color.solidHover
    , colorVars (name ++ "-solid-active") color.solidActive
    , colorVars (name ++ "-solid-text") color.solidText
    , colorVars (name ++ "-text-subtle") color.textSubtle
    , colorVars (name ++ "-text") color.text
    ]


colorVars : String -> String -> ( String, String )
colorVars name color =
    ( name, color )


namespace : String
namespace =
    "ew"


cssVarId : String -> String
cssVarId v =
    "--" ++ namespace ++ "-" ++ v


cssVarDef : ( String, String ) -> String
cssVarDef ( k, v ) =
    cssVarId k ++ ":" ++ v


cssVar : String -> String
cssVar v =
    "var(" ++ cssVarId v ++ ")"


{-| -}
type alias ThemeFontVariables =
    { heading : String
    , text : String
    , code : String
    }


{-| -}
type alias ThemeColorSetVariables =
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


toThemeColorSetValues : String -> ThemeColorSetVariables
toThemeColorSetValues name =
    { bg = cssVar (name ++ "-bg")
    , tintSubtle = cssVar (name ++ "-tint-subtle")
    , tint = cssVar (name ++ "-tint")
    , tintHover = cssVar (name ++ "-tint-hover")
    , tintActive = cssVar (name ++ "-tint-active")
    , borderSubtle = cssVar (name ++ "-border-subtle")
    , border = cssVar (name ++ "-border")
    , borderHover = cssVar (name ++ "-border-hover")
    , solid = cssVar (name ++ "-solid")
    , solidHover = cssVar (name ++ "-solid-hover")
    , solidActive = cssVar (name ++ "-solid-active")
    , solidText = cssVar (name ++ "-solid-text")
    , textSubtle = cssVar (name ++ "-text-subtle")
    , text = cssVar (name ++ "-text")
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
                                ++ "; }"
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
                                ++ "; } }"
                            )
                        ]

        Nothing ->
            H.node "style"
                []
                [ H.text ("." ++ theme.class ++ " { " ++ theme.string ++ " }") ]


{-| -}
type DarkModeStrategy
    = SystemStrategy
    | ClassStrategy String


{-| Uses the user system settings to decide between light and dark mode.
-}
systemStrategy : DarkModeStrategy
systemStrategy =
    SystemStrategy


{-| Uses the presence of a given CSS class in the element scope to decide between light and dark mode.
-}
classStrategy : String -> DarkModeStrategy
classStrategy =
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
                            [ H.text ("." ++ darkClass ++ " { " ++ toString darkMode.theme ++ "; }") ]

                    SystemStrategy ->
                        H.node "style"
                            []
                            [ H.text ("@media (prefers-color-scheme: dark) { body { " ++ toString darkMode.theme ++ "; } }") ]

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
        , radius = defaultRadiusSet
        , base = W.Theme.Colors.steel
        , primary = W.Theme.Colors.blue
        , secondary = W.Theme.Colors.crimson
        , success = W.Theme.Colors.lime
        , warning = W.Theme.Colors.amber
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
        , radius = defaultRadiusSet
        , base = W.Theme.Colors.steelDark
        , primary = W.Theme.Colors.blueDark
        , secondary = W.Theme.Colors.crimsonDark
        , success = W.Theme.Colors.limeDark
        , warning = W.Theme.Colors.amberDark
        , danger = W.Theme.Colors.redDark
        }


{-| -}
lightWithDarkModeTheme : DarkModeStrategy -> Theme
lightWithDarkModeTheme strategy =
    lightTheme
        |> fromTheme
        |> toThemeWithDarkMode
            { theme = darkTheme
            , strategy = strategy
            }
