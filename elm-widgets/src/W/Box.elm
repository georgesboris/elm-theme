module W.Box exposing
    ( view, viewButton, viewLink, Attribute
    , inline, block
    , width, widthRelative, height, heightRelative, gap
    , rounded, roundedSmall, roundedLarge, roundedFull, radius
    , shadow, shadowLarge, shadowSmall
    , base, primary, secondary, success, warning, danger
    , tint, solid
    , background
    , pad, padSmall, padExtraSmall, padLarge, padExtraLarge
    , padTop, padTopSmall, padTopExtraSmall, padTopLarge, padTopExtraLarge
    , padLeft, padLeftSmall, padLeftExtraSmall, padLeftLarge, padLeftExtraLarge
    , padRight, padRightSmall, padRightExtraSmall, padRightLarge, padRightExtraLarge
    , padBottom, padBottomSmall, padBottomExtraSmall, padBottomLarge, padBottomExtraLarge
    , padCustom
    , flex, FlexAttribute
    , vertical, horizontal
    , xyCenter
    , xCenter, xLeft, xRight, xStretch, xSpaceBetween, xSpaceAround, xSpaceEvenly
    , yCenter, yTop, yBottom, yStretch, ySpaceBetween, ySpaceAround, ySpaceEvenly
    , grid, GridAttribute
    , largeScreen
    )

{-|

@docs view, viewButton, viewLink, Attribute
@docs inline, block
@docs width, widthRelative, height, heightRelative, gap
@docs rounded, roundedSmall, roundedLarge, roundedFull, radius
@docs shadow, shadowLarge, shadowSmall


## Theming

@docs base, primary, secondary, success, warning, danger
@docs tint, solid
@docs background


## Padding

@docs pad, padSmall, padExtraSmall, padLarge, padExtraLarge
@docs padTop, padTopSmall, padTopExtraSmall, padTopLarge, padTopExtraLarge
@docs padLeft, padLeftSmall, padLeftExtraSmall, padLeftLarge, padLeftExtraLarge
@docs padRight, padRightSmall, padRightExtraSmall, padRightLarge, padRightExtraLarge
@docs padBottom, padBottomSmall, padBottomExtraSmall, padBottomLarge, padBottomExtraLarge
@docs padCustom


## Flex

@docs flex, FlexAttribute
@docs vertical, horizontal
@docs xyCenter
@docs xCenter, xLeft, xRight, xStretch, xSpaceBetween, xSpaceAround, xSpaceEvenly
@docs yCenter, yTop, yBottom, yStretch, ySpaceBetween, ySpaceAround, ySpaceEvenly
@docs grow


## Grid

@docs grid, GridAttribute


## Responsiveness

@docs largeScreen

-}

import Attr
import Html as H
import Html.Attributes as HA
import Html.Events as HE
import W.Internal.Helpers as WH
import W.Theme


{-| -}
type alias Attribute =
    Attr.Attr Attributes


{-| -}
type alias FlexAttribute =
    Attr.Attr FlexAttributes


{-| -}
type alias GridAttribute =
    Attr.Attr Attributes


type alias Attributes =
    { interactive : Bool
    , gap : String
    , radius : String
    , width : String
    , height : String
    , padding : Padding
    , inline : Bool
    , layout : Layout
    , shadowClass : String
    , colorClass : String
    , themeClass : String
    , background : String
    , largeScreen :
        Maybe
            { class : String
            , styles : List ( String, String )
            }
    }


defaultAttrs : Attributes
defaultAttrs =
    { interactive = False
    , gap = ""
    , radius = ""
    , width = ""
    , height = ""
    , padding = PaddingClass []
    , inline = False
    , layout = Default
    , shadowClass = ""
    , colorClass = ""
    , themeClass = ""
    , background = "transparent"
    , largeScreen = Nothing
    }


defaultInteractiveAttrs : Attributes
defaultInteractiveAttrs =
    { defaultAttrs
        | interactive = True
        , background = W.Theme.color.bg
    }


