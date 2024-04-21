module Main exposing (main)


import Html as H
import Html.Attributes as HA
import W.Theme


main : H.Html msg
main =
    H.div
        []
        [ W.Theme.global (W.Theme.lightWithDarkModeTheme W.Theme.systemStrategy)
        , W.Theme.styles W.Theme.lightTheme
        , W.Theme.styles W.Theme.darkTheme
        , sample
        , W.Theme.view W.Theme.lightTheme [] [ sample ]
        , W.Theme.view W.Theme.darkTheme [] [ sample ]
        ]
    
{-| -}
sample : H.Html msg
sample =
    let
        colorVars : List { colorSet : W.Theme.ThemeColorSetVariables, solid : String, outline : String, tint : String }
        colorVars =
            [ -- W.Theme.base
              { colorSet = W.Theme.base
              , solid = "ring-base-detail bg-base-solid hover:bg-base-solid-hover active:bg-base-solid-soft shadow-base-detail"
              , outline = "ring-base-detail-soft text-base hover:bg-base-soft border-base-detail hover:border-base-detail-hover active:border-base-soft"
              , tint = "ring-base-detail-hover bg-base-tint-soft hover:bg-base-tint active:bg-base-tint-soft"
              }
              -- W.Theme.primary
            , { colorSet = W.Theme.primary
              , solid = "ring-primary-detail focus:ring ring-primary-detail bg-primary-solid hover:bg-primary-solid-hover active:bg-primary-solid-soft shadow-primary-detail"
              , outline = "ring-primary-detail-soft text-primary hover:bg-primary-soft border-primary-detail hover:border-primary-detail-hover active:border-primary-detail-soft"
              , tint = "ring-primary-detail-hover bg-primary-tint-soft hover:bg-primary-tint active:bg-primary-tint-soft"
              }
            -- W.Theme.secondary
            , { colorSet = W.Theme.secondary
              , solid = "ring-secondary-detail bg-secondary-solid hover:bg-secondary-solid-hover active:bg-secondary-solid-soft shadow-secondary-detail"
              , outline = "ring-secondary-detail-soft text-secondary hover:bg-secondary-soft border-secondary-detail hover:border-secondary-detail-hover active:border-secondary-detail-soft"
              , tint = "bg-sering-secondary-detail-hover bg-secondary-tint-soft hover:bg-secondary-tint active:bg-secondary-tint-soft"
              }
            -- W.Theme.success
            , { colorSet = W.Theme.success
              , solid = "ring-success-detail bg-success-solid hover:bg-success-solid-hover active:bg-success-solid-soft shadow-success-detail"
              , outline = "ring-success-detail-soft text-success hover:bg-success-soft border-success-detail hover:border-success-detail-hover active:border-success-detail-soft"
              , tint = "ring-success-detail-hover bg-success-tint-soft hover:bg-success-tint active:bg-success-tint-soft"
              }
            -- W.Theme.warning
            , { colorSet = W.Theme.warning
              , solid = "ring-warning-detail bg-warning-solid hover:bg-warning-solid-hover active:bg-warning-solid-soft shadow-warning-detail"
              , outline = "ring-warning-detail-soft text-warning hover:bg-warning-soft border-warning-detail hover:border-warning-detail-hover active:border-warning-detail-soft"
              , tint = "ring-warning-detail-hover bg-warning-tint-soft hover:bg-warning-tint active:bg-warning-tint-soft"
              }
            -- W.Theme.danger
            , { colorSet = W.Theme.danger
              , solid = "ring-danger-detail bg-danger-solid hover:bg-danger-solid-hover active:bg-danger-solid-soft shadow-danger-detail"
              , outline = "ring-danger-detail-soft text-danger hover:bg-danger-soft border-danger-detail hover:border-danger-detail-hover active:border-danger-detail-soft"
              , tint = "ring-danger-detail-hover bg-danger-tint-soft hover:bg-danger-tint active:bg-danger-tint-soft"
              }
            ]

        colorSample : { colorSet : W.Theme.ThemeColorSetVariables, solid : String, outline : String, tint : String } -> H.Html msg
        colorSample colorClasses =
            H.div
                [ HA.class "flex flex-col gap-2 text-center" ]
                [ [ .bg
                  , .bgSoft
                  , .tintSoft
                  , .tint
                  , .tintHover
                  , .detailSoft
                  , .detail
                  , .detailHover
                  , .solidSoft
                  , .solid
                  , .solidHover
                  , .solidText
                  , .textSoft
                  , .text
                  ]
                  |> List.map (\fn -> viewColor (fn colorClasses.colorSet))
                  |> H.div [ HA.class "grid gap-2", HA.style "grid-template-columns" "repeat(14, minmax(0, 1fr))" ]
                , H.button
                    [ HA.class "py-2 px-3 shadow outline-none focus:ring"
                    , HA.class "rounded-sm"
                    , HA.class colorClasses.solid
                    ]
                    [ H.text "Solid Button" ]
                , H.button
                    [ HA.class "rounded-sm border-2 px-3 py-2 outline-none focus:ring"
                    , HA.class colorClasses.outline
                    ]
                    [ H.text "Outline Button" ]
                , H.button
                    [ HA.class "rounded-sm py-2 px-3 outline-none focus:ring"
                    , HA.class colorClasses.tint
                    ]
                    [ H.text "Tinted Button" ]
                ]
    in
    H.article
        [ HA.class "p-4"
        , HA.class "bg-base-soft"
        ]
        [ H.section
            [ HA.class "p-4 rounded shadow-lg"
            , HA.class "bg-base"
            ]
            [ H.div
                [ HA.class "grid grid-cols-2 gap-6" ]
                (H.div
                    [ HA.class "col-span-2 flex flex-col" ]
                    [ H.h1 [ HA.class "text-xl" ] [ H.text "Theme Sample" ]
                    , H.p [ HA.class "text-soft" ] [ H.text "All theme colors and contrasts are displayed here." ]
                    , viewCode
                    ]
                    :: List.map colorSample colorVars
                )
            ]
        ]


viewColor : String -> H.Html msg
viewColor c =
    H.div [ HA.class "aspect-square rounded-xs", HA.style "background" c ] []


viewCode : H.Html msg
viewCode =
    H.pre
        [ HA.class "mt-4 text-md rounded-sm p-2 overflow-auto border"
        , HA.class "bg-base-tint border-base-detail-soft"
        ]
        [ H.code
            []
            [ H.text "Use accessibility ratings for making sure your theme works for everyone."
            , H.p [ HA.class "text-soft" ] [ H.text "This is a softer text but it is still quite readable, no?" ]
            ]
        ]


