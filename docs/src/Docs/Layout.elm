module Docs.Layout exposing (view)

import Book
import Html as H
import Html.Attributes as HA
import W.Avatar
import W.Box
import W.DataRow
import W.Divider
import W.Spacing
import W.Theme


view : Book.Page msg
view =
    Book.page "Layout"
        [ ( "Divider"
          , [ H.div
                [ HA.class "w--grid w--grid-cols-2" ]
                [ H.div []
                    [ W.Divider.view [ W.Divider.margins 1 ] []
                    , W.Divider.view [ W.Divider.margins 1, W.Divider.subtle ] [ H.text "Content" ]
                    , W.Divider.view [ W.Divider.margins 1, W.Divider.color W.Theme.color.tint ] []
                    ]
                , H.div
                    [ HA.class "w--flex w--justify-around"
                    , HA.style "height" "68px"
                    , HA.style "padding" "16px 0"
                    ]
                    [ W.Divider.view [ W.Divider.vertical ] []
                    , W.Divider.view [ W.Divider.vertical, W.Divider.subtle ] [ H.text "Content" ]
                    , W.Divider.view [ W.Divider.vertical, W.Divider.color W.Theme.color.tint ] []
                    ]
                ]
            ]
          )
        , ( "DataRow"
          , [ W.DataRow.viewExtra
                [ W.DataRow.padding W.Spacing.md
                ]
                { header = [ H.text "Header" ]
                , main = [ H.text "Main" ]
                , footer = [ H.text "footer" ]
                , left =
                    [ W.Avatar.view
                        [ W.Avatar.large
                        , W.Avatar.names "Georges" "Boris"
                        ]
                    ]
                , right =
                    [ W.Avatar.view
                        [ W.Avatar.large
                        , W.Avatar.names "Georges" "Boris"
                        ]
                    ]
                }
            ]
          )
        , ( "Flex"
          , [ W.Box.view
                [ W.Box.gap W.Spacing.xs
                , W.Box.padding W.Spacing.lg
                , W.Box.background W.Theme.color.tintSubtle
                , W.Box.rounded
                ]
                [ W.Box.view
                    [ W.Box.gap W.Spacing.xs
                    , W.Box.flex [ W.Box.xSpaceBetween ]
                    ]
                    [ square
                    , square
                    , square
                    , square
                    ]
                , W.Box.view
                    [ W.Box.gap W.Spacing.xs
                    , W.Box.flex [ W.Box.xSpaceEvenly ]
                    ]
                    [ square
                    , square
                    , square
                    , square
                    ]
                , W.Box.view
                    [ W.Box.gap W.Spacing.xs
                    , W.Box.flex [ W.Box.xCenter ]
                    ]
                    [ square
                    , square
                    , square
                    , square
                    ]
                , W.Box.view
                    [ W.Box.gap W.Spacing.xs
                    , W.Box.flex [ W.Box.xCenter ]
                    ]
                    [ square
                    , square
                    , square
                    , square
                    ]
                ]
            ]
          )
        , ( "Grid"
          , let
                gridColumn : List (W.Box.Attribute msg) -> H.Html msg
                gridColumn attrs =
                    W.Box.view
                        (attrs
                            ++ [ W.Box.height 2
                               , W.Box.tint
                               ]
                        )
                        []
            in
            [ W.Box.view
                [ W.Box.gap W.Spacing.sm
                , W.Box.grid []
                ]
                [ gridColumn [ W.Box.columnSpan 3 ]
                , gridColumn [ W.Box.columnSpan 2 ]
                , gridColumn [ W.Box.columnSpan 5 ]
                , gridColumn [ W.Box.columnSpan 3, W.Box.columnStart 2 ]
                ]
            ]
          )
        , ( "Box"
          , [ W.Box.view
                [ W.Box.gap W.Spacing.xs
                , W.Box.height 6
                , W.Box.padding W.Spacing.md
                , W.Box.tint
                , W.Box.rounded
                , W.Box.grid []
                ]
                [ W.Box.view
                    [ W.Box.flex []
                    , W.Box.gap W.Spacing.xs
                    , W.Box.rounded
                    , W.Box.shadowLarge
                    , W.Box.padding W.Spacing.md
                    , W.Box.primary
                    , W.Box.solid
                    ]
                    [ square, square ]
                , W.Box.view
                    [ W.Box.shadowSmall
                    , W.Box.tint
                    , W.Box.rounded
                    ]
                    []
                , W.Box.viewLink
                    [ W.Box.shadowLarge
                    , W.Box.rounded
                    , W.Box.solid
                    , W.Box.danger
                    ]
                    { href = "#"
                    , content = [ H.text "Click moi" ]
                    }
                ]
            ]
          )
        ]


square : H.Html msg
square =
    W.Box.view
        [ W.Box.height 1
        , W.Box.width 1
        , W.Box.background W.Theme.color.text
        , W.Box.rounded
        ]
        []