type Padding
    = PaddingClass (List String)
    | PaddingCustom String


type Layout
    = Default
    | Block
    | Grid
    | Flex FlexAttributes



-- Attrs : Sizing --------------------------------------------------------------


{-| Width in "rem".
-}
width : Float -> Attribute
width v =
    Attr.attr (\attrs -> { attrs | width = WH.rem v })


{-| Width in "%". Values should be 0.0 to 1.0.
-}
widthRelative : Float -> Attribute
widthRelative v =
    Attr.attr (\attrs -> { attrs | width = WH.pct v })


{-| Height in "rem".
-}
height : Float -> Attribute
height v =
    Attr.attr (\attrs -> { attrs | height = WH.rem v })


{-| Height in "%". Values should be 0.0 to 1.0.
-}
heightRelative : Float -> Attribute
heightRelative v =
    Attr.attr (\attrs -> { attrs | height = WH.pct v })



-- Attrs : Padding -------------------------------------------------------------


addPaddingClass : String -> Attribute
addPaddingClass v =
    Attr.attr
        (\attrs ->
            { attrs
                | padding =
                    case attrs.padding of
                        PaddingClass current ->
                            PaddingClass (v :: current)

                        _ ->
                            attrs.padding
            }
        )


{-| Padding in "rem".
-}
pad : Attribute
pad =
    addPaddingClass "w--p-md"


{-| Padding in "rem".
-}
padSmall : Attribute
padSmall =
    addPaddingClass "w--p-sm"


{-| Padding in "rem".
-}
padExtraSmall : Attribute
padExtraSmall =
    addPaddingClass "w--p-xs"


{-| Padding in "rem".
-}
padLarge : Attribute
padLarge =
    addPaddingClass "w--p-lg"


{-| Padding in "rem".
-}
padExtraLarge : Attribute
padExtraLarge =
    addPaddingClass "w--p-xl"


{-| Padding in "rem".
-}
padTop : Attribute
padTop =
    addPaddingClass "w--pt-md"


{-| Padding in "rem".
-}
padTopSmall : Attribute
padTopSmall =
    addPaddingClass "w--pt-sm"


{-| Padding in "rem".
-}
padTopExtraSmall : Attribute
padTopExtraSmall =
    addPaddingClass "w--pt-xs"


{-| Padding in "rem".
-}
padTopLarge : Attribute
padTopLarge =
    addPaddingClass "w--pt-lg"


{-| Padding in "rem".
-}
padTopExtraLarge : Attribute
padTopExtraLarge =
    addPaddingClass "w--pt-xl"


{-| Padding in "rem".
-}
padLeft : Attribute
padLeft =
    addPaddingClass "w--pl-md"


{-| Padding in "rem".
-}
padLeftSmall : Attribute
padLeftSmall =
    addPaddingClass "w--pl-sm"


{-| Padding in "rem".
-}
padLeftExtraSmall : Attribute
padLeftExtraSmall =
    addPaddingClass "w--pl-xs"


{-| Padding in "rem".
-}
padLeftLarge : Attribute
padLeftLarge =
    addPaddingClass "w--pl-lg"


{-| Padding in "rem".
-}
padLeftExtraLarge : Attribute
padLeftExtraLarge =
    addPaddingClass "w--pl-xl"


{-| Padding in "rem".
-}
padRight : Attribute
padRight =
    addPaddingClass "w--pr-md"


{-| Padding in "rem".
-}
padRightSmall : Attribute
padRightSmall =
    addPaddingClass "w--pr-sm"


{-| Padding in "rem".
-}
padRightExtraSmall : Attribute
padRightExtraSmall =
    addPaddingClass "w--pr-xs"


{-| Padding in "rem".
-}
padRightLarge : Attribute
padRightLarge =
    addPaddingClass "w--pr-lg"


{-| Padding in "rem".
-}
padRightExtraLarge : Attribute
padRightExtraLarge =
    addPaddingClass "w--pr-xl"


