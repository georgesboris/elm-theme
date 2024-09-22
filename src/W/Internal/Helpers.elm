module W.Internal.Helpers exposing
    ( cssColorValue
    , cssValue
    , cssVar
    , rem
    , rgbSegments
    , wClass
    )

import Color exposing (Color)


namespace : String
namespace =
    "w"


rem : Float -> String
rem x =
    String.fromFloat x ++ "rem"


wClass : String -> String
wClass class =
    ".w\\/" ++ class


cssVar : String -> String -> String
cssVar key value =
    "--" ++ namespace ++ "-" ++ key ++ ":" ++ value


cssValue : String -> String
cssValue key =
    "var(--" ++ namespace ++ "-" ++ key ++ ")"


cssColorValue : String -> String
cssColorValue value =
    "rgb(" ++ cssValue value ++ ")"


toRgb255 : Float -> String
toRgb255 c =
    String.fromInt (Basics.round (c * 255))


rgbSegments : Color -> String
rgbSegments c =
    let
        rgb : { red : Float, green : Float, blue : Float, alpha : Float }
        rgb =
            Color.toRgba c
    in
    toRgb255 rgb.red ++ " " ++ toRgb255 rgb.green ++ " " ++ toRgb255 rgb.blue
