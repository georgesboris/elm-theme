module W.Theme.Color exposing
    ( ColorPalette, ColorVariant(..), ColorScale
    , asBase, asPrimary, asSecondary, asSuccess, asWarning, asDanger
    , asTint, asSolid, asFocusable
    , bg, bgSubtle, tint, tintSubtle, tintStrong, accent, accentSubtle, accentStrong, solid, solidSubtle, solidStrong, solidText, text, textSubtle, shadow
    , baseBg, baseBgSubtle, baseTint, baseTintSubtle, baseTintStrong, baseAccent, baseAccentSubtle, baseAccentStrong, baseSolid, baseSolidSubtle, baseSolidStrong, baseSolidText, baseText, baseTextSubtle, baseShadow
    , primaryBg, primaryBgSubtle, primaryTint, primaryTintSubtle, primaryTintStrong, primaryAccent, primaryAccentSubtle, primaryAccentStrong, primarySolid, primarySolidSubtle, primarySolidStrong, primarySolidText, primaryText, primaryTextSubtle, primaryShadow
    , secondaryBg, secondaryBgSubtle, secondaryTint, secondaryTintSubtle, secondaryTintStrong, secondaryAccent, secondaryAccentSubtle, secondaryAccentStrong, secondarySolid, secondarySolidSubtle, secondarySolidStrong, secondarySolidText, secondaryText, secondaryTextSubtle, secondaryShadow
    , successBg, successBgSubtle, successTint, successTintSubtle, successTintStrong, successAccent, successAccentSubtle, successAccentStrong, successSolid, successSolidSubtle, successSolidStrong, successSolidText, successText, successTextSubtle, successShadow
    , warningBg, warningBgSubtle, warningTint, warningTintSubtle, warningTintStrong, warningAccent, warningAccentSubtle, warningAccentStrong, warningSolid, warningSolidSubtle, warningSolidStrong, warningSolidText, warningText, warningTextSubtle, warningShadow
    , dangerBg, dangerBgSubtle, dangerTint, dangerTintSubtle, dangerTintStrong, dangerAccent, dangerAccentSubtle, dangerAccentStrong, dangerSolid, dangerSolidSubtle, dangerSolidStrong, dangerSolidText, dangerText, dangerTextSubtle, dangerShadow
    )