{-| Padding in "rem".
-}
padBottom : Attribute
padBottom =
    addPaddingClass "w--pb-md"


{-| Padding in "rem".
-}
padBottomSmall : Attribute
padBottomSmall =
    addPaddingClass "w--pb-sm"


{-| Padding in "rem".
-}
padBottomExtraSmall : Attribute
padBottomExtraSmall =
    addPaddingClass "w--pb-xs"


{-| Padding in "rem".
-}
padBottomLarge : Attribute
padBottomLarge =
    addPaddingClass "w--pb-lg"


{-| Padding in "rem".
-}
padBottomExtraLarge : Attribute
padBottomExtraLarge =
    addPaddingClass "w--pb-xl"


{-| Padding in "rem".
-}
padCustom :
    { top : Float
    , left : Float
    , right : Float
    , bottom : Float
    }
    -> Attribute
padCustom v =
    Attr.attr
        (\attrs ->
            { attrs
                | padding =
                    PaddingCustom
                        (WH.rem v.top
                            ++ " "
                            ++ WH.rem v.left
                            ++ " "
                            ++ WH.rem v.right
                            ++ " "
                            ++ WH.rem v.bottom
                        )
            }
        )



-- Attrs : Shadows -------------------------------------------------------------


{-| -}
shadowSmall : Attribute
shadowSmall =
    Attr.attr
        (\attrs ->
            if attrs.interactive then
                { attrs | shadowClass = "w--shadow active:w--shadow-sm" }

            else
                { attrs | shadowClass = "w--shadow" }
        )


{-| -}
shadow : Attribute
shadow =
    Attr.attr
        (\attrs ->
            if attrs.interactive then
                { attrs | shadowClass = "w--shadow-md active:w--shadow-sm" }

            else
                { attrs | shadowClass = "w--shadow" }
        )


{-| -}
shadowLarge : Attribute
shadowLarge =
    Attr.attr
        (\attrs ->
            if attrs.interactive then
                { attrs | shadowClass = "w--shadow-lg active:w--shadow-sm" }

            else
                { attrs | shadowClass = "w--shadow-lg" }
        )



-- Attrs : Rounded -------------------------------------------------------------


{-| -}
roundedSmall : Attribute
roundedSmall =
    Attr.attr (\attrs -> { attrs | radius = W.Theme.radius.xs })


{-| -}
rounded : Attribute
rounded =
    Attr.attr (\attrs -> { attrs | radius = W.Theme.radius.md })


{-| -}
roundedLarge : Attribute
roundedLarge =
    Attr.attr (\attrs -> { attrs | radius = W.Theme.radius.lg })


{-| -}
roundedFull : Attribute
roundedFull =
    Attr.attr (\attrs -> { attrs | radius = "9999px" })


{-| Radius in "rem".
-}
radius : Float -> Attribute
radius v =
    Attr.attr (\attrs -> { attrs | radius = WH.rem v })



-- Attrs : Layout -------------------------------------------------------------


{-| Gap size in "rem".
-}
gap : Float -> Attribute
gap v =
    Attr.attr (\attrs -> { attrs | gap = WH.rem v })


{-| -}
inline : Attribute
inline =
    Attr.attr (\attrs -> { attrs | inline = True })



-- Attrs : Themes & Variants ---------------------------------------------------


{-| -}
base : Attribute
base =
    Attr.attr (\attrs -> { attrs | colorClass = "w/base" })


{-| -}
primary : Attribute
primary =
    Attr.attr (\attrs -> { attrs | colorClass = "w/primary" })


{-| -}
secondary : Attribute
secondary =
    Attr.attr (\attrs -> { attrs | colorClass = "w/secondary" })


{-| -}
success : Attribute
success =
    Attr.attr (\attrs -> { attrs | colorClass = "w/success" })


{-| -}
warning : Attribute
warning =
    Attr.attr (\attrs -> { attrs | colorClass = "w/warning" })


