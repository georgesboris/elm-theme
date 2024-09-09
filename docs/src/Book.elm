module Book exposing
    ( Book(..)
    , BookItem(..)
    , Chapter
    , Msg(..)
    , Page(..)
    , PageSection(..)
    , book
    , bookChapter
    , bookItems
    , bookName
    , bookRef
    , bookRefGroup
    , bookSlug
    , chapter
    , chapterName
    , chapterPages
    , chapterSlug
    , logAction
    , logActionWith
    , logActionWithBool
    , logActionWithFloat
    , logActionWithInt
    , logActionWithString
    , page
    , pageContent
    , pageName
    , pageSlug
    , pageWithExamples
    )

import Browser
import Dict
import Html as H
import Html.Attributes as HA
import Url
import W.Theme


type Msg
    = OnUrlChange Url.Url
    | OnUrlRequest Browser.UrlRequest
    | LogAction String
    | SetTheme W.Theme.Theme
    | DoNothing


logAction : String -> Msg
logAction =
    LogAction


logActionWith : (a -> String) -> String -> a -> Msg
logActionWith fn label v =
    LogAction (label ++ ": " ++ fn v)


logActionWithBool : String -> Bool -> Msg
logActionWithBool label v =
    if v then
        LogAction (label ++ ": True")

    else
        LogAction (label ++ ": False")


logActionWithString : String -> String -> Msg
logActionWithString label v =
    LogAction (label ++ ": \"" ++ v ++ "\"")


logActionWithFloat : String -> Float -> Msg
logActionWithFloat label v =
    LogAction (label ++ ": \"" ++ String.fromFloat v ++ "\"")


logActionWithInt : String -> Int -> Msg
logActionWithInt label v =
    LogAction (label ++ ": \"" ++ String.fromInt v ++ "\"")


type Book msg
    = Book (BookData msg)


type alias BookData msg =
    { name : String
    , slug : String
    , items : List (BookItem msg)
    , books : Dict.Dict String (Book msg)
    , pages : Dict.Dict ( String, String ) (Page msg)
    }


type BookItem msg
    = BookChapter (Chapter msg)
    | BookPage (Page msg)
    | BookRef String (Book msg)
    | BookRefGroup String (List ( String, Book msg ))
    | BookLink { label : String, href : String }


type Chapter msg
    = Chapter
        { name : String
        , slug : String
        , chapters : List (Page msg)
        }


type Page msg
    = Page
        { name : String
        , slug : String
        , chapterSlug : Maybe String
        , sections : List String
        , content : List (H.Html msg)
        , excerpt : List (H.Html msg)
        }


type PageSection msg
    = PageSection
        { name : String
        , slug : String
        , content : List (H.Html msg)
        }


book : String -> List (BookItem msg) -> Book msg
book name items =
    let
        slug : String
        slug =
            slugify name
    in
    Book
        { name = name
        , slug = slug
        , items = items
        , books = toBooks items
        , pages = toChapters items
        }


toBooks : List (BookItem msg) -> Dict.Dict String (Book msg)
toBooks items =
    items
        |> List.concatMap
            (\item ->
                case item of
                    BookRef _ ref ->
                        [ ( bookSlug ref, ref ) ]

                    BookRefGroup _ refs ->
                        List.map (\( _, ref ) -> ( bookSlug ref, ref )) refs

                    _ ->
                        []
            )
        |> Dict.fromList


toChapters : List (BookItem msg) -> Dict.Dict ( String, String ) (Page msg)
toChapters items =
    items
        |> List.concatMap
            (\item ->
                case item of
                    BookChapter (Chapter p) ->
                        p.chapters
                            |> List.map
                                (\(Page c) ->
                                    ( ( p.slug, c.slug )
                                    , Page c
                                    )
                                )

                    BookPage (Page c) ->
                        [ ( ( "", c.slug )
                          , Page c
                          )
                        ]

                    _ ->
                        []
            )
        |> Dict.fromList


bookRef : String -> Book msg -> BookItem msg
bookRef =
    BookRef


bookRefGroup : String -> List ( String, Book msg ) -> BookItem msg
bookRefGroup =
    BookRefGroup


bookChapter : Page msg -> BookItem msg
bookChapter =
    BookPage


bookName : Book msg -> String
bookName (Book b) =
    b.name


bookSlug : Book msg -> String
bookSlug (Book b) =
    b.slug


bookItems : Book msg -> List (BookItem msg)
bookItems (Book b) =
    b.items


chapter : String -> List (Page msg) -> BookItem msg
chapter name chapters =
    let
        slug : String
        slug =
            slugify name
    in
    BookChapter (Chapter { name = name, slug = slug, chapters = List.map (\(Page c) -> Page { c | chapterSlug = Just slug }) chapters })


chapterName : Chapter msg -> String
chapterName (Chapter p) =
    p.name


chapterSlug : Chapter msg -> String
chapterSlug (Chapter p) =
    p.slug


chapterPages : Chapter msg -> List (Page msg)
chapterPages (Chapter p) =
    p.chapters


page : String -> List (H.Html msg) -> Page msg
page name content =
    Page
        { name = name
        , slug = slugify name
        , sections = []
        , excerpt = []
        , chapterSlug = Nothing
        , content = content
        }


pageWithExamples : String -> List ( String, List (H.Html msg) ) -> Page msg
pageWithExamples name sections =
    let
        slug : String
        slug =
            slugify name
    in
    Page
        { name = name
        , slug = slug
        , sections = List.map Tuple.first sections
        , excerpt = []
        , chapterSlug = Nothing
        , content =
            sections
                |> List.map
                    (\( sectionName, sectionContent ) ->
                        H.section
                            []
                            (H.h1 [ HA.id (slugify sectionName) ]
                                [ H.text sectionName ]
                                :: sectionContent
                            )
                    )
        }


pageName : Page msg -> String
pageName (Page c) =
    c.name


pageSlug : Page msg -> String
pageSlug (Page c) =
    c.slug


pageContent : Page msg -> List (H.Html msg)
pageContent (Page c) =
    c.content


slugify : String -> String
slugify n =
    n
        |> String.trim
        |> String.toLower
        |> String.replace " " "-"
        |> Url.percentEncode
