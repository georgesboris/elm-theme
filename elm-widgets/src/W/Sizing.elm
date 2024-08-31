module W.Sizing exposing
    ( Sizing
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


type Sizing
    = Sizing String


none : Sizing
none =
    Sizing "0px"


xs : Sizing
xs =
    Sizing (WH.rem 16)


sm : Sizing
sm =
    Sizing (WH.rem 20)


md : Sizing
md =
    Sizing (WH.rem 24)


lg : Sizing
lg =
    Sizing (WH.rem 36)


xl : Sizing
xl =
    Sizing (WH.rem 48)


xl2 : Sizing
xl2 =
    Sizing (WH.rem 64)


xl3 : Sizing
xl3 =
    Sizing (WH.rem 80)


custom : Float -> Sizing
custom v =
    Sizing (WH.rem v)


toCSS : Sizing -> String
toCSS (Sizing v) =
    v
