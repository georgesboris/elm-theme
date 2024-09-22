module W.Theme.Spacing exposing
    ( SpacingScale
    , Spacing
    , none, xs, sm, md, lg, xl, xl2, xl3, custom
    , toCSS
    )

{-| Spacing sizes are used for spacing elements, not sizing them. These values are mainly used for setting the `gap`, `padding` and `margin` styles.

**Defined in `rem` units**.

@docs SpacingScale


# Spacing

Use `Spacing` as an opaque type when creating a component that receives it as an argument.
That way you can make sure conflicting tokens like radius or spacings are not being used in the wrong place:

    W.Box.view
        [ W.Box.padding W.Theme.Spacing.sm ]
        [ ... ]

The value can be transformed into a CSS value later:

    Html.div
        [ W.Theme.styleList
            [ ( "padding"
              , W.Theme.Spacing.toCSS paddingValue
              )
            ]
        ]

@docs Spacing
@docs none, xs, sm, md, lg, xl, xl2, xl3, custom
@docs toCSS

-}

import W.Internal.Helpers as WH


{-| -}
type alias SpacingScale =
    { xs : Float -- small ui elements
    , sm : Float -- regular ui elements and small cards
    , md : Float -- large ui elements and regular cards
    , lg : Float -- large cards
    , xl : Float -- mostly unused
    , xl2 : Float -- mostly unused
    , xl3 : Float -- mostly unused
    }


{-| -}
type Spacing
    = Spacing String


{-| -}
none : Spacing
none =
    Spacing "0px"


{-| -}
xs : Spacing
xs =
    Spacing (WH.cssValue "spacing-xs")


{-| -}
sm : Spacing
sm =
    Spacing (WH.cssValue "spacing-sm")


{-| -}
md : Spacing
md =
    Spacing (WH.cssValue "spacing-md")


{-| -}
lg : Spacing
lg =
    Spacing (WH.cssValue "spacing-lg")


{-| -}
xl : Spacing
xl =
    Spacing (WH.cssValue "spacing-xl")


{-| -}
xl2 : Spacing
xl2 =
    Spacing (WH.cssValue "spacing-2xl")


{-| -}
xl3 : Spacing
xl3 =
    Spacing (WH.cssValue "spacing-3xl")


{-| A custom value using `rem` as unit.

Although discouraged in a design system, it is useful to provide visibility for custom values. That way you can quickly search for edge cases where your team is using values outside your default scale.

-}
custom : Float -> Spacing
custom v =
    Spacing (WH.rem v)


{-| -}
toCSS : Spacing -> String
toCSS (Spacing v) =
    v
