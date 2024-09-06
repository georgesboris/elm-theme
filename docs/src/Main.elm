module Main exposing (main)

import Book exposing (Msg(..))
import Book.Route
import Browser
import Browser.Dom
import Browser.Navigation
import Docs.Colors
import Docs.Menu
import Docs.Nav
import Docs.Showcase
import Docs.Spacing
import Docs.Typography
import Html as H
import Html.Attributes as HA
import Maybe.Extra
import Task
import UncoverTheme
import Url
import W.Box
import W.Heading
import W.Sizing
import W.Spacing
import W.Styles
import W.Theme


main : Program () Model Msg
main =
    let
        theme : W.Theme.Theme
        theme =
            UncoverTheme.darkTheme

        book : Book.Book Book.Msg
        book =
            Book.book "Fractal"
                [ Book.chapter "Foundation"
                    [ Book.page "Brand" []
                    , Docs.Colors.view theme
                    , Docs.Typography.view
                    , Docs.Spacing.view
                    ]
                , Book.chapter "Core"
                    [ Book.page "Heading" []
                    , Book.page "Label" []
                    , Book.page "Text" []
                    , Book.page "Box" []
                    , Book.page "Button" []
                    , Book.page "Icon" []
                    ]
                , Book.chapter "Data Visualization"
                    [ Book.page "TimeSeries" []
                    , Book.page "Big Numbers" []
                    , Book.page "Deltas" []
                    , Book.page "Table" []
                    ]
                , Book.chapter "Feedback"
                    [ Book.page "Badge" []
                    , Book.page "Loading" []
                    , Book.page "Skeleton" []
                    , Book.page "Message" []
                    , Book.page "Notification" []
                    ]
                , Book.chapter "Layout"
                    [ Book.page "Box" []
                    , Book.page "Modal" []
                    , Book.page "Divider" []
                    ]
                , Book.chapter "Navigation"
                    [ Docs.Menu.view
                    , Book.page "Popover" []
                    , Book.page "Pagination" []
                    , Book.page "Breadcrumbs" []
                    ]
                , Book.chapter "Information"
                    [ Book.page "Avatar" []
                    , Book.page "DataRow" []
                    , Book.page "DataList" []
                    , Book.page "Tag" []
                    , Book.page "Tooltip" []
                    , Book.page "DeltaTag" []
                    ]
                , Book.chapter "Forms & Inputs"
                    [ Book.page "Form Field" []
                    , Book.page "Input Autocomplete" []
                    , Book.page "Input Checkbox" []
                    , Book.page "Input Code" []
                    , Book.page "Input Color" []
                    , Book.page "Input Date" []
                    , Book.page "Input Int" []
                    , Book.page "Input Float" []
                    , Book.page "Input Radio" []
                    , Book.page "Input Select" []
                    , Book.page "Input Slider" []
                    , Book.page "Input Text" []
                    , Book.page "Input TextArea" []
                    , Book.page "Input Time" []
                    ]
                , Book.chapter "Guided Journeys"
                    [ Book.page "Wizard" []
                    , Book.page "WizardSteps" []
                    , Book.page "StepByStep" []
                    ]
                , Book.bookRefGroup "User Journeys"
                    [ ( "Hub & Pages", hubBook )
                    , ( "Reports & Blocks", reportsBook )
                    , ( "Genesis", genesisBook )
                    , ( "Harmonization", harmonizationBook )
                    ]
                ]

        hubBook : Book.Book Book.Msg
        hubBook =
            Book.book "Hub & Pages"
                [ Book.bookChapter (Book.page "Page Header" [])
                , Book.bookChapter (Book.page "Hub Navigation" [])
                ]

        reportsBook : Book.Book Book.Msg
        reportsBook =
            Book.book "Reports & Blocks"
                [ Book.bookChapter (Book.page "Block Header" [])
                , Book.bookChapter (Book.page "BlockList Actions" [])
                , Book.bookChapter (Book.page "Report Navigation" [])
                ]

        genesisBook : Book.Book Book.Msg
        genesisBook =
            Book.book "Genesis"
                [ Book.bookChapter (Book.page "Dynamic Form" [])
                , Book.bookChapter (Book.page "ConnectionList" [])
                ]

        harmonizationBook : Book.Book Book.Msg
        harmonizationBook =
            Book.book "Harmonization"
                [ Book.bookChapter (Book.page "Qualifier Parser" [])
                , Book.bookChapter (Book.page "Value Parser" [])
                ]
    in
    Browser.application
        { init = init
        , view = view theme book
        , update = update book
        , subscriptions = subscriptions
        , onUrlChange = OnUrlChange
        , onUrlRequest = OnUrlRequest
        }



