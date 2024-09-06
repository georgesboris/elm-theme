module Docs.Overlays exposing (view)

import Book
import Docs.UI
import Html as H
import W.Box
import W.Button
import W.Divider
import W.Modal
import W.Popover
import W.Spacing
import W.TextBlock
import W.Tooltip


view : Book.Page Book.Msg
view =
    Book.page "Overlays"
        [ ( "Tooltip", viewTooltips )
        , ( "Popover", viewPopover )
        , ( "Modal", viewModal )
        ]


viewTooltips : List (H.Html msg)
viewTooltips =
    List.map Docs.UI.viewExample
        [ ( "Different Positions"
          , [ Docs.UI.viewHorizontal
                [ W.Tooltip.view []
                    { tooltip = [ H.text "This is a top tooltip!" ]
                    , children = [ H.text "Top!" ]
                    }
                , W.Tooltip.view [ W.Tooltip.bottom ]
                    { tooltip = [ H.text "A bottom one!" ]
                    , children = [ H.text "Bottom?" ]
                    }
                , W.Tooltip.view [ W.Tooltip.right ]
                    { tooltip = [ H.text "A right one!" ]
                    , children = [ H.text "Right!" ]
                    }
                , W.Tooltip.view [ W.Tooltip.left ]
                    { tooltip = [ H.text "A left one!" ]
                    , children = [ H.text "Left??" ]
                    }
                ]
            ]
          )
        , ( "Bottom"
          , [ W.Tooltip.view [ W.Tooltip.bottom ]
                { tooltip = [ H.text "This is a tooltip!" ]
                , children = [ H.text "Hello!" ]
                }
            ]
          )
        , ( "Left"
          , [ W.Tooltip.view [ W.Tooltip.left ]
                { tooltip = [ H.text "This is a tooltip!" ]
                , children = [ H.text "Hello!" ]
                }
            ]
          )
        , ( "Right"
          , [ W.Tooltip.view [ W.Tooltip.right ]
                { tooltip = [ H.text "This is a tooltip!" ]
                , children = [ H.text "Hello!" ]
                }
            ]
          )
        , ( "Always Visible"
          , [ W.Tooltip.view [ W.Tooltip.alwaysVisible ]
                { tooltip = [ H.text "Helloo!" ]
                , children = [ H.text "Hello!" ]
                }
            ]
          )
        , ( "Fast"
          , [ W.Tooltip.view [ W.Tooltip.fast ]
                { tooltip = [ H.text "This is a blazingly fast tooltip!" ]
                , children = [ H.text "Hello!" ]
                }
            ]
          )
        , ( "Slow"
          , [ W.Tooltip.view [ W.Tooltip.slow ]
                { tooltip = [ H.text "This is a sloow tooltip!" ]
                , children = [ H.text "Hello!" ]
                }
            ]
          )
        ]


popoverChildren :
    String
    ->
        { content : List (H.Html msg)
        , trigger : List (H.Html msg)
        }
popoverChildren label =
    { content =
        [ W.Box.view
            [ W.Box.solid ]
            [ W.Button.viewDummy [ W.Button.full ] [ H.text "[[ Item ]]" ]
            , W.Button.viewDummy [ W.Button.full ] [ H.text "[[ Item ]]" ]
            , W.Divider.view [] []
            , W.Popover.view
                [ W.Popover.showOnHover
                , W.Popover.right
                , W.Popover.width 120
                , W.Popover.offset 4
                ]
                { trigger =
                    [ W.Button.viewDummy [ W.Button.full ] [ H.text "[[ Item ]]" ] ]
                , content =
                    [ W.Box.view
                        [ W.Box.solid ]
                        [ W.Button.viewDummy [ W.Button.full ] [ H.text "[[ Item ]]" ]
                        , W.Button.viewDummy [ W.Button.full ] [ H.text "[[ Item ]]" ]
                        ]
                    ]
                }
            ]
        ]
    , trigger =
        [ W.Button.viewDummy [] [ H.text label ]
        ]
    }


viewPopover : List (H.Html msg)
viewPopover =
    List.map Docs.UI.viewExample
        ([ ( "Bottom (Persistent)", [ W.Popover.persistent ] )
         , ( "Bottom Right", [ W.Popover.bottomRight ] )
         , ( "Top", [ W.Popover.top ] )
         , ( "Top Right", [ W.Popover.topRight ] )
         , ( "Left", [ W.Popover.left ] )
         , ( "Left Bottom", [ W.Popover.leftBottom ] )
         , ( "Right", [ W.Popover.right ] )
         , ( "Right Bottom", [ W.Popover.rightBottom ] )
         ]
            |> List.map
                (\( label, attrs ) ->
                    ( label
                    , [ Docs.UI.viewHorizontal
                            [ W.Popover.view attrs (popoverChildren "Default")
                            , W.Popover.view (W.Popover.width 180 :: W.Popover.over :: attrs) (popoverChildren "Over")
                            , W.Popover.view (W.Popover.width 180 :: W.Popover.offset 4 :: attrs) (popoverChildren "Offset")
                            , W.Popover.view (W.Popover.width 180 :: W.Popover.full True :: attrs) (popoverChildren "Full")
                            , W.Popover.view (W.Popover.width 180 :: W.Popover.showOnHover :: W.Popover.offset 4 :: attrs) (popoverChildren "Hover")
                            ]
                      ]
                    )
                )
        )


viewModal : List (H.Html Book.Msg)
viewModal =
    List.map Docs.UI.viewExample
        [ ( "Modal"
          , viewModalWrapper
                [ W.Modal.view
                    [ W.Modal.absolute, W.Modal.noBlur ]
                    { isOpen = True
                    , onClose = Nothing
                    , content = [ viewModalContent ]
                    }
                ]
          )
        , ( "Modal with onClose"
          , viewModalWrapper
                [ W.Modal.view
                    [ W.Modal.absolute, W.Modal.noBlur ]
                    { isOpen = True
                    , onClose = Just (Book.logAction "onClose")
                    , content = [ viewModalContent ]
                    }
                ]
          )
        , ( "Modal with toggle"
          , viewModalWrapper
                [ W.Modal.viewTogglable
                    [ W.Modal.absolute, W.Modal.noBlur ]
                    { id = "my-modal"
                    , content = [ viewModalContent ]
                    }
                , W.Modal.viewToggle "my-modal"
                    [ W.Button.viewDummy [] [ H.text "Toggle Modal" ] ]
                ]
          )
        ]


viewModalWrapper : List (H.Html msg) -> List (H.Html msg)
viewModalWrapper children =
    [ W.Box.view
        [ W.Box.relative
        , W.Box.tint
        , W.Box.flex [ W.Box.xyCenter ]
        , W.Box.height 24
        ]
        children
    ]


viewModalContent : H.Html msg
viewModalContent =
    W.Box.view
        [ W.Box.widthFull
        , W.Box.padding W.Spacing.sm
        , W.Box.height 12
        ]
        [ W.Popover.view
            [ W.Popover.right, W.Popover.offset 4, W.Popover.width 100 ]
            { trigger =
                [ W.Button.viewDummy
                    []
                    [ H.text "Popovers should be usable inside modals" ]
                ]
            , content = [ W.TextBlock.view [] [ H.text "This should be visible" ] ]
            }
        ]
