module W.Internal.Input exposing
    ( baseClass
    , baseClassNoColor
    , view
    , viewWithIcon
    )

import Html as H
import Html.Attributes as HA


view :
    { small : Bool
    , prefix : Maybe (List (H.Html msg))
    , suffix : Maybe (List (H.Html msg))
    , readOnly : Bool
    , disabled : Bool
    , mask : Maybe (String -> String)
    , maskInput : String
    }
    -> H.Html msg
    -> H.Html msg
view attrs input =
    H.label
        [ HA.class "w--input w--bg-base-bg"
        , HA.class "w--flex w--items-stretch"
        , HA.class "w--box-border w--border w--border-solid w--border-base-aux/30 w--rounded"
        , HA.class "w--font-base w--text-base-fg"
        , HA.class "w--transition"
        , HA.class "w--ring-offset-0 w--ring-primary-fg/50"
        , HA.classList
            [ ( "focus-within:w--ring focus-within:w--border-primary-fg", not attrs.readOnly )
            , ( "w--text-base", not attrs.small )
            , ( "w--text-sm", attrs.small )
            ]
        ]
        [ case attrs.prefix of
            Just prefix ->
                H.div
                    [ prefixSuffixClass
                    , HA.class "w--border-r"
                    ]
                    prefix

            Nothing ->
                H.text ""
        , H.div
            [ HA.class "w--grow w--relative"
            , HA.class "w--flex w--items-stretch w--group"
            , HA.class "w--rounded"
            , HA.classList
                [ ( "w--text-transparent focus-within:w--text-base-fg", attrs.mask /= Nothing )
                , ( "w--text-base-fg", attrs.mask == Nothing )
                , ( "w--min-h-[32px]", attrs.small )
                , ( "w--min-h-[48px]", not attrs.small )
                ]
            , if attrs.readOnly then
                HA.class "w--bg-base-aux/[0.07] focus-within:w--bg-base-aux/10"

              else if attrs.disabled then
                HA.class "w--bg-base-aux/30"

              else
                HA.class "w--bg-base-aux/[0.07] focus-within:w--bg-base-bg"
            ]
            [ input
            , attrs.mask
                |> Maybe.map
                    (\f ->
                        H.div
                            [ HA.class "w--absolute w--z-10 w--inset-x-3 w--inset-y-0"
                            , HA.class "w--flex w--items-center"
                            , HA.class "w--pointer-events-none"
                            ]
                            [ H.div
                                [ HA.class "w--text-base-fg"
                                , HA.class "group-focus-within:w--relative w--top-[28px]"
                                , HA.class "group-focus-within:w--text-sm"
                                , HA.class "group-focus-within:w--px-2 group-focus-within:w--leading-relaxed group-focus-within:w--rounded"
                                , HA.class "group-focus-within:w--bg-neutral-bg group-focus-within:w--text-neutral-aux"
                                , HA.attribute "aria-label" "formatted input"
                                ]
                                [ H.text (f attrs.maskInput) ]
                            ]
                    )
                |> Maybe.withDefault (H.text "")
            ]
        , case attrs.suffix of
            Just suffix ->
                H.div
                    [ prefixSuffixClass
                    , HA.class "w--border-l"
                    ]
                    suffix

            Nothing ->
                H.text ""
        ]


viewWithIcon :
    { prefix : Maybe (List (H.Html msg))
    , suffix : Maybe (List (H.Html msg))
    , small : Bool
    , disabled : Bool
    , readOnly : Bool
    , mask : Maybe (String -> String)
    , maskInput : String
    }
    -> H.Html msg
    -> H.Html msg
    -> H.Html msg
viewWithIcon attrs icon input =
    view attrs
        (H.div [ HA.class "w--flex w--items-stretch w--w-full w--relative w--input-with-icon" ]
            [ input
            , iconWrapper "w--text-base-aux" icon
            ]
        )


prefixSuffixClass : H.Attribute msg
prefixSuffixClass =
    HA.class <|
        "w--flex w--items-center w--justify-center w--box-border"
            ++ " w--border-0 w--border-solid w--border-base-aux/30"
            ++ " w--p-2 w--min-w-[48px] w--self-stretch"
            ++ " w--text-base-aux"


baseClass : Bool -> String
baseClass small =
    baseClassNoColor small ++ " w--text-inherit"


baseClassNoColor : Bool -> String
baseClassNoColor small =
    "w--appearance-none"
        ++ " w--w-full"
        ++ " w--py-2 w--px-3 w--box-border"
        ++ " w--border-0 w--outline-0"
        ++ " w--font-base w--leading-none"
        ++ " w--placeholder-base-aux/80"
        ++ " w--bg-transparent"
        ++ " focus:w--outline-none focus:w--shadow-none"
        ++ (if small then
                " w--text-sm"

            else
                " w--text-base"
           )


iconWrapper : String -> H.Html msg -> H.Html msg
iconWrapper class child =
    H.div
        [ HA.class "w--input-icon w--absolute w--w-10 w--inset-y-1 w--right-1"
        , HA.class "w--pointer-events-none w--flex w--items-center w--justify-center"
        , HA.class "w--bg-base-bg"
        , HA.class "before:w--block before:w--content-['']"
        , HA.class "before:w--inset-0 before:w--absolute"
        , HA.class class
        ]
        [ H.div [ HA.class "w--relative" ] [ child ] ]
