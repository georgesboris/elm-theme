module W.Card exposing (view, viewButton, viewLink)

import Attr
import Html as H
import Html.Attributes as HA
import Html.Events as HE
import W.Box



--- Attributes


{-| -}
type alias Attribute =
    Attr.Attr Attributes


type alias Attributes =
    { id : Maybe String
    , shadow : String
    , border : String
    , background : String
    , boxAttributes : List W.Box.Attribute
    }


defaultAttributes : Attributes
defaultAttributes =
    { id = Nothing
    , shadow = "w--shadow hover:w--shadow-md active:w--shadow-none"
    , border = ""
    , background = ""
    , boxAttributes = []
    }



--- View


view : List Attribute -> List (H.Html msg) -> H.Html msg
view =
    Attr.withAttrs defaultAttributes
        (\attrs children ->
            H.div styleAttrs children
        )


viewButton : List Attribute -> { label : List (H.Html msg), onClick : msg } -> H.Html msg
viewButton =
    Attr.withAttrs defaultAttributes
        (\attrs props ->
            H.button (HE.onClick props.onClick :: styleAttrs) props.label
        )


viewLink : List Attribute -> { label : List (H.Html msg), href : String } -> H.Html msg
viewLink =
    Attr.withAttrs defaultAttributes
        (\attrs props ->
            H.a (HA.href props.href :: styleAttrs) props.label
        )


styleAttrs : List (H.Attribute msg)
styleAttrs =
    [ HA.class "w--bg-tint-subtle w--rounded-lg"
    , HA.class "w--p-md w--border w--border-solid"
    , HA.style "border-color" "rgb(255 255 255 / 0.075)"
    ]
