module W.Flex exposing
    ( view, grow
    , inline, vertical, horizontal, gap
    , center
    , xCenter, xLeft, xRight, xStretch, xSpaceBetween, xSpaceAround, xSpaceEvenly
    , yCenter, yTop, yBottom, yStretch, ySpaceBetween, ySpaceAround, ySpaceEvenly
    , largeScreen
    , Attribute
    )

{-|

@docs view, grow

@docs inline, vertical, horizontal, gap

@docs center
@docs xCenter, xLeft, xRight, xStretch, xSpaceBetween, xSpaceAround, xSpaceEvenly
@docs yCenter, yTop, yBottom, yStretch, ySpaceBetween, ySpaceAround, ySpaceEvenly

@docs largeScreen

@docs Attribute

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
    { base : Config
    , largeScreen : Maybe Config
    }


type alias Config =
    { gap : String
    , inline : Bool
    , wrap : Maybe Bool
    , vertical : Maybe Bool
    , verticalAlignment : Maybe Alignment
    , horizontalAlignment : Maybe Alignment
    }


type Alignment
    = Start
    | Center
    | End
    | SpaceBetween
    | SpaceAround
    | SpaceEvenly
    | Stretch


defaultAttrs : Attributes
defaultAttrs =
    { base =
        { gap = W.Theme.spacing.sm
        , inline = False
        , wrap = Nothing
        , vertical = Nothing
        , verticalAlignment = Nothing
        , horizontalAlignment = Nothing
        }
    , largeScreen = Nothing
    }



-- Attrs : Setters


attr : (Config -> Config) -> Attribute
attr fn =
    Attr.attr (\attrs -> { attrs | base = fn attrs.base })


{-| Gap size in "rem".
-}
gap : Float -> Attribute
gap v =
    attr (\attrs -> { attrs | gap = WH.rem v })


{-| -}
inline : Attribute
inline =
    attr (\attrs -> { attrs | inline = True })


{-| -}
vertical : Attribute
vertical =
    attr (\attrs -> { attrs | vertical = Just True })


{-| -}
horizontal : Attribute
horizontal =
    attr (\attrs -> { attrs | vertical = Just False })


{-| -}
center : Attribute
center =
    attr
        (\attrs ->
            { attrs
                | verticalAlignment = Just Center
                , horizontalAlignment = Just Center
            }
        )


{-| -}
xLeft : Attribute
xLeft =
    attr (\attrs -> { attrs | horizontalAlignment = Just Start })


{-| -}
xRight : Attribute
xRight =
    attr (\attrs -> { attrs | horizontalAlignment = Just End })


{-| -}
xCenter : Attribute
xCenter =
    attr (\attrs -> { attrs | horizontalAlignment = Just Center })


{-| -}
xSpaceAround : Attribute
xSpaceAround =
    attr (\attrs -> { attrs | horizontalAlignment = Just SpaceAround })


{-| -}
xSpaceEvenly : Attribute
xSpaceEvenly =
    attr (\attrs -> { attrs | horizontalAlignment = Just SpaceEvenly })


{-| -}
xSpaceBetween : Attribute
xSpaceBetween =
    attr (\attrs -> { attrs | horizontalAlignment = Just SpaceBetween })


{-| -}
xStretch : Attribute
xStretch =
    attr (\attrs -> { attrs | horizontalAlignment = Just Stretch })


{-| -}
yTop : Attribute
yTop =
    attr (\attrs -> { attrs | verticalAlignment = Just Start })


{-| -}
yBottom : Attribute
yBottom =
    attr (\attrs -> { attrs | verticalAlignment = Just End })


{-| -}
yCenter : Attribute
yCenter =
    attr (\attrs -> { attrs | verticalAlignment = Just Center })


{-| -}
ySpaceAround : Attribute
ySpaceAround =
    attr (\attrs -> { attrs | verticalAlignment = Just SpaceAround })


{-| -}
ySpaceBetween : Attribute
ySpaceBetween =
    attr (\attrs -> { attrs | verticalAlignment = Just SpaceBetween })


{-| -}
ySpaceEvenly : Attribute
ySpaceEvenly =
    attr (\attrs -> { attrs | verticalAlignment = Just SpaceEvenly })


{-| -}
yStretch : Attribute
yStretch =
    attr (\attrs -> { attrs | verticalAlignment = Just Stretch })



-- ----------------------------------------------------------------------------
--
-- Tailwind pre-compile
--
-- w--flex-col
-- w--items-center w--items-start w--items-end w--items-stretch
-- w--justify-center w--justify-start w--justify-end w--justify-stretch
-- w--justify-between w--justify-around w--justify-evenly
--
-- lg:w--flex-col
-- lg:w--items-center lg:w--items-start lg:w--items-end lg:w--items-stretch
-- lg:w--justify-center lg:w--justify-start lg:w--justify-end lg:w--justify-stretch
-- lg:w--justify-between lg:w--justify-around lg:w--justify-evenly
--
-- ----------------------------------------------------------------------------


{-| -}
largeScreen : List Attribute -> Attribute
largeScreen =
    Attr.withAttrs defaultAttrs
        (\largeScreenAttrs ->
            Attr.attr
                (\attrs ->
                    { attrs | largeScreen = Just largeScreenAttrs.base }
                )
        )



-- Views


{-| -}
view : List Attribute -> List (H.Html msg) -> H.Html msg
view =
    Attr.withAttrs defaultAttrs
        (\attrs children ->
            H.div
                [ inlineClass attrs.base
                , alignmentClass attrs.base
                , largeScreenClass attrs.largeScreen
                , W.Theme.styleList [ ( "gap", attrs.base.gap ) ]
                ]
                children
        )


grow : H.Attribute msg
grow =
    HA.class "w--flex-grow"



-- Helpers


inlineClass : Config -> H.Attribute msg
inlineClass config =
    if config.inline then
        HA.class "w--inline-flex"

    else
        HA.class "w--flex"


largeScreenClass : Maybe Config -> H.Attribute msg
largeScreenClass c =
    case c of
        Just config ->
            case config.vertical of
                Just True ->
                    HA.class ("lg:w--flex-col lg:" ++ mainAxisAlignment config.verticalAlignment ++ " lg:" ++ crossAxisAlignment config.horizontalAlignment)

                Just False ->
                    HA.class ("lg:w--flex-row lg:" ++ mainAxisAlignment config.horizontalAlignment ++ " lg:" ++ crossAxisAlignment config.verticalAlignment)

                Nothing ->
                    HA.class ("lg:" ++ mainAxisAlignment config.horizontalAlignment ++ " lg:" ++ crossAxisAlignment config.verticalAlignment)

        Nothing ->
            HA.class ""


alignmentClass : Config -> H.Attribute msg
alignmentClass config =
    case config.vertical of
        Just True ->
            HA.class ("w--flex-col " ++ mainAxisAlignment config.verticalAlignment ++ " " ++ crossAxisAlignment config.horizontalAlignment)

        _ ->
            HA.class (mainAxisAlignment config.horizontalAlignment ++ " " ++ crossAxisAlignment config.verticalAlignment)


mainAxisAlignment : Maybe Alignment -> String
mainAxisAlignment v =
    case v of
        Just Start ->
            "w--justify-start"

        Just Center ->
            "w--justify-center"

        Just End ->
            "w--justify-end"

        Just SpaceBetween ->
            "w--justify-between"

        Just SpaceAround ->
            "w--justify-around"

        Just SpaceEvenly ->
            "w--justify-evenly"

        Just Stretch ->
            "w--justify-stretch"

        Nothing ->
            "w--justify-start"


crossAxisAlignment : Maybe Alignment -> String
crossAxisAlignment v =
    case v of
        Just Start ->
            "w--items-start"

        Just Center ->
            "w--items-center"

        Just End ->
            "w--items-end"

        Just SpaceBetween ->
            ""

        Just SpaceAround ->
            ""

        Just SpaceEvenly ->
            ""

        Just Stretch ->
            "w--items-stretch"

        Nothing ->
            "w--items-center"
