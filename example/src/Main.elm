module Main exposing (main)


import Html as H
import Html.Attributes as HA
import W.Theme


main : H.Html msg
main =
    H.div
        []
        [ H.node "style"
            []
            [ H.text ("""body { margin: 0; padding: 0; background: """ ++ W.Theme.base.bg ++ """; color: """ ++ W.Theme.base.text ++ """ }""")
            ]
        , W.Theme.global (W.Theme.lightWithDarkModeTheme W.Theme.systemStrategy)
        , W.Theme.styles W.Theme.lightTheme
        , W.Theme.styles W.Theme.darkTheme
        , sample
        , W.Theme.view W.Theme.lightTheme [] [ sample ]
        , W.Theme.view W.Theme.darkTheme [] [ sample ]
        ]
    
{-| -}
sample : H.Html msg
sample =
    let
        colorVars : List W.Theme.ThemeColorSetVariables
        colorVars =
            [ W.Theme.primary
            , W.Theme.secondary
            , W.Theme.success
            , W.Theme.warning
            , W.Theme.danger
            ]

        colorSample : W.Theme.ThemeColorSetVariables -> H.Html msg
        colorSample color =
            H.div
                [ HA.style "display" "flex"
                , HA.style "flex-direction" "column"
                , HA.style "gap" "8px"
                , HA.style "text-align" "center"
                , HA.style "grid-column" "span 1 / span 1"
                ]
                [ H.div
                    [ W.Theme.styleList
                        [ ( "background", color.solid )
                        , ( "border-radius", "4px" )
                        , ( "box-shadow", ("0 0 6px " ++ color.borderSubtle) )
                        , ( "color", color.solidText )
                        , ( "padding", "8px 12px" )
                        ]
                    ]
                    [ H.text "Button" ]
                , H.div
                    [ W.Theme.styleList
                        [ ( "background", color.tintSubtle )
                        , ( "border-radius", "4px" )
                        , ( "border", ("3px solid " ++ color.border))
                        , ( "color", color.text )
                        , ( "border-radius",  "4px" )
                        , ( "padding", "8px 12px" )
                        ]
                    ]
                    [ H.text "Text" ]
                , H.div
                    [ HA.style "background" (color.tint)
                    , HA.style "border-radius" "4px"
                    , HA.style "color" color.text
                    , HA.style "padding" "8px 12px"
                    ]
                    [ H.text "Text" ]
                ]
    in
    H.article
        [ HA.style "padding" "20px"
        , HA.style "background" W.Theme.base.tintSubtle
        ]
        [ H.section
            [ HA.style "border-radius" "4px"
            , HA.style "padding" "20px"
            , HA.style "background" W.Theme.base.bg
            , HA.style "box-shadow" "0 0 8px rgba(0, 0, 0, 0.1)"
            , HA.style "font-family" W.Theme.font.text
            , HA.style "color" W.Theme.base.text
            ]
            [ H.div
                [ HA.style "display" "grid"
                , HA.style "grid-template-columns" "repeat(2, minmax(0, 1fr))"
                , HA.style "gap" "20px"
                , HA.style "width" "100%"
                ]
                (H.div
                    [ HA.style "grid-column" "span 2 / span 2"
                    , HA.style "display" "flex"
                    , HA.style "flex-direction" "column"
                    , HA.style "gap" "8px"
                    , HA.style "padding-bottom" "12px"
                    ]
                    [ H.h1
                        [ HA.style "font-family" W.Theme.font.heading
                        , HA.style "color" W.Theme.base.text
                        , HA.style "font-size" "20px"
                        , HA.style "margin" "0"
                        ]
                        [ H.text "Theme Sample"
                        ]
                    , H.p
                        [ HA.style "margin" "0" ]
                        [ H.text "All theme colors and contrasts are displayed here." ]
                    , H.p
                        [ HA.style "margin" "0"
                        , HA.style "font-size" "14px"
                        , HA.style "color" W.Theme.base.textSubtle
                        , HA.style "font-family" W.Theme.font.code
                        ]
                        [ H.text "Use accessibility ratings for making sure your theme works for everyone." ]
                    ]
                    :: List.map colorSample colorVars
                )
            ]
        ]


