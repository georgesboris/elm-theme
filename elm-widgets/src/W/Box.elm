module W.Box exposing
    ( view, viewButton, viewLink, Attribute
    , width, widthRelative, widthFull, minWidth, maxWidth
    , height, heightRelative, heightFull, heightScreen
    , square
    , border, borderColor, borderLarge, borderSmall, borderStrong, borderSubtle
    , rounded, roundedExtraSmall, roundedSmall, roundedLarge, roundedExtraLarge, roundedFull, radius
    , shadow, shadowLarge, shadowSmall
    , base, primary, secondary, success, warning, danger
    , tint, solid
    , background
    , padding
    , xPadding, yPadding
    , topPadding, rightPadding, bottomPadding, leftPadding
    , gap
    , inline, block
    , flex, FlexAttribute
    , grid, GridAttribute
    , vertical, horizontal
    , xyCenter
    , xCenter, xLeft, xRight, xStretch, xSpaceBetween, xSpaceAround, xSpaceEvenly
    , yCenter, yTop, yBottom, yStretch, ySpaceBetween, ySpaceAround, ySpaceEvenly
    , grow, growAttr
    , columns, columnEnd, columnSpan, columnStart
    , largeScreen
    , asAttrs, class, styles
    , classList, heightCustom, widthCustom
    )

