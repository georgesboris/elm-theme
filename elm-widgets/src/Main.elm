module Main exposing (main)

import Attr
import Html as H
import Html.Attributes as HA
import W.Avatar
import W.Badge
import W.Box
import W.Button
import W.DataRow
import W.Divider
import W.Heading
import W.Loading
import W.Skeleton
import W.Spacing
import W.TextBlock
import W.TextInline
import W.Theme


main : H.Html msg
main =
    H.div
        []
        [ W.Theme.globalTheme
            { theme = W.Theme.lightTheme |> W.Theme.withHeadingFont "serif"
            , darkMode = Just (W.Theme.darkModeFromClass "dark" W.Theme.darkTheme)
            }
        , H.div
            [ HA.class "w--p-sm w--bg w--space-y-3xl" ]
            [ viewTypography
            , viewActions
            , viewLayout
            , viewFeedback
            ]
        ]


viewTypography : H.Html msg
viewTypography =
    viewCategory "Typography"
        [ ( "Heading"
          , [ W.Heading.view
                [ W.Heading.extraLarge ]
                [ H.text "H1 Heading" ]
            , W.Heading.view
                [ W.Heading.h2, W.Heading.large ]
                [ H.text "H2 Heading" ]
            , W.Heading.view
                [ W.Heading.h3 ]
                [ H.text "H3 Heading" ]
            , W.Heading.view
                [ W.Heading.h4, W.Heading.small ]
                [ H.text "H4 Heading" ]
            , W.Heading.view
                [ W.Heading.h5, W.Heading.extraSmall ]
                [ H.text "H5 Heading" ]
            , W.Heading.view
                [ W.Heading.h6, W.Heading.extraSmall, W.Heading.subtle ]
                [ H.text "H6 Heading" ]
            ]
          )
        , ( "TextBlock & TextInline"
          , [ W.TextBlock.view
                [ W.TextBlock.extraLarge ]
                [ H.text "The "
                , W.TextInline.view [ W.TextInline.bold, W.TextInline.underline ] [ H.text "quick brown fox" ]
                , H.text " jumps over the lazy dog"
                ]
            , W.TextBlock.view
                [ W.TextBlock.large ]
                [ H.text "The "
                , W.TextInline.view [ W.TextInline.subtle, W.TextInline.lineThrough ] [ H.text "quick brown fox" ]
                , H.text " jumps over the lazy dog"
                ]
            , W.TextBlock.view
                []
                [ H.text "The "
                , W.TextInline.view [ W.TextInline.superscript ] [ H.text "quick brown fox" ]
                , H.text " jumps over the lazy dog"
                ]
            , W.TextBlock.view
                [ W.TextBlock.small, W.TextBlock.subtle ]
                [ H.text "The "
                , W.TextInline.view [ W.TextInline.subscript ] [ H.text "quick brown fox" ]
                , H.text " jumps over the lazy dog"
                ]
            , W.TextBlock.view
                [ W.TextBlock.extraSmall, W.TextBlock.subtle ]
                [ H.text "The "
                , W.TextInline.view [ W.TextInline.bold, W.TextInline.notSubtle, W.TextInline.italic ] [ H.text "quick brown fox" ]
                , H.text " jumps over the lazy dog"
                ]
            ]
          )
        ]


