module Docs.Actions exposing (view)

import Attr
import Book
import Docs.UI
import Html as H
import Html.Attributes as HA
import W.Badge
import W.Box
import W.Button
import W.Loading
import W.Sizing
import W.Skeleton
import W.Spacing
import W.Theme


view : Book.Page msg
view =
    Book.page "Actions & Feedback"
        [ ( "Buttons"
          , List.concat
                [ [ Attr.none, W.Button.outline, W.Button.tint, W.Button.invisible ]
                    |> List.map
                        (\attr ->
                            Docs.UI.viewHorizontal
                                [ W.Button.viewDummy [ attr, W.Button.large, W.Button.radius 0.5 ] [ H.text "Button" ]
                                , W.Button.viewDummy [ attr, W.Button.primary ] [ H.text "Button" ]
                                , W.Button.viewDummy [ attr, W.Button.warning, W.Button.disabled ] [ H.text "Button" ]
                                , W.Button.viewDummy [ attr, W.Button.success, W.Button.small ] [ H.text "Button" ]
                                , W.Button.viewDummy [ attr, W.Button.icon, W.Button.small, W.Button.rounded ] [ H.text "λ" ]
                                , W.Button.viewDummy [ attr, W.Button.danger, W.Button.extraSmall ] [ H.text "Button" ]
                                ]
                        )
                , [ W.Button.viewDummy [ W.Button.primary, W.Button.rounded, W.Button.full ] [ H.text "Button" ]
                  , W.Button.viewDummy [ W.Button.primary, W.Button.full, W.Button.disabled ] [ H.text "Button" ]
                  ]
                ]
          )
        , ( "Badge"
          , [ W.Box.view
                [ W.Box.gap W.Spacing.xl2
                , W.Box.flex [ W.Box.yTop ]
                ]
                [ Docs.UI.viewVertical
                    [ W.Button.viewDummy [] [ H.text "Updates", W.Badge.view [] [ H.text "48" ] ]
                    , W.Button.viewDummy [ W.Button.small ] [ H.text "Updates", W.Badge.view [ W.Badge.small ] [ H.text "120" ] ]
                    ]
                , W.Box.view
                    [ W.Box.gap W.Spacing.xl ]
                    [ W.Box.view [ W.Box.flex [], W.Box.gap W.Spacing.sm ]
                        [ W.Badge.view [ W.Badge.inline ] [ H.text "123" ]
                        , W.Badge.view [ W.Badge.inline, W.Badge.primary ] [ H.text "123" ]
                        , W.Badge.view [ W.Badge.inline, W.Badge.secondary ] [ H.text "123" ]
                        ]
                    , W.Box.view [ W.Box.flex [], W.Box.gap W.Spacing.sm ]
                        [ W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.base ] [ H.text "123" ]
                        , W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.success ] [ H.text "123" ]
                        , W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.customColor { color = "#dadada", background = "#000000" } ] [ H.text "123" ]
                        ]
                    ]
                ]
            ]
          )
        , ( "Skeleton"
          , [ Docs.UI.viewVertical
                [ W.Skeleton.view [ W.Skeleton.noAnimation, W.Skeleton.circle 4 ]
                , W.Skeleton.view [ W.Skeleton.radius 0.5, W.Skeleton.height 8 ]
                , W.Skeleton.view [ W.Skeleton.relativeWidth 0.8 ]
                , W.Skeleton.view [ W.Skeleton.relativeWidth 0.3 ]
                ]
            ]
          )
        , ( "Loading"
          , [ Docs.UI.viewHorizontal
                [ W.Loading.view
                    [ W.Loading.size 40
                    , W.Loading.color W.Theme.primaryScale.accent
                    ]
                , W.Loading.view
                    [ W.Loading.circles
                    , W.Loading.size 40
                    , W.Loading.color W.Theme.primaryScale.accentStrong
                    ]
                , W.Loading.view
                    [ W.Loading.ripples
                    , W.Loading.size 40
                    , W.Loading.color W.Theme.secondaryScale.accentStrong
                    ]
                , W.Loading.view [ W.Loading.circles ]
                ]
            ]
          )
        ]