{-|


### Table of Contents

  - [Sizing](#sizing)
  - [Decoration](#decoration)
  - [Theming](#theming)
  - [Padding](#padding)
  - [Layout](#layout)
      - [Flex](#flex)
      - [Grid](#grid)
  - [Responsiveness](#responsiveness)

---

@docs view, viewButton, viewLink, Attribute


## Sizing

@docs width, widthRelative, widthFull, minWidth, maxWidth
@docs height, heightRelative, heightFull, heightScreen
@docs square


## Decorations


### Borders

@docs border, borderColor, borderLarge, borderSmall, borderStrong, borderSubtle


### Border Radius

@docs rounded, roundedExtraSmall, roundedSmall, roundedLarge, roundedExtraLarge, roundedFull, radius


### Shadows

@docs shadow, shadowLarge, shadowSmall


## Theming

@docs base, primary, secondary, success, warning, danger
@docs tint, solid
@docs background


## Padding

@docs padding
@docs xPadding, yPadding
@docs topPadding, rightPadding, bottomPadding, leftPadding


## Layout

@docs gap
@docs inline, block
@docs flex, FlexAttribute
@docs grid, GridAttribute


## Flex

@docs flex, FlexAttribute
@docs vertical, horizontal
@docs xyCenter
@docs xCenter, xLeft, xRight, xStretch, xSpaceBetween, xSpaceAround, xSpaceEvenly
@docs yCenter, yTop, yBottom, yStretch, ySpaceBetween, ySpaceAround, ySpaceEvenly
@docs grow, growAttr


## Grid

@docs columns, columnEnd, columnSpan, columnStart


## Responsiveness

@docs largeScreen


## Customizing

@docs asAttrs, class, styles

-}

import Attr
import Html as H
import Html.Attributes as HA
import Html.Events as HE
import W.Internal.Helpers as WH
import W.Radius
import W.Sizing
import W.Spacing
import W.Theme


{-| -}
type alias Attribute =
    Attr.Attr Attributes


type alias Attributes =
    { interactive : Bool
    , gap : String
    , radius : String
    , width : String
    , height : String
    , padding : Maybe Offset
    , inline : Bool
    , layout : Layout
    , borderClass : String
    , shadowClass : String
    , colorClass : String
    , themeClass : String
    , background : String
    , columns : String
    , largeScreen :
        Maybe
            { class : String
            , styles : List ( String, String )
            }
    , styles : List ( String, String )
    , staticClasses : List String
    , classes : List String
    , variables : List ( String, String )
    }


defaultAttrs : Attributes
defaultAttrs =
    { interactive = False
    , gap = ""
    , radius = ""
    , width = ""
    , height = ""
    , padding = Nothing
    , inline = False
    , layout = Default
    , shadowClass = ""
    , borderClass = ""
    , colorClass = ""
    , themeClass = ""
    , columns = ""
    , background = "transparent"
    , largeScreen = Nothing
    , styles = []
    , staticClasses = []
    , classes = []
    , variables = []
    }


defaultInteractiveAttrs : Attributes
defaultInteractiveAttrs =
    { defaultAttrs
        | interactive = True
        , background = W.Theme.color.bg
    }


type Padding
    = PaddingClass (List String)
    | PaddingCustom Offset


type alias Offset =
    { top : String
    , right : String
    , bottom : String
    , left : String
    }


offsetZero : Offset
offsetZero =
    { top = "0px"
    , right = "0px"
    , bottom = "0px"
    , left = "0px"
    }


offsetAuto : Offset
offsetAuto =
    { top = "auto"
    , right = "auto"
    , bottom = "auto"
    , left = "auto"
    }


offsetToCSS : Offset -> String
offsetToCSS v =
    v.top
        ++ " "
        ++ v.right
        ++ " "
        ++ v.bottom
        ++ " "
        ++ v.left


type Layout
    = Default
    | Block
    | Flex FlexAttributes
    | Grid GridAttributes



-- Attrs : Base --------------------------------------------------------------


{-| Pass in extra CSS styles. Note: these styles might conflict with W.Box's own styles.
-}
styles : List ( String, String ) -> Attribute
styles v =
    Attr.attr (\attrs -> { attrs | styles = v })


{-| Pass in extra classes. Note: these styles might conflict with W.Box's own styles.
-}
class : String -> Attribute
class v =
    Attr.attr (\attrs -> { attrs | staticClasses = v :: attrs.staticClasses })


{-| Pass in extra classes using conditionals. Note: these styles might conflict with W.Box's own styles.
-}
classList : List ( String, Bool ) -> Attribute
classList list =
    Attr.attr
        (\attrs ->
            { attrs
                | staticClasses =
                    list
                        |> List.filterMap
                            (\( x, cond ) ->
                                if cond then
                                    Just x

                                else
                                    Nothing
                            )
                        |> List.append attrs.staticClasses
            }
        )



-- Attrs : Sizing --------------------------------------------------------------


{-| Width in "rem".
-}
width : Float -> Attribute
width v =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-width", WH.rem v ) :: attrs.variables })


{-| Pass in a custom width value.
-}
widthCustom : String -> Attribute
widthCustom v =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-width", v ) :: attrs.variables })


{-| Width in "%". Values should be 0.0 to 1.0.
-}
widthRelative : Float -> Attribute
widthRelative v =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-width", WH.pct v ) :: attrs.variables })


{-| -}
minWidth : W.Sizing.Sizing -> Attribute
minWidth v =
    Attr.attr
        (\attrs ->
            { attrs
                | staticClasses = "w--box-min-width" :: attrs.staticClasses
                , variables = ( "--w-min-width", W.Sizing.toCSS v ) :: attrs.variables
            }
        )


{-| -}
maxWidth : W.Sizing.Sizing -> Attribute
maxWidth v =
    Attr.attr
        (\attrs ->
            { attrs
                | staticClasses = "w--box-max-width" :: attrs.staticClasses
                , variables = ( "--w-max-width", W.Sizing.toCSS v ) :: attrs.variables
            }
        )


{-| Sets width as 100% of relative container.
-}
widthFull : Attribute
widthFull =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-width", WH.pct 1.0 ) :: attrs.variables })


{-| Height in "rem".
-}
height : Float -> Attribute
height v =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-height", WH.rem v ) :: attrs.variables })


{-| Pass in a custom height value.
-}
heightCustom : String -> Attribute
heightCustom v =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-height", v ) :: attrs.variables })


{-| Height in "%". Values should be 0.0 to 1.0.
-}
heightRelative : Float -> Attribute
heightRelative v =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-height", WH.pct v ) :: attrs.variables })


{-| Sets height as 100% of relative container.
-}
heightFull : Attribute
heightFull =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-height", WH.pct 1.0 ) :: attrs.variables })


{-| Sets minimum height as 100% of screen size.
-}
heightScreen : Attribute
heightScreen =
    Attr.attr (\attrs -> { attrs | classes = "w--min-h-screen" :: attrs.classes })


{-| Sets aspect ratio for the box as 1:1.
-}
square : Attribute
square =
    Attr.attr (\attrs -> { attrs | classes = "w--aspect-square" :: attrs.classes })



-- Attrs : Padding -------------------------------------------------------------


updatePadding : (Offset -> Offset) -> Attribute
updatePadding fn =
    Attr.attr
        (\attrs ->
            { attrs
                | padding =
                    attrs.padding
                        |> Maybe.withDefault offsetZero
                        |> fn
                        |> Just
            }
        )


{-| -}
padding : W.Spacing.Spacing -> Attribute
padding v =
    let
        value : String
        value =
            W.Spacing.toCSS v
    in
    updatePadding (\_ -> { top = value, left = value, bottom = value, right = value })


{-| -}
xPadding : W.Spacing.Spacing -> Attribute
xPadding v =
    let
        value : String
        value =
            W.Spacing.toCSS v
    in
    updatePadding (\p -> { p | left = value, right = value })


{-| -}
yPadding : W.Spacing.Spacing -> Attribute
yPadding v =
    updatePadding (\p -> { p | top = W.Spacing.toCSS v, bottom = W.Spacing.toCSS v })


{-| -}
topPadding : W.Spacing.Spacing -> Attribute
topPadding v =
    updatePadding (\p -> { p | top = W.Spacing.toCSS v })


{-| -}
leftPadding : W.Spacing.Spacing -> Attribute
leftPadding v =
    updatePadding (\p -> { p | left = W.Spacing.toCSS v })


{-| -}
bottomPadding : W.Spacing.Spacing -> Attribute
bottomPadding v =
    updatePadding (\p -> { p | bottom = W.Spacing.toCSS v })


{-| -}
rightPadding : W.Spacing.Spacing -> Attribute
rightPadding v =
    updatePadding (\p -> { p | right = W.Spacing.toCSS v })



-- Attrs : Borders -------------------------------------------------------------


{-| -}
borderSmall : Attribute
borderSmall =
    Attr.attr
        (\attrs ->
            { attrs | borderClass = "w--border-[1px] w--border-solid" }
        )


{-| -}
border : Attribute
border =
    Attr.attr
        (\attrs ->
            { attrs | borderClass = "w--border-[2px] w--border-solid" }
        )


{-| -}
borderLarge : Attribute
borderLarge =
    Attr.attr
        (\attrs ->
            { attrs | borderClass = "w--border-[3px] w--border-solid" }
        )


{-| -}
borderSubtle : Attribute
borderSubtle =
    Attr.attr
        (\attrs ->
            { attrs | variables = ( "--w-border-color", W.Theme.color.accentSubtle ) :: attrs.variables }
        )


{-| -}
borderStrong : Attribute
borderStrong =
    Attr.attr
        (\attrs ->
            { attrs | variables = ( "--w-border-color", W.Theme.color.accentStrong ) :: attrs.variables }
        )


{-| -}
borderColor : String -> Attribute
borderColor color =
    Attr.attr
        (\attrs ->
            { attrs | variables = ( "--w-border-color", color ) :: attrs.variables }
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
radius : W.Radius.Radius -> Attribute
radius v =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-radius", W.Radius.toCSS v ) :: attrs.variables })


{-| -}
roundedExtraSmall : Attribute
roundedExtraSmall =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-radius", W.Theme.radius.xs ) :: attrs.variables })


{-| -}
roundedSmall : Attribute
roundedSmall =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-radius", W.Theme.radius.sm ) :: attrs.variables })


{-| -}
rounded : Attribute
rounded =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-radius", W.Theme.radius.md ) :: attrs.variables })


{-| -}
roundedLarge : Attribute
roundedLarge =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-radius", W.Theme.radius.lg ) :: attrs.variables })


{-| -}
roundedExtraLarge : Attribute
roundedExtraLarge =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-radius", W.Theme.radius.xl ) :: attrs.variables })


{-| -}
roundedFull : Attribute
roundedFull =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-radius", "9999px" ) :: attrs.variables })



-- Attrs : Layout -------------------------------------------------------------


{-| Gap size in "rem".
-}
gap : W.Spacing.Spacing -> Attribute
gap v =
    Attr.attr (\attrs -> { attrs | variables = ( "--w-gap", W.Spacing.toCSS v ) :: attrs.variables })


{-| -}
inline : Attribute
inline =
    Attr.attr (\attrs -> { attrs | inline = True })


{-| -}
block : Attribute
block =
    Attr.attr (\attrs -> { attrs | layout = Block })



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



-- Attrs : Grid ----------------------------------------------------------------


{-| -}
type alias GridAttribute =
    Attr.Attr GridAttributes


type alias GridAttributes =
    { columns : String
    }


gridDefaultAttrs : GridAttributes
gridDefaultAttrs =
    { columns = "repeat(12, minmax(0, 1fr))"
    }


grid : List GridAttribute -> Attribute
grid =
    Attr.withAttrs gridDefaultAttrs
        (\gridAttrs ->
            Attr.attr
                (\attrs ->
                    { attrs | layout = Grid gridAttrs }
                )
        )


columns : Int -> GridAttribute
columns v =
    Attr.attr (\attrs -> { attrs | columns = "repeat(" ++ String.fromInt v ++ ", minmax(0, 1fr))" })


columnSpan : Int -> Attribute
columnSpan v =
    Attr.attr
        (\attrs ->
            { attrs
                | staticClasses = "w--grid-span" :: attrs.staticClasses
                , variables =
                    ( "--w-col-span"
                    , "span " ++ String.fromInt v ++ " / span " ++ String.fromInt v
                    )
                        :: attrs.variables
            }
        )


columnStart : Int -> Attribute
columnStart v =
    Attr.attr
        (\attrs ->
            { attrs
                | staticClasses = "w--grid-start" :: attrs.staticClasses
                , variables = ( "--w-col-start", String.fromInt v ) :: attrs.variables
            }
        )


columnEnd : Int -> Attribute
columnEnd v =
    Attr.attr
        (\attrs ->
            { attrs
                | staticClasses = "w--grid-end" :: attrs.staticClasses
                , variables = ( "--w-col-end", String.fromInt v ) :: attrs.variables
            }
        )



-- Attrs : Flex ---------------------------------------------------------------


{-| -}
type alias FlexAttribute =
    Attr.Attr FlexAttributes


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
grow : Attribute
grow =
    Attr.attr
        (\attrs ->
            { attrs | classes = "w--grow" :: attrs.classes }
        )


{-| -}
growAttr : H.Attribute msg
growAttr =
    HA.class "w--grow"


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
                                    [ alignmentClasses largeAttrs
                                    , paddingClasses largeAttrs
                                    , largeAttrs.classes
                                    ]
                                        |> List.concat
                                        |> List.map ((++) "lg:")
                                        |> List.append attrs.staticClasses
                                        |> String.join " "
                                , styles =
                                    [ styleList largeAttrs
                                        [ ( "--lg-w-gap", .gap )
                                        ]
                                    , [ largeAttrs.variables
                                      , layoutVariables largeAttrs
                                      , paddingVariables attrs
                                      ]
                                        |> List.concat
                                        |> List.map (Tuple.mapFirst (\s -> "--lg-" ++ String.dropLeft 2 s))
                                    ]
                                        |> List.concat
                                }
                    }
                )
        )



-- Views


view : List Attribute -> List (H.Html msg) -> H.Html msg
view =
    Attr.withAttrs defaultAttrs
        (\attrs children ->
            H.div (baseAttrs attrs) children
        )


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


{-| Use `W.Box` as an utility for any element.

Use carefully. Don't mix it with `Html.Attribute.style` otherwise the default styles won't be applied.

-}
asAttrs : List Attribute -> List (H.Attribute msg)
asAttrs =
    Attr.withAttrs defaultAttrs baseAttrs


baseAttrs : Attributes -> List (H.Attribute msg)
baseAttrs attrs =
    [ HA.class "w--box"
    , HA.class (layoutClass attrs)
    , [ attrs.classes
      , attrs.staticClasses
      , paddingClasses attrs
      , alignmentClasses attrs
      ]
        |> List.concat
        |> String.join " "
        |> HA.class
    , HA.class attrs.borderClass
    , HA.class attrs.shadowClass
    , HA.class attrs.themeClass
    , HA.class attrs.colorClass
    , WH.maybeAttr (\lg -> HA.class lg.class) attrs.largeScreen
    , [ attrs.styles
      , attrVars attrs
      , attrs.largeScreen
            |> Maybe.map .styles
            |> Maybe.withDefault []
      ]
        |> List.concat
        |> W.Theme.styleList
    ]


attrVars : Attributes -> List ( String, String )
attrVars attrs =
    [ bgStyles attrs
    , layoutVariables attrs
    , paddingVariables attrs
    , attrs.variables
    ]
        |> List.concat


paddingVariables : Attributes -> List ( String, String )
paddingVariables attrs =
    case attrs.padding of
        Just v ->
            [ ( "--w-padding", offsetToCSS v ) ]

        Nothing ->
            []


paddingClasses : Attributes -> List String
paddingClasses attrs =
    case attrs.padding of
        Just _ ->
            [ "w--box-padding" ]

        Nothing ->
            []


bgStyles : Attributes -> List ( String, String )
bgStyles attrs =
    if attrs.themeClass == "" then
        [ ( "background", attrs.background ) ]

    else
        []


layoutClass : Attributes -> String
layoutClass attrs =
    case ( attrs.layout, attrs.inline ) of
        ( Flex _, False ) ->
            "w--flex"

        ( Flex _, True ) ->
            "w--inline-flex"

        ( Grid _, _ ) ->
            "w--grid"

        ( _, False ) ->
            "w--block"

        ( _, True ) ->
            "w--inline-block"


alignmentClasses : Attributes -> List String
alignmentClasses attrs =
    case attrs.layout of
        Flex flexAttrs ->
            flexAlignmentClass flexAttrs

        _ ->
            []


layoutVariables : Attributes -> List ( String, String )
layoutVariables attrs =
    case attrs.layout of
        Grid gridAttrs ->
            [ ( "--w-columns", gridAttrs.columns ) ]

        _ ->
            []



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
-- lg:w--aspect-square
-- lg:w--min-h-screen
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
-- w--block w--flex w--inline-flex
-- lg:w--block lg:w--flex lg:w--inline-flex
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