{-| A theme is defined of a color palette made of six semantic color scales. These scales are the "variants" of a theme and represent different things like a "base" or "neutral" color, a "primary" brand color, status-focused colors like "success", "warning" and "danger", and a "secondary" color used for increased expresiveness.

@docs ColorPalette, ColorVariant, ColorScale

A `ColorScale` is made of a number of color shades. But don't worry! There is dozens of handmade scales ready to be used through [elm-theme-colors](https://package.elm-lang.org/packages/georgesboris/elm-theme-colors/latest/).


## The Color Scale

Instead of using the common 100-900 scale found in systems like [TailwindCSS](https://tailwindcss.com/docs/customizing-colors) or [Material Design](https://m2.material.io/design/color/the-color-system.html#color-usage-and-palettes), we went for a more semantic approach based on what you would find on [Radix UI](https://www.radix-ui.com/colors). However, [W Theme](https://github.com/georgesboris/w-theme/) names colors directly instead of relying on a numeric scale. It also provides more variations than Radix, so no default use cases fall outside the provided scale.


### Background

  - **bg** — the main background of your ui
  - **bg-subtle** — an alternate, slightly darker, color of your main background. useful for creating depth.


### Tint

  - **tint **— useful for subtle backgrounds of some UI elements.
  - **tint-subtle **— subtler variation, useful for "pressed" states.
  - **tint-strong **— stronger variation, useful for "hovered" states.


### Accent

  - **accent** — useful for dividers, borders and other small UI elements.
  - **accent-subtle** — subtle variation, useful for "pressed" states.
  - **accent-strong** — stronger variation, useful for "hovered" states.

Accent colors are not made for background or text usage as they're not guaranteed to have proper contrast, they should be used for colored elements.


### Solid

  - **solid** — useful for solid elements such as buttons.
  - **solid-subtle** — subtle variation, useful for "pressed" states.
  - **solid-strong** — stronger variation, useful for "hovered" states.
  - **solid-text** — contrasting color ensuring legibility of text over solid backgrounds

Solid colors should use solid-text as their text color for proper accessibility.


### Text

  - **text** — the main text color of your application.
  - **text-subtle** — subtler variation for secondary text.

Both text colors are guaranteed to be accessible over any background and tint colors.


### Shadow

  - **shadow** — a darker shade of the color, useful for coloring shadows.

Shadows are usually used with alpha values.


# Using Color Variants

You should mostly use colors according to the current variant.
This will make your styles more dynamic. Each html element can easily set its own variant, like so:

    Html.div
        [ W.Theme.Color.asPrimary
        , W.Theme.styleList
            [ ( "background", W.Theme.Color.bg )
            , ( "border-color", W.Theme.Color.accent )
            , ( "color", W.Theme.Color.text )
            ]
        ]
        [ ... ]

However, if you wish to specify variant-specific colors regardless of context you can also access its values:

    Html.button
        [ W.Theme.styleList
            [ ( "background", W.Theme.Color.dangerSolid )
            , ( "color", W.Theme.Color.dangerText )
            ]
        ]
        [ ... ]

@docs asBase, asPrimary, asSecondary, asSuccess, asWarning, asDanger


# Using Color Components

There are a few utility components that can be used to quickly apply some styles to your elements.

@docs asTint, asSolid, asFocusable


# Using Shadows

Shadow colors receive an alpha value as they're meant to be used with transparency.

    Html.div
        [ W.Theme.styleList
            [ ( "box-shadow"
              , "0 0 8px " ++ W.Theme.Color.shadow 0.1 )
            ]
        ]
        [ ... ]


# Variant Colors

These colors will be related to the currently available variant.

By default, the `base` variant is selected.

@docs bg, bgSubtle, tint, tintSubtle, tintStrong, accent, accentSubtle, accentStrong, solid, solidSubtle, solidStrong, solidText, text, textSubtle, shadow


# Base

@docs baseBg, baseBgSubtle, baseTint, baseTintSubtle, baseTintStrong, baseAccent, baseAccentSubtle, baseAccentStrong, baseSolid, baseSolidSubtle, baseSolidStrong, baseSolidText, baseText, baseTextSubtle, baseShadow


# Primary

@docs primaryBg, primaryBgSubtle, primaryTint, primaryTintSubtle, primaryTintStrong, primaryAccent, primaryAccentSubtle, primaryAccentStrong, primarySolid, primarySolidSubtle, primarySolidStrong, primarySolidText, primaryText, primaryTextSubtle, primaryShadow


# Secondary

@docs secondaryBg, secondaryBgSubtle, secondaryTint, secondaryTintSubtle, secondaryTintStrong, secondaryAccent, secondaryAccentSubtle, secondaryAccentStrong, secondarySolid, secondarySolidSubtle, secondarySolidStrong, secondarySolidText, secondaryText, secondaryTextSubtle, secondaryShadow


# Success

@docs successBg, successBgSubtle, successTint, successTintSubtle, successTintStrong, successAccent, successAccentSubtle, successAccentStrong, successSolid, successSolidSubtle, successSolidStrong, successSolidText, successText, successTextSubtle, successShadow


# Warning

@docs warningBg, warningBgSubtle, warningTint, warningTintSubtle, warningTintStrong, warningAccent, warningAccentSubtle, warningAccentStrong, warningSolid, warningSolidSubtle, warningSolidStrong, warningSolidText, warningText, warningTextSubtle, warningShadow


# Danger

@docs dangerBg, dangerBgSubtle, dangerTint, dangerTintSubtle, dangerTintStrong, dangerAccent, dangerAccentSubtle, dangerAccentStrong, dangerSolid, dangerSolidSubtle, dangerSolidStrong, dangerSolidText, dangerText, dangerTextSubtle, dangerShadow

-}

import Color exposing (Color)
import Html as H
import Html.Attributes as HA


{-| -}
type alias ColorPalette =
    { base : ColorScale
    , primary : ColorScale
    , secondary : ColorScale
    , success : ColorScale
    , warning : ColorScale
    , danger : ColorScale
    }


{-| -}
type alias ColorScale =
    { bg : Color
    , bgSubtle : Color
    , tint : Color
    , tintSubtle : Color
    , tintStrong : Color
    , accent : Color
    , accentSubtle : Color
    , accentStrong : Color
    , solid : Color
    , solidSubtle : Color
    , solidStrong : Color
    , solidText : Color
    , textSubtle : Color
    , text : Color
    , shadow : Color
    }


{-| -}
type ColorVariant
    = Base
    | Primary
    | Secondary
    | Success
    | Warning
    | Danger



-- Variant Classes


{-| -}
asBase : H.Attribute msg
asBase =
    HA.class "w/base"


{-| -}
asPrimary : H.Attribute msg
asPrimary =
    HA.class "w/primary"


{-| -}
asSecondary : H.Attribute msg
asSecondary =
    HA.class "w/secondary"


{-| -}
asSuccess : H.Attribute msg
asSuccess =
    HA.class "w/success"


{-| -}
asWarning : H.Attribute msg
asWarning =
    HA.class "w/warning"


{-| -}
asDanger : H.Attribute msg
asDanger =
    HA.class "w/danger"



-- Variant Utilities


{-| -}
asTint : H.Attribute msg
asTint =
    HA.class "w/tint"


{-| -}
asSolid : H.Attribute msg
asSolid =
    HA.class "w/solid"


{-| -}
asFocusable : H.Attribute msg
asFocusable =
    HA.class "w/focus"



-- Current Variant


{-| -}
bg : String
bg =
    cssColorValue "bg"


{-| -}
bgSubtle : String
bgSubtle =
    cssColorValue "bg-subtle"


{-| -}
tint : String
tint =
    cssColorValue "tint"


{-| -}
tintSubtle : String
tintSubtle =
    cssColorValue "tint-subtle"


{-| -}
tintStrong : String
tintStrong =
    cssColorValue "tint-strong"


{-| -}
accent : String
accent =
    cssColorValue "accent"


{-| -}
accentSubtle : String
accentSubtle =
    cssColorValue "accent-subtle"


{-| -}
accentStrong : String
accentStrong =
    cssColorValue "accent-strong"


{-| -}
solid : String
solid =
    cssColorValue "solid"


{-| -}
solidSubtle : String
solidSubtle =
    cssColorValue "solid-subtle"


{-| -}
solidStrong : String
solidStrong =
    cssColorValue "solid-strong"


{-| -}
solidText : String
solidText =
    cssColorValue "solid-text"


{-| -}
textSubtle : String
textSubtle =
    cssColorValue "text-subtle"


{-| -}
text : String
text =
    cssColorValue "text"


{-| -}
shadow : Float -> String
shadow =
    cssColorValueWithAlpha "shadow"



-- Base


{-| -}
baseBg : String
baseBg =
    cssColorValue "base-bg"


{-| -}
baseBgSubtle : String
baseBgSubtle =
    cssColorValue "base-bg-subtle"


{-| -}
baseTint : String
baseTint =
    cssColorValue "base-tint"


{-| -}
baseTintSubtle : String
baseTintSubtle =
    cssColorValue "base-tint-subtle"


{-| -}
baseTintStrong : String
baseTintStrong =
    cssColorValue "base-tint-strong"


{-| -}
baseAccent : String
baseAccent =
    cssColorValue "base-accent"


{-| -}
baseAccentSubtle : String
baseAccentSubtle =
    cssColorValue "base-accent-subtle"


{-| -}
baseAccentStrong : String
baseAccentStrong =
    cssColorValue "base-accent-strong"


{-| -}
baseSolid : String
baseSolid =
    cssColorValue "base-solid"


{-| -}
baseSolidSubtle : String
baseSolidSubtle =
    cssColorValue "base-solid-subtle"


{-| -}
baseSolidStrong : String
baseSolidStrong =
    cssColorValue "base-solid-strong"


{-| -}
baseSolidText : String
baseSolidText =
    cssColorValue "base-solid-text"


{-| -}
baseTextSubtle : String
baseTextSubtle =
    cssColorValue "base-text-subtle"


{-| -}
baseText : String
baseText =
    cssColorValue "base-text"


{-| -}
baseShadow : Float -> String
baseShadow =
    cssColorValueWithAlpha "base-shadow"



-- Primary


{-| -}
primaryBg : String
primaryBg =
    cssColorValue "primary-bg"


{-| -}
primaryBgSubtle : String
primaryBgSubtle =
    cssColorValue "primary-bg-subtle"


{-| -}
primaryTint : String
primaryTint =
    cssColorValue "primary-tint"


{-| -}
primaryTintSubtle : String
primaryTintSubtle =
    cssColorValue "primary-tint-subtle"


{-| -}
primaryTintStrong : String
primaryTintStrong =
    cssColorValue "primary-tint-strong"


{-| -}
primaryAccent : String
primaryAccent =
    cssColorValue "primary-accent"


{-| -}
primaryAccentSubtle : String
primaryAccentSubtle =
    cssColorValue "primary-accent-subtle"


{-| -}
primaryAccentStrong : String
primaryAccentStrong =
    cssColorValue "primary-accent-strong"


{-| -}
primarySolid : String
primarySolid =
    cssColorValue "primary-solid"


{-| -}
primarySolidSubtle : String
primarySolidSubtle =
    cssColorValue "primary-solid-subtle"


{-| -}
primarySolidStrong : String
primarySolidStrong =
    cssColorValue "primary-solid-strong"


{-| -}
primarySolidText : String
primarySolidText =
    cssColorValue "primary-solid-text"


{-| -}
primaryTextSubtle : String
primaryTextSubtle =
    cssColorValue "primary-text-subtle"


{-| -}
primaryText : String
primaryText =
    cssColorValue "primary-text"


{-| -}
primaryShadow : Float -> String
primaryShadow =
    cssColorValueWithAlpha "primary-shadow"



-- Secondary


{-| -}
secondaryBg : String
secondaryBg =
    cssColorValue "secondary-bg"


{-| -}
secondaryBgSubtle : String
secondaryBgSubtle =
    cssColorValue "secondary-bg-subtle"


{-| -}
secondaryTint : String
secondaryTint =
    cssColorValue "secondary-tint"


{-| -}
secondaryTintSubtle : String
secondaryTintSubtle =
    cssColorValue "secondary-tint-subtle"


{-| -}
secondaryTintStrong : String
secondaryTintStrong =
    cssColorValue "secondary-tint-strong"


{-| -}
secondaryAccent : String
secondaryAccent =
    cssColorValue "secondary-accent"


{-| -}
secondaryAccentSubtle : String
secondaryAccentSubtle =
    cssColorValue "secondary-accent-subtle"


{-| -}
secondaryAccentStrong : String
secondaryAccentStrong =
    cssColorValue "secondary-accent-strong"


{-| -}
secondarySolid : String
secondarySolid =
    cssColorValue "secondary-solid"


{-| -}
secondarySolidSubtle : String
secondarySolidSubtle =
    cssColorValue "secondary-solid-subtle"


{-| -}
secondarySolidStrong : String
secondarySolidStrong =
    cssColorValue "secondary-solid-strong"


{-| -}
secondarySolidText : String
secondarySolidText =
    cssColorValue "secondary-solid-text"


{-| -}
secondaryTextSubtle : String
secondaryTextSubtle =
    cssColorValue "secondary-text-subtle"


{-| -}
secondaryText : String
secondaryText =
    cssColorValue "secondary-text"


{-| -}
secondaryShadow : Float -> String
secondaryShadow =
    cssColorValueWithAlpha "secondary-shadow"



-- Success


{-| -}
successBg : String
successBg =
    cssColorValue "success-bg"


{-| -}
successBgSubtle : String
successBgSubtle =
    cssColorValue "success-bg-subtle"


{-| -}
successTint : String
successTint =
    cssColorValue "success-tint"


{-| -}
successTintSubtle : String
successTintSubtle =
    cssColorValue "success-tint-subtle"


{-| -}
successTintStrong : String
successTintStrong =
    cssColorValue "success-tint-strong"


{-| -}
successAccent : String
successAccent =
    cssColorValue "success-accent"


{-| -}
successAccentSubtle : String
successAccentSubtle =
    cssColorValue "success-accent-subtle"


{-| -}
successAccentStrong : String
successAccentStrong =
    cssColorValue "success-accent-strong"


{-| -}
successSolid : String
successSolid =
    cssColorValue "success-solid"


{-| -}
successSolidSubtle : String
successSolidSubtle =
    cssColorValue "success-solid-subtle"


{-| -}
successSolidStrong : String
successSolidStrong =
    cssColorValue "success-solid-strong"


{-| -}
successSolidText : String
successSolidText =
    cssColorValue "success-solid-text"


{-| -}
successTextSubtle : String
successTextSubtle =
    cssColorValue "success-text-subtle"


{-| -}
successText : String
successText =
    cssColorValue "success-text"


{-| -}
successShadow : Float -> String
successShadow =
    cssColorValueWithAlpha "success-shadow"



-- Warning


{-| -}
warningBg : String
warningBg =
    cssColorValue "warning-bg"


{-| -}
warningBgSubtle : String
warningBgSubtle =
    cssColorValue "warning-bg-subtle"


{-| -}
warningTint : String
warningTint =
    cssColorValue "warning-tint"


{-| -}
warningTintSubtle : String
warningTintSubtle =
    cssColorValue "warning-tint-subtle"


{-| -}
warningTintStrong : String
warningTintStrong =
    cssColorValue "warning-tint-strong"


{-| -}
warningAccent : String
warningAccent =
    cssColorValue "warning-accent"


{-| -}
warningAccentSubtle : String
warningAccentSubtle =
    cssColorValue "warning-accent-subtle"


{-| -}
warningAccentStrong : String
warningAccentStrong =
    cssColorValue "warning-accent-strong"


{-| -}
warningSolid : String
warningSolid =
    cssColorValue "warning-solid"


{-| -}
warningSolidSubtle : String
warningSolidSubtle =
    cssColorValue "warning-solid-subtle"


{-| -}
warningSolidStrong : String
warningSolidStrong =
    cssColorValue "warning-solid-strong"


{-| -}
warningSolidText : String
warningSolidText =
    cssColorValue "warning-solid-text"


{-| -}
warningTextSubtle : String
warningTextSubtle =
    cssColorValue "warning-text-subtle"


{-| -}
warningText : String
warningText =
    cssColorValue "warning-text"


{-| -}
warningShadow : Float -> String
warningShadow =
    cssColorValueWithAlpha "warning-shadow"



-- Danger


{-| -}
dangerBg : String
dangerBg =
    cssColorValue "danger-bg"


{-| -}
dangerBgSubtle : String
dangerBgSubtle =
    cssColorValue "danger-bg-subtle"


{-| -}
dangerTint : String
dangerTint =
    cssColorValue "danger-tint"


{-| -}
dangerTintSubtle : String
dangerTintSubtle =
    cssColorValue "danger-tint-subtle"


{-| -}
dangerTintStrong : String
dangerTintStrong =
    cssColorValue "danger-tint-strong"


{-| -}
dangerAccent : String
dangerAccent =
    cssColorValue "danger-accent"


{-| -}
dangerAccentSubtle : String
dangerAccentSubtle =
    cssColorValue "danger-accent-subtle"


{-| -}
dangerAccentStrong : String
dangerAccentStrong =
    cssColorValue "danger-accent-strong"


{-| -}
dangerSolid : String
dangerSolid =
    cssColorValue "danger-solid"


{-| -}
dangerSolidSubtle : String
dangerSolidSubtle =
    cssColorValue "danger-solid-subtle"


{-| -}
dangerSolidStrong : String
dangerSolidStrong =
    cssColorValue "danger-solid-strong"


{-| -}
dangerSolidText : String
dangerSolidText =
    cssColorValue "danger-solid-text"


{-| -}
dangerTextSubtle : String
dangerTextSubtle =
    cssColorValue "danger-text-subtle"


{-| -}
dangerText : String
dangerText =
    cssColorValue "danger-text"


{-| -}
dangerShadow : Float -> String
dangerShadow =
    cssColorValueWithAlpha "danger-shadow"



-- Private Helpers


cssValue : String -> String
cssValue key =
    "var(--w-" ++ key ++ ")"


cssColorValue : String -> String
cssColorValue value =
    "rgb(" ++ cssValue value ++ ")"


cssColorValueWithAlpha : String -> Float -> String
cssColorValueWithAlpha value alpha =
    "rgb(" ++ cssValue value ++ " / " ++ String.fromFloat alpha ++ ")"
