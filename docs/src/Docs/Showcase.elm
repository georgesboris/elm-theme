module Docs.Showcase exposing (view)

import Book exposing (Page(..))
import Html as H
import Html.Attributes as HA


view : Book.Book msg -> H.Html msg
view book =
    H.div
        []
        -- (chapters
        ([]
            |> List.map
                (\chapter ->
                    H.details
                        [ HA.attribute "open" ""
                        , HA.class "w--min-h-screen w--py-xl"
                        ]
                        [ H.summary [] [ H.text (Book.pageName chapter) ]
                        , H.section
                            []
                            [ H.ul
                                [ HA.class "w--list-none w--space-y-2xl w--p-0" ]
                                (Book.pageSections chapter
                                    |> List.map
                                        (\page ->
                                            H.section
                                                []
                                                [ H.h2 [ HA.id (Book.sectionSlug page) ] [ H.text (Book.sectionName page) ]
                                                , H.ul [ HA.class "w--space-y-md w--list-none w--p-0" ]
                                                    (List.map (\v -> H.li [] [ v ])
                                                        (Book.sectionContent page)
                                                    )
                                                ]
                                        )
                                )
                            ]
                        ]
                )
        )
