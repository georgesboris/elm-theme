module W.Theme.Sizing exposing
    ( SizingScale
    , Sizing
    , none, xs, sm, md, lg, xl, xl2, xl3, full, custom
    , toCSS
    )

{-| Spacing sizes are used for sizing elements. This value is most commonly used for setting an element's `max-width` style.

**Defined in `rem` units**.

@docs SizingScale


# Sizing

Use `Sizing` as an opaque type when creating a component that receives it as an argument.
That way you can make sure conflicting tokens like radiuses or spacings are not being used in the wrong place:

    W.Box.view
        [ W.Box.maxWidth W.Theme.Sizing.lg ]
        [ ... ]

The value can be transformed into a CSS value later:

    Html.div
        [ W.Theme.styleList
            [ ( "max-width"
              , W.Theme.Radius.toCSS maxWidthValue
              )
            ]
        ]

@docs Sizing
@docs none, xs, sm, md, lg, xl, xl2, xl3, full, custom
@docs toCSS

-}

import W.Internal.Helpers as WH


{-| -}
type alias SizingScale =
    { xs : Float -- small ui elements
    , sm : Float -- regular ui elements and small cards
    , md : Float -- large ui elements and regular cards
    , lg : Float -- large cards
    , xl : Float -- mostly unused
    , xl2 : Float -- mostly unused
    , xl3 : Float -- mostly unused
    }


{-| -}
type Sizing
    = Sizing String


{-| -}
none : Sizing
none =
    Sizing "0px"


{-| -}
xs : Sizing
xs =
    Sizing (WH.cssValue "sizing-xs")


{-| -}
sm : Sizing
sm =
    Sizing (WH.cssValue "sizing-sm")


{-| -}
md : Sizing
md =
    Sizing (WH.cssValue "sizing-md")


{-| -}
lg : Sizing
lg =
    Sizing (WH.cssValue "sizing-lg")


{-| -}
xl : Sizing
xl =
    Sizing (WH.cssValue "sizing-xl")


{-| -}
xl2 : Sizing
xl2 =
    Sizing (WH.cssValue "sizing-2xl")


{-| -}
xl3 : Sizing
xl3 =
    Sizing (WH.cssValue "sizing-3xl")


{-| -}
full : Sizing
full =
    Sizing "100%"


{-| A custom value using `rem` as unit.

Although discouraged in a design system, it is useful to provide visibility for custom values. That way you can quickly search for edge cases where your team is using values outside your default scale.

-}
custom : Float -> Sizing
custom v =
    Sizing (WH.rem v)


{-| -}
toCSS : Sizing -> String
toCSS (Sizing v) =
    v