{-| -}
danger : Attribute
danger =
    Attr.attr (\attrs -> { attrs | colorClass = "w/danger" })


{-| -}
tint : Attribute
tint =
    Attr.attr (\attrs -> { attrs | themeClass = "w/tint" })


{-| -}
solid : Attribute
solid =
    Attr.attr (\attrs -> { attrs | themeClass = "w/solid" })


{-| -}
background : String -> Attribute
background v =
    Attr.attr (\attrs -> { attrs | background = v })



-- Attrs : Flex ---------------------------------------------------------------


type alias FlexAttributes =
    { wrap : Maybe Bool
    , vertical : Maybe Bool
    , verticalAlignment : Maybe FlexAlignment
    , horizontalAlignment : Maybe FlexAlignment
    }


flexDefaultAttrs : FlexAttributes
flexDefaultAttrs =
    { wrap = Nothing
    , vertical = Nothing
    , verticalAlignment = Nothing
    , horizontalAlignment = Nothing
    }


type FlexAlignment
    = Start
    | Center
    | End
    | SpaceBetween
    | SpaceAround
    | SpaceEvenly
    | Stretch


{-|

    W.Box.view
        [ W.Box.flex
            [ W.Box.xLeft
            , W.Box.yBottom
            ]
        ]

-}
flex : List FlexAttribute -> Attribute
flex =
    Attr.withAttrs flexDefaultAttrs
        (\flexAttrs ->
            Attr.attr
                (\attrs ->
                    { attrs | layout = Flex flexAttrs }
                )
        )


{-| -}
vertical : FlexAttribute
vertical =
    Attr.attr (\attrs -> { attrs | vertical = Just True })


{-| -}
horizontal : FlexAttribute
horizontal =
    Attr.attr (\attrs -> { attrs | vertical = Just False })


{-| -}
xyCenter : FlexAttribute
xyCenter =
    Attr.attr
        (\attrs ->
            { attrs
                | verticalAlignment = Just Center
                , horizontalAlignment = Just Center
            }
        )


{-| -}
xLeft : FlexAttribute
xLeft =
    Attr.attr (\attrs -> { attrs | horizontalAlignment = Just Start })


{-| -}
xRight : FlexAttribute
xRight =
    Attr.attr (\attrs -> { attrs | horizontalAlignment = Just End })


{-| -}
xCenter : FlexAttribute
xCenter =
    Attr.attr (\attrs -> { attrs | horizontalAlignment = Just Center })


{-| -}
xSpaceAround : FlexAttribute
xSpaceAround =
    Attr.attr (\attrs -> { attrs | horizontalAlignment = Just SpaceAround })


{-| -}
xSpaceEvenly : FlexAttribute
xSpaceEvenly =
    Attr.attr (\attrs -> { attrs | horizontalAlignment = Just SpaceEvenly })


{-| -}
xSpaceBetween : FlexAttribute
xSpaceBetween =
    Attr.attr (\attrs -> { attrs | horizontalAlignment = Just SpaceBetween })


{-| -}
xStretch : FlexAttribute
xStretch =
    Attr.attr (\attrs -> { attrs | horizontalAlignment = Just Stretch })


{-| -}
yTop : FlexAttribute
yTop =
    Attr.attr (\attrs -> { attrs | verticalAlignment = Just Start })


{-| -}
yBottom : FlexAttribute
yBottom =
    Attr.attr (\attrs -> { attrs | verticalAlignment = Just End })


{-| -}
yCenter : FlexAttribute
yCenter =
    Attr.attr (\attrs -> { attrs | verticalAlignment = Just Center })


{-| -}
ySpaceAround : FlexAttribute
ySpaceAround =
    Attr.attr (\attrs -> { attrs | verticalAlignment = Just SpaceAround })


{-| -}
ySpaceBetween : FlexAttribute
ySpaceBetween =
    Attr.attr (\attrs -> { attrs | verticalAlignment = Just SpaceBetween })


