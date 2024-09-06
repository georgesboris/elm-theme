module W.Styles exposing (cssReset)

import Html as H


cssReset : H.Html msg
cssReset =
    H.node "style"
        []
        [ H.text "body { margin: 0; }"
        ]
