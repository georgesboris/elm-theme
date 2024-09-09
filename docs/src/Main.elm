module Main exposing (main)

import Book exposing (Msg(..))
import Book.Route
import Browser
import Browser.Dom
import Browser.Navigation
import Docs.Avatar
import Docs.Badge
import Docs.Box
import Docs.Button
import Docs.Colors
import Docs.DataRow
import Docs.Divider
import Docs.FormField
import Docs.InputCheckbox
import Docs.InputCode
import Docs.InputColor
import Docs.InputDate
import Docs.InputFloat
import Docs.InputInt
import Docs.InputRadio
import Docs.InputSelect
import Docs.InputSlider
import Docs.InputText
import Docs.InputTextArea
import Docs.InputTime
import Docs.Loading
import Docs.Menu
import Docs.Message
import Docs.Modal
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
            W.Theme.darkTheme

        book : Book.Book Book.Msg
        book =
            Book.book "elm-widgets"
                [ Book.chapter "Core"
                    [ Docs.Typography.view
                    , Docs.Colors.view theme
                    , Docs.Spacing.view
                    , Docs.Button.view
                    ]
                , Book.chapter "Layout"
                    [ Docs.Box.view
                    , Docs.DataRow.view
                    , Docs.Menu.view
                    , Docs.Divider.view
                    ]
                , Book.chapter "Tables & Lists"
                    [ Book.pageWithExamples "Breadcrumbs" []
                    , Book.pageWithExamples "DataList" []
                    , Docs.Table.view
                    , Docs.Pagination.view
                    ]
                , Book.chapter "Info & Feedback"
                    [ Docs.Avatar.view
                    , Docs.Badge.view
                    , Docs.Loading.view
                    , Docs.Skeleton.view
                    , Docs.Message.view
                    , Docs.Notification.view
                    , Docs.Tag.view
                    ]
                , Book.chapter "Overlays"
                    [ Docs.Modal.view
                    , Docs.Popover.view
                    , Docs.Tooltip.view
                    ]
                , Book.chapter "Forms & Inputs"
                    [ Book.pageWithExamples "Form" []
                    , Docs.FormField.view
                    , Docs.InputText.view
                    , Docs.InputTextArea.view
                    , Docs.InputInt.view
                    , Docs.InputFloat.view
                    , Docs.InputDate.view
                    , Docs.InputTime.view
                    , Docs.InputCheckbox.view
                    , Docs.InputRadio.view
                    , Docs.InputSelect.view
                    , Docs.InputSlider.view
                    , Docs.InputCode.view
                    , Docs.InputColor.view
                    ]
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

        -- Main Layout
        , W.Box.view
            [ W.Box.flex [ W.Box.yTop ]
            ]
            [ W.Box.view
                [ W.Box.sticky
                , W.Box.heightScreen
                , W.Box.widthCustom (W.Sizing.toCSS W.Sizing.full)
                , W.Box.maxWidth W.Sizing.sm
                , W.Box.background W.Theme.color.bg
                ]
                [ H.nav
                    [ HA.class "w--absolute w--inset-0 w--overflow-x-hidden w--overflow-y-auto w--border-0 w--border-solid w--border-r w--border-accent"
                    , HA.class "w--flex w--items-stretch w--justify-stretch"
                    ]
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
                                    if model.theme == W.Theme.lightTheme then
                                        SetTheme W.Theme.darkTheme

                                    else
                                        SetTheme W.Theme.lightTheme
                                }
                            ]
                        }
                    ]
                ]
            , W.Box.view
                [ W.Box.grow
                , W.Box.relative
                , W.Box.flex [ W.Box.xCenter ]
                ]
                [ W.Box.view
                    [ W.Box.widthFull
                    , W.Box.maxWidth W.Sizing.xl2
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
        ]
    }
