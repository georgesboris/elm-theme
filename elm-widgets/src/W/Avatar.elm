module W.Avatar exposing (large, name, names, small, view)

import Attr
import Html as H
import Html.Attributes as HA
import Html.Events as HE
import W.Box
import W.Internal.Helpers as WH
import W.Spacing
import W.Theme


{-| -}
type alias Attribute =
    Attr.Attr Attributes


type alias Attributes =
    { size : Size
    , icon : Maybe String
    , name : String
    , image : Maybe String
    , color : String
    , background : String
    }


defaultAttrs : Attributes
defaultAttrs =
    { size = Medium
    , icon = Nothing
    , name = ""
    , image = Nothing
    , color = W.Theme.color.textSubtle
    , background = W.Theme.color.tint
    }


type Size
    = Small
    | Medium
    | Large


small : Attribute
small =
    Attr.attr (\attrs -> { attrs | size = Small })


large : Attribute
large =
    Attr.attr (\attrs -> { attrs | size = Large })


name : String -> Attribute
name v =
    Attr.attr (\attrs -> { attrs | name = String.left 2 v })


names : String -> String -> Attribute
names n ln =
    Attr.attr
        (\attrs ->
            { attrs
                | name =
                    String.left 1 n ++ String.left 1 ln
            }
        )


viewCustom : List Attribute -> List (H.Html msg) -> H.Html msg
viewCustom =
    Attr.withAttrs defaultAttrs
        (\attrs children ->
            H.div
                [ HA.class "w--rounded-full w--aspect-square"
                , HA.class "w--flex w--items-center w--justify-center"
                , HA.class "w--leading-none w--uppercase"
                , case attrs.size of
                    Small ->
                        HA.class "w--text-sm w--tracking-wider"

                    Medium ->
                        HA.class "w--text-md w--tracking-wide"

                    Large ->
                        HA.class "w--text-lg"
                , [ case attrs.image of
                        Nothing ->
                            []

                        Just "" ->
                            []

                        Just url ->
                            [ ( "background-image", "url(" ++ url ++ ")" ) ]
                  , case attrs.size of
                        Small ->
                            [ ( "width", "2rem" ) ]

                        Medium ->
                            [ ( "width", "2.5rem" ) ]

                        Large ->
                            [ ( "width", "3rem" ) ]
                  , [ ( "color", attrs.color )
                    , ( "background-color", attrs.background )
                    ]
                  ]
                    |> List.concat
                    |> W.Theme.styleList
                ]
                children
        )


view : List Attribute -> H.Html msg
view =
    Attr.withAttrs defaultAttrs
        (\attrs ->
            H.div
                [ HA.class "w--rounded-full w--aspect-square"
                , HA.class "w--flex w--items-center w--justify-center"
                , HA.class "w--leading-none w--uppercase w--tracking-wide"
                , case attrs.size of
                    Small ->
                        HA.class "w--text-sm"

                    Medium ->
                        HA.class "w--text-md"

                    Large ->
                        HA.class "w--text-lg"
                , [ case attrs.image of
                        Nothing ->
                            []

                        Just "" ->
                            []

                        Just url ->
                            [ ( "background-image", "url(" ++ url ++ ")" ) ]
                  , case attrs.size of
                        Small ->
                            [ ( "width", "2rem" ) ]

                        Medium ->
                            [ ( "width", "2.5rem" ) ]

                        Large ->
                            [ ( "width", "3rem" ) ]
                  , [ ( "color", attrs.color )
                    , ( "background-color", attrs.background )
                    ]
                  ]
                    |> List.concat
                    |> W.Theme.styleList
                ]
                [ H.text attrs.name
                ]
        )
