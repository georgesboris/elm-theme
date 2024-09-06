module W.Spacing exposing
    ( Spacing
    , custom
    , lg
    , md
    , none
    , sm
    , toCSS
    , xl
    , xl2
    , xl3
    , xs
    )

import W.Internal.Helpers as WH
import W.Theme


type Spacing
    = Spacing String


none : Spacing
none =
    Spacing "0px"


xs : Spacing
xs =
    Spacing W.Theme.spacing.xs


sm : Spacing
sm =
    Spacing W.Theme.spacing.sm


md : Spacing
md =
    Spacing W.Theme.spacing.md


lg : Spacing
lg =
    Spacing W.Theme.spacing.lg


xl : Spacing
xl =
    Spacing W.Theme.spacing.xl


xl2 : Spacing
xl2 =
    Spacing W.Theme.spacing.xl2


xl3 : Spacing
xl3 =
    Spacing W.Theme.spacing.xl3


custom : Float -> Spacing
custom v =
    Spacing (WH.rem v)


toCSS : Spacing -> String
toCSS (Spacing v) =
    v