-- Types


type alias Model =
    { navKey : Browser.Navigation.Key
    , url : Url.Url
    , actions : List String
    , modal : Bool
    }


init : flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url navKey =
    ( { navKey = navKey
      , url = url
      , actions = []
      , modal = False
      }
    , Cmd.none
    )


update : Book.Book Msg -> Msg -> Model -> ( Model, Cmd Msg )
update book msg model =
    case msg of
        DoNothing ->
            ( model, Cmd.none )

        OnUrlRequest urlRequest ->
            case urlRequest of
                Browser.External url ->
                    ( model, Browser.Navigation.load url )

                Browser.Internal url ->
                    let
                        urlString : String
                        urlString =
                            Url.toString url
                    in
                    if String.contains "logAction" urlString then
                        ( { model | actions = ("Navigate to: " ++ urlString) :: model.actions }
                        , Cmd.none
                        )

                    else
                        ( model
                        , Browser.Navigation.pushUrl model.navKey urlString
                        )

        OnUrlChange url ->
            case Book.Route.fromUrl url book of
                Just _ ->
                    ( { model | url = url }
                    , case url.fragment of
                        Just target ->
                            scrollTo target
                                |> Task.attempt (\_ -> DoNothing)

                        Nothing ->
                            Cmd.none
                    )

                Nothing ->
                    ( model
                    , Browser.Navigation.replaceUrl model.navKey "/"
                    )

        LogAction message ->
            ( { model | actions = message :: model.actions }
            , Cmd.none
            )


scrollTo : String -> Task.Task Browser.Dom.Error ()
scrollTo id =
    Browser.Dom.getElement id
        |> Task.andThen
            (\data ->
                Browser.Dom.setViewport data.element.x data.element.y
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : W.Theme.Theme -> Book.Book Msg -> Model -> Browser.Document Msg
view theme book model =
    let
        themes : List ( String, W.Theme.Theme )
        themes =
            [ ( "light", W.Theme.lightTheme )
            , ( "dark", W.Theme.darkTheme )
            ]

        route : Book.Route.Route Msg
        route =
            case Book.Route.fromUrl model.url book of
                Just r ->
                    r

                Nothing ->
                    Book.Route.fromBook book
    in
    { title = Book.Route.title route
    , body =
        [ -- Styles
          W.Styles.cssReset

        -- Global Themes
        , W.Theme.globalTheme
            { theme = theme
            , darkMode = Just (W.Theme.darkModeFromClass "dark" W.Theme.darkTheme)
            }

        -- Class Themes
        , H.div
            []
            (themes
                |> List.map
                    (\( themeClass, themeDef ) ->
                        W.Theme.classTheme
                            { theme = themeDef
                            , class = themeClass
                            , darkMode = Nothing
                            }
                    )
            )

        -- Main Layout
        , W.Box.view
            [ W.Box.flex [ W.Box.yTop ] ]
            [ W.Box.view
                [ W.Box.sticky
                , W.Box.heightScreen
                , W.Box.widthCustom (W.Sizing.toCSS W.Sizing.sm)
                , W.Box.background W.Theme.color.bg
                ]
                [ H.nav
                    [ HA.class "w--absolute w--inset-0 w--overflow-x-hidden w--overflow-y-auto w--border-0 w--border-solid w--border-r w--border-accent" ]
                    [ Docs.Nav.view model.url book route ]
                ]
            , W.Box.view
                [ W.Box.grow
                , W.Box.relative
                , W.Box.background W.Theme.color.bgSubtle
                ]
                [ case Book.Route.page route of
                    Just c ->
                        H.div
                            []
                            [ W.Box.view
                                [ W.Box.padding W.Spacing.md ]
                                [ W.Heading.view [] [ H.text (Book.pageName c) ] ]
                            , W.Box.view
                                [ W.Box.padding W.Spacing.md
                                , W.Box.gap W.Spacing.xl
                                ]
                                (Book.pageSections c
                                    |> List.map
                                        (\page ->
                                            W.Box.view
                                                [ W.Box.id (Book.sectionSlug page)
                                                , W.Box.node H.section
                                                ]
                                                [ W.Heading.view
                                                    [ W.Heading.small ]
                                                    [ H.text (Book.sectionName page) ]
                                                , W.Box.view
                                                    [ W.Box.padding W.Spacing.lg
                                                    , W.Box.background W.Theme.color.bg
                                                    , W.Box.rounded
                                                    , W.Box.gap W.Spacing.lg
                                                    ]
                                                    (Book.sectionContent page)
                                                ]
                                        )
                                )
                            ]

                    Nothing ->
                        Docs.Showcase.view book
                ]
            ]
        ]
    }
