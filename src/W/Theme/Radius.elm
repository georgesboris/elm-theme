module W.Theme.Radius exposing
    ( RadiusScale
    , Radius
    , none, xs, sm, md, lg, xl, xl2, xl3, full, custom
    , toCSS
    )

{-| Radius sizes are used for rounding the borders of different components.

**Defined in `rem` units**.

@docs RadiusScale

The default radius scale matches the default spacing scale. So the `sm` spacing would look good with the `sm` radius. This match is not required though - feel free to mix them.


# Radius

Use `Radius` as an opaque type when creating a component that receives it as an argument.
That way you can make sure conflicting tokens like sizings or spacings are not being used in the wrong place:

    W.Box.view
        [ W.Box.radius W.Theme.Radius.sm ]
        [ ... ]

The value can be transformed into a CSS value later:

    Html.div
        [ W.Theme.styleList
            [ ( "border-radius"
              , W.Theme.Radius.toCSS radiusValue
              )
            ]
        ]

@docs Radius
@docs none, xs, sm, md, lg, xl, xl2, xl3, full, custom
@docs toCSS

-}

import W.Internal.Helpers as WH


{-| -}
type alias RadiusScale =
    { xs : Float -- small ui elements
    , sm : Float -- regular ui elements and small cards
    , md : Float -- large ui elements and regular cards
    , lg : Float -- large cards
    , xl : Float -- mostly unused
    , xl2 : Float -- mostly unused
    , xl3 : Float -- mostly unused
    }


{-| -}
type Radius
    = Radius String


{-| -}
none : Radius
none =
    Radius "0px"


{-| -}
xs : Radius
xs =
    Radius (WH.cssValue "radius-xs")


{-| -}
sm : Radius
sm =
    Radius (WH.cssValue "radius-sm")


{-| -}
md : Radius
md =
    Radius (WH.cssValue "radius-md")


{-| -}
lg : Radius
lg =
    Radius (WH.cssValue "radius-lg")


{-| -}
xl : Radius
xl =
    Radius (WH.cssValue "radius-xl")


{-| -}
xl2 : Radius
xl2 =
    Radius (WH.cssValue "radius-2xl")


{-| -}
xl3 : Radius
xl3 =
    Radius (WH.cssValue "radius-3xl")


{-| -}
full : Radius
full =
    Radius "9999px"


{-| A custom value using `rem` as unit.

Although discouraged in a design system, it is useful to provide visibility for custom values. That way you can quickly search for edge cases where your team is using values outside your default scale.

-}
custom : Float -> Radius
custom v =
    Radius (WH.rem v)


{-| -}
toCSS : Radius -> String
toCSS (Radius v) =
    v
