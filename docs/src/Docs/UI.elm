module Docs.UI exposing
    ( viewChapter
    , viewExample
    , viewHorizontal
    , viewVertical
    )

import Book
import Html as H
import Html.Attributes as HA
import W.Box
import W.Heading
import W.Spacing


viewChapter : Book.Page msg -> H.Html msg
viewChapter c =
    H.details
        [ HA.attribute "open" ""
        , HA.class "w--min-h-screen w--py-xl"
        ]
        [ H.summary [] [ H.text (Book.pageName c) ]
        , H.section
            []
            [ H.ul
                [ HA.class "w--list-none w--space-y-2xl w--p-0" ]
                (List.map (viewPage c) (Book.pageSections c))
            ]
        ]


viewPage : Book.Page msg -> Book.PageSection msg -> H.Html msg
viewPage c page =
    H.section
        [ HA.id (Book.sectionId c page) ]
        [ H.h2 [] [ H.text (Book.sectionName page) ]
        , H.ul [ HA.class "w--space-y-md w--list-none w--p-0" ] (List.map (\v -> H.li [] [ v ]) (Book.sectionContent page))
        ]


viewExample : ( String, List (H.Html msg) ) -> H.Html msg
viewExample ( label, content ) =
    W.Box.view
        []
        [ W.Heading.view
            [ W.Heading.extraSmall ]
            [ H.text label ]
        , W.Box.view
            [ W.Box.borderSmall
            , W.Box.rounded
            , W.Box.borderSubtle
            , W.Box.shadow
            , W.Box.padding W.Spacing.sm
            ]
            content
        ]


viewHorizontal : List (H.Html msg) -> H.Html msg
viewHorizontal =
    H.div [ HA.class "w--flex w--items-start w--gap-sm" ]


viewVertical : List (H.Html msg) -> H.Html msg
viewVertical children =
    H.div [ HA.class "w--space-y-sm" ] (List.map (\child -> H.div [] [ child ]) children)