{-| -}
ySpaceEvenly : FlexAttribute
ySpaceEvenly =
    Attr.attr (\attrs -> { attrs | verticalAlignment = Just SpaceEvenly })


{-| -}
yStretch : FlexAttribute
yStretch =
    Attr.attr (\attrs -> { attrs | verticalAlignment = Just Stretch })


flexAlignmentClass : FlexAttributes -> List String
flexAlignmentClass attrs =
    case attrs.vertical of
        Just True ->
            [ "w--flex-col", mainAxisAlignment attrs.verticalAlignment, crossAxisAlignment attrs.horizontalAlignment ]

        _ ->
            [ "w--flex-row", mainAxisAlignment attrs.horizontalAlignment, crossAxisAlignment attrs.verticalAlignment ]


mainAxisAlignment : Maybe FlexAlignment -> String
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


crossAxisAlignment : Maybe FlexAlignment -> String
crossAxisAlignment v =
    case v of
        Just Start ->
            "w--items-start"

        Just Center ->
            "w--items-center"

        Just End ->
            "w--items-end"

        Just SpaceBetween ->
            "w--items-start"

        Just SpaceAround ->
            "w--items-start"

        Just SpaceEvenly ->
            "w--items-start"

        Just Stretch ->
            "w--items-stretch"

        Nothing ->
            "w--items-center"



-- Attrs : Responsiveness ------------------------------------------------------


{-| -}
largeScreen : List Attribute -> Attribute
largeScreen =
    Attr.withAttrs defaultAttrs
        (\largeAttrs ->
            Attr.attr
                (\attrs ->
                    { attrs
                        | largeScreen =
                            Just
                                { class =
                                    String.join " "
                                        [ largeLayoutClass largeAttrs
                                        , largePaddingClass largeAttrs
                                        ]
                                , styles =
                                    styleList largeAttrs
                                        [ ( "--lg-width", .width )
                                        , ( "--lg-height", .height )
                                        , ( "--lg-gap", .gap )
                                        ]
                                }
                    }
                )
        )


largeLayoutClass : Attributes -> String
largeLayoutClass attrs =
    case attrs.layout of
        Default ->
            ""

        _ ->
            layoutClass "lg:" attrs


largePaddingClass : Attributes -> String
largePaddingClass attrs =
    case attrs.padding of
        PaddingClass [] ->
            ""

        _ ->
            paddingClass "lg:" attrs



-- Attrs : Grid ---------------------------------------------------------------


block : Attribute
block =
    Attr.attr (\attrs -> { attrs | layout = Block })


grid : Attribute
grid =
    Attr.attr (\attrs -> { attrs | layout = Grid })



-- Views


viewButton : List Attribute -> { onClick : msg, content : List (H.Html msg) } -> H.Html msg
viewButton =
    Attr.withAttrs defaultInteractiveAttrs
        (\attrs props ->
            H.button
                (HE.onClick props.onClick :: baseAttrs attrs)
                props.content
        )


viewLink : List Attribute -> { href : String, content : List (H.Html msg) } -> H.Html msg
viewLink =
    Attr.withAttrs defaultInteractiveAttrs
        (\attrs props ->
            H.a
                (HA.href props.href :: HA.class "w--no-underline" :: baseAttrs attrs)
                props.content
        )


view : List Attribute -> List (H.Html msg) -> H.Html msg
view =
    Attr.withAttrs defaultAttrs
        (\attrs children ->
            H.div (baseAttrs attrs) children
        )


baseAttrs : Attributes -> List (H.Attribute msg)
baseAttrs attrs =
    [ HA.class "w--box w--box-border w--shadow-shadow/30"
    , HA.class (layoutClass "" attrs)
    , HA.class (paddingClass "" attrs)
    , HA.class attrs.shadowClass
    , HA.class attrs.themeClass
    , HA.class attrs.colorClass
    , WH.maybeAttr
        (\lg -> HA.class lg.class)
        attrs.largeScreen
    , [ [ ( "--gap", attrs.gap )
        , ( "--width", attrs.width )
        , ( "--height", attrs.height )
        , ( "border-radius", attrs.radius )
        ]
      , bgStyles attrs
      , attrs.largeScreen
            |> Maybe.map .styles
            |> Maybe.withDefault []
      ]
        |> List.concat
        |> W.Theme.styleList
    ]


