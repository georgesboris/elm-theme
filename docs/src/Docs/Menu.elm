module Docs.Menu exposing (view)

import Book
import Html as H
import W.Menu


view : Book.Page Book.Msg
view =
    let
        items : List (H.Html Book.Msg)
        items =
            [ W.Menu.viewButton []
                { label = [ H.text "Click me" ]
                , onClick = Book.logAction "onClick"
                }
            , W.Menu.viewButton [ W.Menu.noPadding ]
                { label = [ H.text "Click me (no padding)" ]
                , onClick = Book.logAction "onClick"
                }
            , W.Menu.viewLink
                [ W.Menu.left [ H.text "L" ]
                ]
                { label = [ H.text "Link to" ]
                , href = "/Book.logAction/#"
                }
            , W.Menu.viewHeading
                [ W.Menu.left [ H.text "T" ]
                , W.Menu.right [ H.text "Edit" ]
                ]
                [ H.text "Title" ]
            , W.Menu.viewButton
                [ W.Menu.selected
                ]
                { label = [ H.text "Click me" ]
                , onClick = Book.logAction "onClick"
                }
            , W.Menu.viewLink []
                { label = [ H.text "Link to" ]
                , href = "/Book.logAction/#"
                }
            ]
    in
    Book.pageWithExamples "Menu"
        [ ( "Default", [ W.Menu.view [] items ] )
        , ( "Custom Padding", [ W.Menu.view [ W.Menu.paddingX 24 ] items ] )
        ]
