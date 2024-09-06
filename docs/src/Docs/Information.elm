module Docs.Information exposing (view)

import Book
import Docs.UI
import Html as H
import W.Avatar
import W.Box
import W.Message
import W.Notification
import W.Spacing
import W.Tag
import W.Theme


view : Book.Page Book.Msg
view =
    Book.page "Information"
        [ ( "Avatar", viewAvatar )
        , ( "Notification", viewNotification )
        , ( "Message", viewMessage )
        , ( "Tag", viewTag )
        ]


viewAvatar : List (H.Html Book.Msg)
viewAvatar =
    [ Docs.UI.viewHorizontal
        [ W.Avatar.view [ W.Avatar.large ]
        , W.Avatar.view []
        , W.Avatar.view [ W.Avatar.small ]
        ]
    , Docs.UI.viewHorizontal
        [ W.Avatar.view [ W.Avatar.name "User" ]
        , W.Avatar.view [ W.Avatar.names "User" "Name" ]
        , W.Avatar.view [ W.Avatar.name "User", W.Avatar.theme { color = "white", background = "black" } ]
        , W.Avatar.view [ W.Avatar.custom (W.Box.view [ W.Box.solid, W.Box.square, W.Box.width 1 ] []) ]
        , W.Avatar.view [ W.Avatar.image "https://picsum.photos/200/200" ]
        ]
    ]


viewMessage : List (H.Html Book.Msg)
viewMessage =
    [ ( [], "Neutral" )
    , ( [ W.Message.variant W.Theme.primary ], "Primary" )
    , ( [ W.Message.variant W.Theme.secondary ], "Secondary" )
    , ( [ W.Message.variant W.Theme.success ], "Success" )
    , ( [ W.Message.variant W.Theme.warning ], "Warning" )
    , ( [ W.Message.variant W.Theme.danger ], "Danger" )
    , ( [ W.Message.borderWidth 0 ], "No border" )
    , ( [ W.Message.borderWidth 12 ], "Increased border" )
    ]
        |> List.map
            (\( attrs, label ) ->
                Docs.UI.viewExample
                    ( label
                    , [ Docs.UI.viewVertical
                            [ W.Message.view attrs [ H.text label ]
                            , W.Message.view (W.Message.onClick (Book.logAction "onClick") :: attrs) [ H.text label ]
                            , W.Message.view (W.Message.href "/logAction/#" :: attrs) [ H.text label ]
                            , W.Message.view
                                (attrs
                                    ++ [ W.Message.icon [ H.text "i" ]
                                       , W.Message.footer [ H.text "Footer" ]
                                       ]
                                )
                                [ H.text label ]
                            ]
                      ]
                    )
            )


viewNotification : List (H.Html Book.Msg)
viewNotification =
    [ ( [], "Neutral" )
    , ( [ W.Notification.primary ], "Primary" )
    , ( [ W.Notification.secondary ], "Secondary" )
    , ( [ W.Notification.success ], "Success" )
    , ( [ W.Notification.warning ], "Warning" )
    , ( [ W.Notification.danger ], "Danger" )
    ]
        |> List.map
            (\( attrs, label ) ->
                Docs.UI.viewExample
                    ( label
                    , [ Docs.UI.viewVertical
                            [ W.Notification.view attrs [ H.text label ]
                            , W.Notification.view (W.Notification.onClick (Book.logAction "onClick") :: attrs) [ H.text label ]
                            , W.Notification.view (W.Notification.onClose (Book.logAction "onClose") :: attrs) [ H.text label ]
                            , W.Notification.view (W.Notification.href "/logAction/#" :: attrs) [ H.text label ]
                            , W.Notification.view
                                (attrs
                                    ++ [ W.Notification.icon [ H.text "i" ]
                                       , W.Notification.footer [ H.text "Footer" ]
                                       ]
                                )
                                [ H.text label ]
                            ]
                      ]
                    )
            )


viewTag : List (H.Html Book.Msg)
viewTag =
    [ ( [], "Neutral" )
    , ( [ W.Tag.primary ], "Primary" )
    , ( [ W.Tag.secondary ], "Secondary" )
    , ( [ W.Tag.success ], "Success" )
    , ( [ W.Tag.warning ], "Warning" )
    , ( [ W.Tag.danger ], "Danger" )
    ]
        |> List.map
            (\( attrs, label ) ->
                Docs.UI.viewExample
                    ( label
                    , [ W.Box.view
                            [ W.Box.gap W.Spacing.md
                            , W.Box.flex []
                            ]
                            [ W.Tag.view (W.Tag.large :: attrs) [ H.text label ]
                            , W.Tag.view attrs [ H.text label ]
                            , W.Tag.viewButton attrs { onClick = Book.logAction "onClick", label = [ H.text label ] }
                            , W.Tag.viewLink attrs { href = "/logAction/#", label = [ H.text label ] }
                            , W.Tag.view (W.Tag.small :: attrs) [ H.text label ]
                            ]
                      ]
                    )
            )