paddingClass : String -> Attributes -> String
paddingClass prefix attrs =
    case attrs.padding of
        PaddingCustom v ->
            prefix ++ v

        PaddingClass classes ->
            prefix ++ String.join (" " ++ prefix) classes


bgStyles : Attributes -> List ( String, String )
bgStyles attrs =
    if attrs.themeClass == "" && attrs.colorClass == "" then
        [ ( "background", attrs.background ) ]

    else
        []


layoutClass : String -> Attributes -> String
layoutClass prefix attrs =
    let
        classes : List String
        classes =
            case ( attrs.layout, attrs.inline ) of
                ( Grid, _ ) ->
                    [ "w--grid", "w--grid-cols-12" ]

                ( Flex flexAttrs, False ) ->
                    "w--flex" :: flexAlignmentClass flexAttrs

                ( Flex flexAttrs, True ) ->
                    "w--inline-flex" :: flexAlignmentClass flexAttrs

                ( _, False ) ->
                    [ "w--block" ]

                ( _, True ) ->
                    [ "w--inline-block" ]
    in
    prefix ++ String.join (" " ++ prefix) classes



-- Helpers --------------------------------------------------------------------


styleList : Attributes -> List ( String, Attributes -> String ) -> List ( String, String )
styleList attrs list =
    List.filterMap (\( k, v ) -> maybeStyle k v attrs) list


maybeStyle : String -> (Attributes -> String) -> Attributes -> Maybe ( String, String )
maybeStyle key toValue attrs =
    if toValue attrs /= "" then
        Just ( key, toValue attrs )

    else
        Nothing



-- ----------------------------------------------------------------------------
--
-- Tailwind pre-compile
-- This classes will be recognized by tailwind and included in the bundle.
--
-- w--p-md w--p-sm w--p-xs w--p-lg w--p-xl
-- w--pt-md w--pt-sm w--pt-xs w--pt-lg w--pt-xl
-- w--pl-md w--pl-sm w--pl-xs w--pl-lg w--pl-xl
-- w--pr-md w--pr-sm w--pr-xs w--pr-lg w--pr-xl
-- w--pb-md w--pb-sm w--pb-xs w--pb-lg w--pb-xl
--
-- lg:w--p-md lg:w--p-sm lg:w--p-xs lg:w--p-lg lg:w--p-xl
-- lg:w--pt-md lg:w--pt-sm lg:w--pt-xs lg:w--pt-lg lg:w--pt-xl
-- lg:w--pl-md lg:w--pl-sm lg:w--pl-xs lg:w--pl-lg lg:w--pl-xl
-- lg:w--pr-md lg:w--pr-sm lg:w--pr-xs lg:w--pr-lg lg:w--pr-xl
-- lg:w--pb-md lg:w--pb-sm lg:w--pb-xs lg:w--pb-lg lg:w--pb-xl
--
-- w--block w--grid w--flex w--inline-flex
-- lg:w--block lg:w--grid lg:w--flex lg:w--inline-flex
--
-- w--flex-col w--flex-row
-- w--items-center w--items-start w--items-end w--items-stretch
-- w--justify-center w--justify-start w--justify-end w--justify-stretch
-- w--justify-between w--justify-around w--justify-evenly
--
-- lg:w--flex-col lg:w--flex-row
-- lg:w--items-center lg:w--items-start lg:w--items-end lg:w--items-stretch
-- lg:w--justify-center lg:w--justify-start lg:w--justify-end lg:w--justify-stretch
-- lg:w--justify-between lg:w--justify-around lg:w--justify-evenly
--
-- ----------------------------------------------------------------------------
