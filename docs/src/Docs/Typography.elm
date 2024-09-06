module Docs.Typography exposing (view)

import Attr
import Book
import Html as H
import W.Box
import W.Divider
import W.Heading
import W.Sizing
import W.Spacing
import W.TextBlock
import W.TextInline


view : Book.Page msg
view =
    Book.page "Typography"
        [ ( ""
          , [ ( W.Spacing.xl, W.Heading.extraLarge, W.TextBlock.extraLarge )
            , ( W.Spacing.lg, W.Heading.large, W.TextBlock.large )
            , ( W.Spacing.md, Attr.none, Attr.none )
            , ( W.Spacing.sm, W.Heading.small, W.TextBlock.small )
            , ( W.Spacing.xs, W.Heading.extraSmall, W.TextBlock.extraSmall )
            ]
                |> List.map
                    (\( spacing, headingSize, textSize ) ->
                        W.Box.view
                            [ W.Box.flex [ W.Box.xRight ] ]
                            [ W.Box.view
                                [ W.Box.maxWidth W.Sizing.xl
                                , W.Box.gap spacing
                                , W.Box.padding W.Spacing.md
                                ]
                                [ W.Heading.view
                                    [ headingSize ]
                                    [ H.text "The quick brown fox jumps over the lazy dog" ]
                                , W.TextBlock.view
                                    [ textSize ]
                                    [ H.text "Lorem ipsum dolor sit amet, "
                                    , W.TextInline.view
                                        [ W.TextInline.bold, W.TextInline.underline ]
                                        [ H.text "consectetur adipiscing elit" ]
                                    , H.text ", sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                    , W.TextInline.view
                                        [ W.TextInline.subtle ]
                                        [ H.text "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex"
                                        , W.TextInline.view [ W.TextInline.subscript ] [ H.text "ea" ]
                                        , H.text " commodo consequat."
                                        ]
                                    ]
                                ]
                            ]
                    )
                |> List.intersperse
                    (W.Divider.view
                        [ W.Divider.subtle, W.Divider.thin ]
                        []
                    )
          )
        ]
