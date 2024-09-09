module Main exposing (main)

import Book exposing (Msg(..))
import Book.Route
import Browser
import Browser.Dom
import Browser.Navigation
import Docs.Avatar
import Docs.Badge
import Docs.Button
import Docs.Colors
import Docs.DataRow
import Docs.Divider
import Docs.FormField
import Docs.InputCheckbox
import Docs.InputCode
import Docs.InputColor
import Docs.InputRadio
import Docs.InputSelect
import Docs.InputSlider
import Docs.InputTextArea
import Docs.Loading
import Docs.Menu
import Docs.Message
import Docs.Nav
import Docs.Notification
import Docs.Pagination
import Docs.Popover
import Docs.Showcase
import Docs.Skeleton
import Docs.Spacing
import Docs.Table
import Docs.Tag
import Docs.Tooltip
import Docs.Typography
import Html as H
import Html.Attributes as HA
import Task
import UncoverTheme
import Url
import W.Box
import W.Button
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
            -- UncoverTheme.darkTheme
            W.Theme.darkTheme

        book : Book.Book Book.Msg
        book =
            Book.book "Fractal"
                [ Book.chapter "Foundation"
                    [ Book.pageWithExamples "Brand" []
                    , Docs.Colors.view theme
                    , Docs.Typography.view
                    , Docs.Spacing.view
                    ]
                , Book.chapter "Core"
                    [ Book.pageWithExamples "Heading" []
                    , Book.pageWithExamples "Label" []
                    , Book.pageWithExamples "Text" []
                    , Docs.Button.view
                    ]
                , Book.chapter "Data Visualization"
                    [ Book.pageWithExamples "TimeSeries" []
                    , Book.pageWithExamples "Big Numbers" []
                    , Book.pageWithExamples "Deltas" []
                    , Docs.Table.view
                    ]
                , Book.chapter "Feedback"
                    [ Docs.Badge.view
                    , Docs.Loading.view
                    , Docs.Skeleton.view
                    , Docs.Message.view
                    , Docs.Notification.view
                    ]
                , Book.chapter "Layout"
                    [ Book.pageWithExamples "Box" []
                    , Book.pageWithExamples "Modal" []
                    , Docs.Divider.view
                    ]
                , Book.chapter "Navigation"
                    [ Docs.Menu.view
                    , Docs.Popover.view
                    , Docs.Pagination.view
                    , Book.pageWithExamples "Breadcrumbs" []
                    ]
                , Book.chapter "Information"
                    [ Docs.Avatar.view
                    , Docs.DataRow.view
                    , Book.pageWithExamples "DataList" []
                    , Book.pageWithExamples "Icon" []
                    , Docs.Tag.view
                    , Book.pageWithExamples "Tag - Delta" []
                    , Docs.Tooltip.view
                    ]
                , Book.chapter "Forms"
                    [ Book.pageWithExamples "Form" []
                    , Docs.FormField.view
                    , Book.pageWithExamples "Dynamic Form" []
                    ]
                , Book.chapter "Form Inputs"
                    [ Book.pageWithExamples "Input Autocomplete" []
                    , Docs.InputCheckbox.view
                    , Docs.InputCode.view
                    , Docs.InputColor.view
                    , Book.pageWithExamples "Input Date" []
                    , Book.pageWithExamples "Input Int" []
                    , Book.pageWithExamples "Input Float" []
                    , Docs.InputRadio.view
                    , Docs.InputSelect.view
                    , Docs.InputSlider.view
                    , Book.pageWithExamples "Input Text" []
                    , Docs.InputTextArea.view
                    , Book.pageWithExamples "Input Time" []
                    ]
                , Book.chapter "Guided Journeys"
                    [ Book.pageWithExamples "Wizard" []
                    , Book.pageWithExamples "WizardSteps" []
                    , Book.pageWithExamples "StepByStep" []
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
                [ Book.bookChapter (Book.pageWithExamples "Page Header" [])
                , Book.bookChapter (Book.pageWithExamples "Hub Navigation" [])
                ]

        reportsBook : Book.Book Book.Msg
        reportsBook =
            Book.book "Reports & Blocks"
                [ Book.bookChapter (Book.pageWithExamples "Block Header" [])
                , Book.bookChapter (Book.pageWithExamples "BlockList Actions" [])
                , Book.bookChapter (Book.pageWithExamples "Report Navigation" [])
                ]

        genesisBook : Book.Book Book.Msg
        genesisBook =
            Book.book "Genesis"
                [ Book.bookChapter (Book.pageWithExamples "Dynamic Form" [])
                , Book.bookChapter (Book.pageWithExamples "ConnectionList" [])
                ]

        harmonizationBook : Book.Book Book.Msg
        harmonizationBook =
            Book.book "Harmonization"
                [ Book.bookChapter (Book.pageWithExamples "Qualifier Parser" [])
                , Book.bookChapter (Book.pageWithExamples "Value Parser" [])
                ]
    in
    Browser.application
        { init = init theme
        , view = view book
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
    , theme : W.Theme.Theme
    }


init : W.Theme.Theme -> flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init theme _ url navKey =
    ( { navKey = navKey
      , url = url
      , actions = []
      , modal = False
      , theme = theme
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

        SetTheme theme ->
            ( { model | theme = theme }
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


view : Book.Book Msg -> Model -> Browser.Document Msg
view book model =
    let
        themes : List ( String, W.Theme.Theme )
        themes =
            [ ( "light", UncoverTheme.lightTheme )
            , ( "dark", UncoverTheme.darkTheme )
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
            { theme = model.theme
            , darkMode = Nothing
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
            [ W.Box.flex [ W.Box.yTop ]
            ]
            [ W.Box.view
                [ W.Box.sticky
                , W.Box.heightScreen
                , W.Box.widthCustom (W.Sizing.toCSS W.Sizing.sm)
                , W.Box.background W.Theme.color.bg
                ]
                [ H.nav
                    [ HA.class "w--absolute w--inset-0 w--overflow-x-hidden w--overflow-y-auto w--border-0 w--border-solid w--border-r w--border-accent" ]
                    [ Docs.Nav.view
                        { url = model.url
                        , rootBook = book
                        , route = route
                        , right =
                            [ W.Button.view
                                [ W.Button.invisible
                                , W.Button.extraSmall
                                ]
                                { label = [ H.text "T" ]
                                , onClick =
                                    if model.theme == UncoverTheme.lightTheme then
                                        SetTheme UncoverTheme.darkTheme

                                    else
                                        SetTheme UncoverTheme.lightTheme
                                }
                            ]
                        }
                    ]
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
                                (Book.pageContent c)
                            ]

                    Nothing ->
                        Docs.Showcase.view book
                ]
            ]
        ]
    }