viewActions : H.Html msg
viewActions =
    viewCategory "Actions"
        [ ( "Buttons"
          , List.concat
                [ [ Attr.none, W.Button.outline, W.Button.tint, W.Button.invisible ]
                    |> List.map
                        (\attr ->
                            viewHorizontal
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
        ]


viewLayout : H.Html msg
viewLayout =
    viewCategory "Layout"
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
                [ W.Box.grid [], W.Box.gap 2 ]
                [ W.Box.view
                    [ W.Box.gap 0.5, W.Box.flex [ W.Box.xSpaceBetween ] ]
                    [ placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    ]
                , W.Box.view
                    [ W.Box.gap 0.5, W.Box.flex [ W.Box.xSpaceEvenly ] ]
                    [ placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    ]
                , W.Box.view
                    [ W.Box.gap 0.5, W.Box.flex [ W.Box.xCenter ] ]
                    [ placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    ]
                , W.Box.view
                    [ W.Box.gap 0.5, W.Box.flex [ W.Box.xCenter ] ]
                    [ placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    ]
                ]
            ]
          )

        -- , ( "Grid"
        --   , [ W.Grid.view [ W.Grid.gap 1 ]
        --         [ W.Grid.viewColumn
        --             [ W.Grid.largeScreen [ W.Grid.span 1 ] ]
        --             [ placeholder ]
        --         , W.Grid.viewColumn
        --             [ W.Grid.largeScreen [ W.Grid.span 3 ] ]
        --             [ placeholder ]
        --         , W.Grid.viewColumn
        --             [ W.Grid.largeScreen [ W.Grid.span 6 ] ]
        --             [ placeholder ]
        --         , W.Grid.viewColumn
        --             [ W.Grid.largeScreen [ W.Grid.start 2, W.Grid.end 12 ] ]
        --             [ placeholder ]
        --         ]
        --     ]
        --   )
        , ( "Box"
          , [ W.Box.view
                [ W.Box.gap 0.5
                , W.Box.grid []
                , W.Box.height 5
                , W.Box.tint
                ]
                [ W.Box.view
                    [ W.Box.flex []
                    , W.Box.gap 0.5
                    , W.Box.rounded
                    , W.Box.shadowLarge
                    , W.Box.pad
                    , W.Box.primary
                    , W.Box.solid
                    ]
                    [ placeholderSquare, placeholderSquare ]
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


viewFeedback : H.Html msg
viewFeedback =
    viewCategory "Feedback"
        [ ( "Badge"
          , [ viewHorizontal
                [ W.Badge.view [ W.Badge.inline ] [ H.text "123" ]
                , W.Badge.view [ W.Badge.inline, W.Badge.primary ] [ H.text "123" ]
                , W.Badge.view [ W.Badge.inline, W.Badge.secondary ] [ H.text "123" ]
                ]
            , viewHorizontal
                [ W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.base ] [ H.text "123" ]
                , W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.success ] [ H.text "123" ]
                , W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.customColor { color = "#dadada", background = "#000000" } ] [ H.text "123" ]
                ]
            , H.div
                [ HA.class "w--inline-block w--relative" ]
                [ W.Button.viewDummy [] [ H.text "Updates" ]
                , W.Badge.view [ W.Badge.small ] [ H.text "48" ]
                ]
            ]
          )
        , ( "Skeleton"
          , [ viewVertical
                [ W.Skeleton.view [ W.Skeleton.noAnimation, W.Skeleton.circle 4 ]
                , W.Skeleton.view [ W.Skeleton.radius 0.5, W.Skeleton.height 8 ]
                , W.Skeleton.view [ W.Skeleton.relativeWidth 0.8 ]
                , W.Skeleton.view [ W.Skeleton.relativeWidth 0.3 ]
                ]
            ]
          )
        , ( "Loading"
          , [ viewHorizontal
                [ W.Loading.view
                    [ W.Loading.size 40
                    , W.Loading.color W.Theme.primary.accent
                    ]
                , W.Loading.view
                    [ W.Loading.circles
                    , W.Loading.size 40
                    , W.Loading.color W.Theme.primary.accentStrong
                    ]
                , W.Loading.view
                    [ W.Loading.ripples
                    , W.Loading.size 40
                    , W.Loading.color W.Theme.secondary.accentStrong
                    ]
                , W.Loading.view [ W.Loading.circles ]
                ]
            ]
          )
        ]



-- View Helpers


viewCategory : String -> List ( String, List (H.Html msg) ) -> H.Html msg
viewCategory name widgets =
    H.details
        [ HA.attribute "open" "" ]
        [ H.summary [] [ H.text name ]
        , H.ul
            [ HA.class "w--list-none w--space-y-2xl" ]
            (widgets
                |> List.map
                    (\( widgetName, widgetViews ) ->
                        H.li
                            []
                            [ H.p [] [ H.text widgetName ]
                            , H.ul [ HA.class "w--space-y-md w--list-none" ] (List.map (\v -> H.li [] [ v ]) widgetViews)
                            ]
                    )
            )
        ]


viewHorizontal : List (H.Html msg) -> H.Html msg
viewHorizontal =
    H.div [ HA.class "w--flex w--items-start w--gap-sm" ]


viewVertical : List (H.Html msg) -> H.Html msg
viewVertical =
    H.div [ HA.class "w--space-y-sm" ]


placeholder : H.Html msg
placeholder =
    W.Skeleton.view
        [ W.Skeleton.height 6
        , W.Skeleton.noAnimation
        ]


placeholderSquare : H.Html msg
placeholderSquare =
    W.Box.view
        [ W.Box.height 1
        , W.Box.width 1
        , W.Box.background W.Theme.color.text
        , W.Box.roundedSmall
        ]
        []
