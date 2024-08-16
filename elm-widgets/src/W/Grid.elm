module W.Grid exposing
    ( view, viewColumn
    , gap, Attribute
    , span, start, end, ColumnAttribute
    , largeScreen
    )

{-|

@docs view, viewColumn


## Grid Attributes

@docs gap, Attribute


## Column Attributes

@docs span, start, end, ColumnAttribute

-}

import Attr
import Html as H
import Html.Attributes as HA
import W.Internal.Helpers as WH
import W.Theme


{-| -}
type alias Attribute =
    Attr.Attr Attributes


type alias Attributes =
    { gap : String }


defaultAttrs : Attributes
defaultAttrs =
    { gap = W.Theme.spacing.sm }


{-| Gap size in "rem".
-}
gap : Float -> Attribute
gap v =
    Attr.attr (\attrs -> { attrs | gap = WH.rem v })


{-| -}
type alias ColumnAttribute =
    Attr.Attr ColumnAttributes


type alias ColumnAttributes =
    { span : String
    , start : String
    , end : String
    , largeSpan : String
    , largeStart : String
    , largeEnd : String
    }


defaultColumnAttrs : ColumnAttributes
defaultColumnAttrs =
    { span = "w--col-span-12"
    , start = ""
    , end = ""
    , largeSpan = ""
    , largeStart = ""
    , largeEnd = ""
    }


{-| -}
span : Int -> ColumnAttribute
span v =
    Attr.attr (\attrs -> { attrs | span = "w--col-span-" ++ String.fromInt v })


{-| -}
start : Int -> ColumnAttribute
start v =
    Attr.attr (\attrs -> { attrs | start = "w--col-start-" ++ String.fromInt v })


{-| -}
end : Int -> ColumnAttribute
end v =
    Attr.attr (\attrs -> { attrs | end = "w--col-end-" ++ String.fromInt v })



-- ----------------------------------------------------------------------------
--
-- Tailwind pre-compile
--
-- w--col-span-1 w--col-span-2 w--col-span-3
-- w--col-span-4 w--col-span-5 w--col-span-6
-- w--col-span-7 w--col-span-8 w--col-span-9
-- w--col-span-10 w--col-span-11 w--col-span-12
--
-- lg:w--col-span-1 lg:w--col-span-2 lg:w--col-span-3
-- lg:w--col-span-4 lg:w--col-span-5 lg:w--col-span-6
-- lg:w--col-span-7 lg:w--col-span-8 lg:w--col-span-9
-- lg:w--col-span-10 lg:w--col-span-11 lg:w--col-span-12
--
-- w--col-start-1 w--col-start-2 w--col-start-3
-- w--col-start-4 w--col-start-5 w--col-start-6
-- w--col-start-7 w--col-start-8 w--col-start-9
-- w--col-start-10 w--col-start-11 w--col-start-12
--
-- lg:w--col-start-1 lg:w--col-start-2 lg:w--col-start-3
-- lg:w--col-start-4 lg:w--col-start-5 lg:w--col-start-6
-- lg:w--col-start-7 lg:w--col-start-8 lg:w--col-start-9
-- lg:w--col-start-10 lg:w--col-start-11 lg:w--col-start-12
--
-- w--col-end-1 w--col-end-2 w--col-end-3
-- w--col-end-4 w--col-end-5 w--col-end-6
-- w--col-end-7 w--col-end-8 w--col-end-9
-- w--col-end-10 w--col-end-11 w--col-end-12
--
-- lg:w--col-end-1 lg:w--col-end-2 lg:w--col-end-3
-- lg:w--col-end-4 lg:w--col-end-5 lg:w--col-end-6
-- lg:w--col-end-7 lg:w--col-end-8 lg:w--col-end-9
-- lg:w--col-end-10 lg:w--col-end-11 lg:w--col-end-12
--
-- ----------------------------------------------------------------------------


largeScreenDefaultColumnAttrs : ColumnAttributes
largeScreenDefaultColumnAttrs =
    { span = ""
    , start = ""
    , end = ""
    , largeSpan = ""
    , largeStart = ""
    , largeEnd = ""
    }


{-| -}
largeScreen : List ColumnAttribute -> ColumnAttribute
largeScreen =
    Attr.withAttrs largeScreenDefaultColumnAttrs
        (\largeScreenAttrs ->
            Attr.attr
                (\attrs ->
                    { attrs
                        | largeSpan = "lg:" ++ largeScreenAttrs.span
                        , largeStart = "lg:" ++ largeScreenAttrs.start
                        , largeEnd = "lg:" ++ largeScreenAttrs.end
                    }
                )
        )



-- Views


{-| -}
view : List Attribute -> List (H.Html msg) -> H.Html msg
view =
    Attr.withAttrs defaultAttrs
        (\attrs children ->
            H.div
                [ HA.class "w--grid w--grid-cols-12"
                , W.Theme.styleList
                    [ ( "gap", attrs.gap )
                    ]
                ]
                children
        )


{-| -}
viewColumn : List ColumnAttribute -> List (H.Html msg) -> H.Html msg
viewColumn =
    Attr.withAttrs defaultColumnAttrs
        (\attrs children ->
            H.div
                [ HA.class attrs.span
                , HA.class attrs.start
                , HA.class attrs.end
                , HA.class attrs.largeSpan
                , HA.class attrs.largeStart
                , HA.class attrs.largeEnd
                ]
                children
        )
