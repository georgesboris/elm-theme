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



-- Actions


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



-- Book


type Book model msg
    = Book (BookData model msg)


type alias BookData model msg =
    { name : String
    , slug : String
    , items : List (BookItem model msg)
    , books : Dict.Dict String (Book model msg)
    , pages : Dict.Dict ( String, String ) (Page model msg)
    }


type BookItem model msg
    = BookChapter (Chapter model msg)
    | BookPage (Page model msg)
    | BookRef String (Book model msg)
    | BookRefGroup String (List ( String, Book model msg ))
    | BookLink { label : String, href : String }


type Chapter model msg
    = Chapter
        { name : String
        , slug : String
        , chapters : List (Page model msg)
        }


type Page model msg
    = Page
        { name : String
        , slug : String
        , chapterSlug : Maybe String
        , anchors : List { id : String, label : String }
        , content : List (H.Html msg)
        , excerpt : List (H.Html msg)
        , tags : List String
        , meta : Dict.Dict String String
        }


type PageSection msg
    = PageSection
        { name : String
        , slug : String
        , content : List (H.Html msg)
        }


book : String -> List (BookItem model msg) -> Book model msg
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


toBooks : List (BookItem model msg) -> Dict.Dict String (Book model msg)
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


toChapters : List (BookItem model msg) -> Dict.Dict ( String, String ) (Page model msg)
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


bookRef : String -> Book model msg -> BookItem model msg
bookRef =
    BookRef


bookRefGroup : String -> List ( String, Book model msg ) -> BookItem model msg
bookRefGroup =
    BookRefGroup


bookChapter : Page model msg -> BookItem model msg
bookChapter =
    BookPage


bookName : Book model msg -> String
bookName (Book b) =
    b.name


bookSlug : Book model msg -> String
bookSlug (Book b) =
    b.slug


bookItems : Book model msg -> List (BookItem model msg)
bookItems (Book b) =
    b.items


chapter : String -> List (Page model msg) -> BookItem model msg
chapter name chapters =
    let
        slug : String
        slug =
            slugify name
    in
    BookChapter (Chapter { name = name, slug = slug, chapters = List.map (\(Page c) -> Page { c | chapterSlug = Just slug }) chapters })


chapterName : Chapter model msg -> String
chapterName (Chapter p) =
    p.name


chapterSlug : Chapter model msg -> String
chapterSlug (Chapter p) =
    p.slug


chapterPages : Chapter model msg -> List (Page model msg)
chapterPages (Chapter p) =
    p.chapters


page : String -> List (H.Html msg) -> Page model msg
page name content =
    Page
        { name = name
        , slug = slugify name
        , anchors = []
        , excerpt = []
        , chapterSlug = Nothing
        , content = content
        , tags = []
        , meta = Dict.empty
        }


pageWithExamples : String -> List ( String, List (H.Html msg) ) -> Page model msg
pageWithExamples name sections =
    let
        slug : String
        slug =
            slugify name
    in
    Page
        { name = name
        , slug = slug
        , anchors = List.map (\( s, _ ) -> { id = slugify s, label = s }) sections
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
        , tags = []
        , meta = Dict.empty
        }


pageName : Page model msg -> String
pageName (Page c) =
    c.name


pageSlug : Page model msg -> String
pageSlug (Page c) =
    c.slug


pageContent : Page model msg -> List (H.Html msg)
pageContent (Page c) =
    c.content


slugify : String -> String
slugify n =
    n
        |> String.trim
        |> String.toLower
        |> String.replace " " "-"
        |> Url.percentEncode
