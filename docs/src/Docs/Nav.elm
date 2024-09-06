module Docs.Nav exposing (view)

import Attr
import Book
import Book.Route
import Color
import Html as H
import Html.Attributes as HA
import Url
import W.Box
import W.Heading
import W.Menu
import W.Spacing
import W.Tag
import W.Theme.Colors


view : Url.Url -> Book.Book msg -> Book.Route.Route msg -> H.Html msg
view url rootBook route =
    let
        currentHref : String
        currentHref =
            url.path
    in
    H.div
        []
        [ W.Box.view
            [ W.Box.padding W.Spacing.md ]
            [ case Book.Route.parentBook route of
                Nothing ->
                    W.Heading.view
                        [ W.Heading.semibold
                        , W.Heading.color (Color.toCssString W.Theme.Colors.pink.solid)
                        ]
                        [ H.text (Book.bookName rootBook) ]

                Just parentBook ->
                    H.div
                        []
                        [ H.a
                            [ HA.href (Book.Route.parentBookHref route) ]
                            [ H.text (Book.bookName parentBook) ]
                        , W.Heading.view
                            []
                            [ H.text (Book.bookName (Book.Route.book route)) ]
                        ]
            ]
        , W.Menu.view []
            (Book.Route.book route
                |> Book.bookItems
                |> List.map
                    (\bookItem ->
                        case bookItem of
                            Book.BookChapter part ->
                                W.Menu.viewSection []
                                    { heading = [ H.text (Book.chapterName part) ]
                                    , content =
                                        Book.chapterPages part
                                            |> List.map
                                                (\chapter ->
                                                    viewLink
                                                        { currentHref = currentHref
                                                        , href = Book.Route.pageHref route chapter
                                                        , label = Book.pageName chapter
                                                        , right = viewWIPTag chapter
                                                        }
                                                )
                                    }

                            Book.BookPage chapter ->
                                viewLink
                                    { currentHref = currentHref
                                    , href = Book.Route.pageHref route chapter
                                    , label = Book.pageName chapter
                                    , right = viewWIPTag chapter
                                    }

                            Book.BookRef label bookRef ->
                                viewLink
                                    { currentHref = currentHref
                                    , href = Book.Route.bookHref route bookRef
                                    , label = label
                                    , right = viewBookTag
                                    }

                            Book.BookRefGroup groupLabel bookRefs ->
                                W.Menu.viewSection []
                                    { heading = [ H.text groupLabel ]
                                    , content =
                                        bookRefs
                                            |> List.map
                                                (\( bookName, bookRef ) ->
                                                    viewLink
                                                        { currentHref = currentHref
                                                        , href = Book.Route.bookHref route bookRef
                                                        , label = bookName
                                                        , right = viewBookTag
                                                        }
                                                )
                                    }

                            Book.BookLink { label, href } ->
                                viewLink
                                    { currentHref = currentHref
                                    , href = href
                                    , label = label
                                    , right = []
                                    }
                    )
            )
        ]


viewLink :
    { currentHref : String
    , href : String
    , label : String
    , right : List (H.Html msg)
    }
    -> H.Html msg
viewLink props =
    W.Menu.viewLink
        [ if props.currentHref == props.href then
            W.Menu.selected

          else if props.currentHref /= "/" then
            W.Menu.faded

          else
            Attr.none
        , W.Menu.right props.right
        ]
        { href = props.href
        , label = [ H.text props.label ]
        }


viewWIPTag : Book.Page msg -> List (H.Html msg)
viewWIPTag page =
    if List.isEmpty (Book.pageSections page) then
        [ W.Tag.view [ W.Tag.small ] [ H.text "WIP" ] ]

    else
        []


viewBookTag : List (H.Html msg)
viewBookTag =
    [ H.span [ HA.class "w--font-code w--text-subtle w--text-xl w--leading-none w--opacity-50" ] [ H.text "↠" ] ]
