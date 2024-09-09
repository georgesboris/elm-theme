module Docs.Button exposing (view)

import Attr
import Book
import Docs.UI
import Html as H
import W.Button


view : Book.Page msg
view =
    Book.page "Buttons"
        (List.concat
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
