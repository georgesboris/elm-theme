module Main exposing (main)

import Html as H
import Html.Attributes as HA
import W.Theme
import W.Theme.Color
import W.Theme.Font
import W.Theme.Radius
import W.Theme.Spacing


theme : W.Theme.Theme
theme =
    W.Theme.darkTheme


main : H.Html msg
main =
    H.div
        []
        [ W.Theme.globalTheme
            { theme = theme
            , darkMode = W.Theme.noDarkMode
            }
        , demo
        ]


demo : H.Html msg
demo =
    H.article
        [ W.Theme.styleList
            [ ( "border-radius", W.Theme.Radius.toCSS W.Theme.Radius.sm )
            , ( "padding", W.Theme.Spacing.toCSS W.Theme.Spacing.xl3 ++ " 0" )
            , ( "background", W.Theme.Color.bgSubtle )
            , ( "display", "flex" )
            , ( "justify-content", "center" )
            ]
        ]
        [ H.div
            [ W.Theme.styleList
                [ ( "padding", W.Theme.Spacing.toCSS W.Theme.Spacing.xl )
                , ( "background", W.Theme.Color.bg )
                , ( "box-shadow", "0 2px 8px " ++ W.Theme.Color.shadow 0.2 )
                , ( "border-radius", W.Theme.Radius.toCSS W.Theme.Radius.xl2 )
                , ( "border", "1px solid " ++ W.Theme.Color.accentSubtle )
                , ( "width", "100%" )
                , ( "max-width", "640px" )
                , ( "min-width", "560px" )
                , ( "display", "flex" )
                , ( "flex-direction", "column" )
                ]
            ]
            [ H.header
                [ W.Theme.styleList
                    [ ( "padding-bottom", W.Theme.Spacing.toCSS W.Theme.Spacing.xl )
                    ]
                ]
                [ H.h1
                    [ W.Theme.styleList
                        [ ( "font-weight", "bold" )
                        , ( "font-size", "1.4rem" )
                        , ( "line-height", "1" )
                        , ( "margin", "0" )
                        , ( "padding-bottom", W.Theme.Spacing.toCSS W.Theme.Spacing.xs )
                        ]
                    ]
                    [ H.text "w theme"
                    ]
                , H.p
                    [ W.Theme.styleList
                        [ ( "color", W.Theme.Color.textSubtle )
                        , ( "margin", "0" )
                        , ( "line-height", "1" )
                        , ( "font-size", "1rem" )
                        ]
                    ]
                    [ H.text "A theme schema designed for consistency and flexibility."
                    ]
                ]
            , [ ( "base", "w/base" )
              , ( "primary", "w/primary" )
              , ( "secondary", "w/secondary" )
              , ( "success", "w/success" )
              , ( "warning", "w/warning" )
              , ( "danger", "w/danger" )
              ]
                |> List.map
                    (\( name, className ) ->
                        H.article
                            [ HA.class className
                            , W.Theme.styleList
                                [ ( "color", W.Theme.Color.textSubtle )
                                , ( "font-size", "1rem" )
                                , ( "display", "flex" )
                                , ( "flex-direction", "column" )
                                , ( "background", W.Theme.Color.bg )
                                , ( "border", "1px solid " ++ W.Theme.Color.accent )
                                , ( "border-radius", W.Theme.Radius.toCSS W.Theme.Radius.md )
                                , ( "box-shadow", "0 0 4px " ++ W.Theme.Color.shadow 0.25 )
                                ]
                            ]
                            [ H.header
                                [ W.Theme.styleList
                                    [ ( "display", "flex" )
                                    , ( "align-items", "center" )
                                    , ( "gap", W.Theme.Spacing.toCSS W.Theme.Spacing.lg )
                                    , ( "padding", W.Theme.Spacing.toCSS W.Theme.Spacing.md )
                                    ]
                                ]
                                [ H.div
                                    [ HA.style "flex-grow" "1" ]
                                    [ H.h1
                                        [ W.Theme.styleList
                                            [ ( "font-size", "0.8rem" )
                                            , ( "font-weight", "500" )
                                            , ( "line-height", "1" )
                                            , ( "letter-spacing", "0.05rem" )
                                            , ( "margin", "0" )
                                            , ( "padding-bottom", W.Theme.Spacing.toCSS W.Theme.Spacing.xs )
                                            , ( "text-transform", "uppercase" )
                                            , ( "color", W.Theme.Color.text )
                                            ]
                                        ]
                                        [ H.text name ]
                                    , H.p
                                        [ W.Theme.styleList
                                            [ ( "font-family", W.Theme.Font.code )
                                            , ( "font-size", "0.8rem" )
                                            , ( "line-height", "1" )
                                            , ( "margin", "0" )
                                            , ( "letter-spacing", "0.025rem" )
                                            , ( "color", W.Theme.Color.textSubtle )
                                            ]
                                        ]
                                        [ H.text name ]
                                    ]
                                , H.div
                                    [ W.Theme.styleList
                                        [ ( "width", "120px" )
                                        , ( "display", "grid" )
                                        , ( "grid-template-columns", "repeat(2, minmax(0, 1fr))" )
                                        , ( "gap", W.Theme.Spacing.toCSS W.Theme.Spacing.sm )
                                        ]
                                    ]
                                    [ H.button
                                        [ HA.class "w/tint"
                                        , W.Theme.styleList
                                            [ ( "appearance", "none" )
                                            , ( "padding", W.Theme.Spacing.toCSS W.Theme.Spacing.sm )
                                            , ( "border-radius", W.Theme.Radius.toCSS W.Theme.Radius.sm )
                                            , ( "border-width", "0" )
                                            , ( "line-height", "0.9rem" )
                                            , ( "font-size", "0.9rem" )
                                            , ( "font-weight", "400" )
                                            ]
                                        ]
                                        [ H.text "A" ]
                                    , H.button
                                        [ HA.class "w/solid"
                                        , W.Theme.styleList
                                            [ ( "appearance", "none" )
                                            , ( "padding", W.Theme.Spacing.toCSS W.Theme.Spacing.sm )
                                            , ( "box-shadow", "0 1px 8px " ++ W.Theme.Color.shadow 0.2 )
                                            , ( "border-radius", W.Theme.Radius.toCSS W.Theme.Radius.sm )
                                            , ( "border-width", "0" )
                                            , ( "line-height", "0.9rem" )
                                            , ( "font-size", "0.9rem" )
                                            , ( "font-weight", "400" )
                                            ]
                                        ]
                                        [ H.text "B" ]
                                    ]
                                ]
                            , H.div
                                []
                                ([ W.Theme.Color.accentSubtle, W.Theme.Color.accent, W.Theme.Color.accentStrong ]
                                    |> List.map
                                        (\accentColor ->
                                            H.div
                                                [ W.Theme.styleList
                                                    [ ( "padding-top", W.Theme.Spacing.toCSS W.Theme.Spacing.xs )
                                                    , ( "border-top", "2px solid " ++ accentColor )
                                                    ]
                                                ]
                                                []
                                        )
                                )
                            , H.div
                                [ W.Theme.styleList
                                    [ ( "display", "flex" )
                                    , ( "justify-content", "space-between" )
                                    , ( "padding", W.Theme.Spacing.toCSS W.Theme.Spacing.md )
                                    ]
                                ]
                                ([ W.Theme.Color.shadow 1.0, W.Theme.Color.bg, W.Theme.Color.bgSubtle, W.Theme.Color.tintSubtle, W.Theme.Color.tint, W.Theme.Color.tintStrong, W.Theme.Color.accentSubtle, W.Theme.Color.accent, W.Theme.Color.accentStrong, W.Theme.Color.solidSubtle, W.Theme.Color.solid, W.Theme.Color.solidStrong, W.Theme.Color.solidText, W.Theme.Color.textSubtle, W.Theme.Color.text ]
                                    |> List.map
                                        (\color ->
                                            H.div
                                                [ W.Theme.styleList
                                                    [ ( "border", "2px solid " ++ W.Theme.Color.tint )
                                                    , ( "border-radius", "9999px" )
                                                    , ( "width", W.Theme.Spacing.toCSS W.Theme.Spacing.md )
                                                    , ( "height", W.Theme.Spacing.toCSS W.Theme.Spacing.md )
                                                    , ( "background", color )
                                                    ]
                                                ]
                                                []
                                        )
                                )
                            ]
                    )
                |> H.div
                    [ W.Theme.styleList
                        [ ( "display", "grid" )
                        , ( "grid-template-columns", "repeat(2, minmax(0, 1fr))" )
                        , ( "gap", W.Theme.Spacing.toCSS W.Theme.Spacing.lg )
                        ]
                    ]
            ]
        ]
