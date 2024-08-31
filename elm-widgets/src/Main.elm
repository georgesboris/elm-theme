module Main exposing (main)

import Attr
import Color
import Html as H
import Html.Attributes as HA
import SolidColor
import Theme
import W.Avatar
import W.Badge
import W.Box
import W.Button
import W.DataRow
import W.Divider
import W.Heading
import W.Loading
import W.Radius
import W.Sizing
import W.Skeleton
import W.Spacing
import W.TextBlock
import W.TextInline
import W.Theme



-- Types


type Chapter msg
    = Chapter String (List (Section msg))


type Section msg
    = Section String (List (H.Html msg))


main : H.Html msg
main =
    Theme.main


main2 : H.Html msg
main2 =
    let
        theme : W.Theme.Theme
        theme =
            W.Theme.lightTheme

        chapters : List (Chapter msg)
        chapters =
            [ viewTypography
            , viewSpacing
            , viewColors theme
            , viewActions
            , viewLayout
            , viewFeedback
            , viewOverlays
            ]
    in
    H.div
        []
        [ W.Theme.globalTheme
            { theme = theme
            , darkMode = Just (W.Theme.darkModeFromClass "dark" W.Theme.darkTheme)
            }
        , W.Box.view
            [ W.Box.flex [ W.Box.yTop ] ]
            [ viewNavigation chapters
            , H.ul [ W.Box.growAttr ] (List.map viewChapter chapters)
            ]
        ]


viewColors : W.Theme.Theme -> Chapter msg
viewColors theme =
    let
        themeColors : W.Theme.ColorPalette
        themeColors =
            W.Theme.toColorPalette theme
    in
    chapter "Colors"
        [ ( "Brand Colors"
          , [ W.Box.view
                [ W.Box.gap W.Spacing.xs ]
                [ viewColorScale "Neutral" W.Box.base themeColors.base
                , viewColorScale "Primary" W.Box.primary themeColors.primary
                , viewColorScale "Secondary" W.Box.secondary themeColors.secondary
                ]
            ]
          )
        , ( "Semantic Colors"
          , [ W.Box.view
                [ W.Box.gap W.Spacing.xs ]
                [ viewColorScale "Success" W.Box.success themeColors.success
                , viewColorScale "Warning" W.Box.warning themeColors.warning
                , viewColorScale "Danger" W.Box.danger themeColors.danger
                ]
            ]
          )
        , ( "Data Visualization"
          , [ W.Skeleton.view [ W.Skeleton.height 8 ] ]
          )
        ]


viewColorScale : String -> W.Box.Attribute -> W.Theme.ColorScale -> H.Html msg
viewColorScale name colorScaleAttr colorScale =
    W.Box.view
        [ colorScaleAttr
        , W.Box.roundedSmall
        , W.Box.padding W.Spacing.sm
        , W.Box.rounded
        , W.Box.grid []
        ]
        [ W.Box.view
            [ W.Box.columnSpan 2 ]
            [ W.Heading.view
                [ W.Heading.extraSmall ]
                [ H.text name ]
            ]
        , W.Box.view
            [ W.Box.columnSpan 10 ]
            [ W.Box.view
                [ W.Box.grid [ W.Box.columns 15 ]
                , W.Box.gap W.Spacing.xs
                ]
                [ viewColorWithBorder "Bg" colorScale.bg
                , viewColorWithBorder "Bg Subtle" colorScale.bgSubtle
                , viewColorWithBorder "Tint Subtle" colorScale.tintSubtle
                , viewColor "Tint" colorScale.tint
                , viewColor "Tint Strong" colorScale.tintStrong
                , viewColor "Accent Subtle" colorScale.accentSubtle
                , viewColor "Accent" colorScale.accent
                , viewColor "Accent Strong" colorScale.accentStrong
                , viewColor "Solid Subtle" colorScale.solidSubtle
                , viewColor "Solid" colorScale.solid
                , viewColor "Solid Strong" colorScale.solidStrong
                , viewColorWithBorder "Solid Text" colorScale.solidText
                , viewColor "Text Subtle" colorScale.textSubtle
                , viewColor "Text" colorScale.text
                , viewColor "Shadow" colorScale.shadow
                ]
            ]
        ]


viewColorWithBorder : String -> Color.Color -> H.Html msg
viewColorWithBorder name color =
    W.Box.view []
        [ W.Box.view
            [ W.Box.background (Color.toCssString color)
            , W.Box.widthFull
            , W.Box.square
            , W.Box.rounded
            , W.Box.borderLarge
            , W.Box.borderColor W.Theme.color.tint
            ]
            []
        ]


viewColor : String -> Color.Color -> H.Html msg
viewColor name color =
    W.Box.view
        []
        [ W.Box.view
            [ W.Box.background (Color.toCssString color)
            , W.Box.square
            , W.Box.widthFull
            , W.Box.rounded
            ]
            []

        -- , W.TextBlock.view [ W.TextBlock.small ] [ H.text name ]
        -- , W.TextBlock.view [ W.TextBlock.small ] [ H.text (toHex color) ]
        -- , W.TextBlock.view [ W.TextBlock.small ] [ H.text (colorToRgbText color) ]
        ]


colorToRgbText : Color.Color -> String
colorToRgbText color =
    let
        c : { red : Float, green : Float, blue : Float, alpha : Float }
        c =
            Color.toRgba color
    in
    "RGB " ++ String.fromInt (to255 c.red) ++ " " ++ String.fromInt (to255 c.green) ++ " " ++ String.fromInt (to255 c.blue)


to255 : Float -> Int
to255 v =
    Basics.round (v * 255)


toHex : Color.Color -> String
toHex color =
    color
        |> Color.toRgba
        |> (\c ->
                SolidColor.fromRGB
                    ( Basics.toFloat (to255 c.red)
                    , Basics.toFloat (to255 c.green)
                    , Basics.toFloat (to255 c.blue)
                    )
           )
        |> SolidColor.toHex


viewTypography : Chapter msg
viewTypography =
    chapter "Typography"
        [ ( ""
          , [ ( W.Spacing.xl, W.Heading.extraLarge, W.TextBlock.extraLarge )
            , ( W.Spacing.lg, W.Heading.large, W.TextBlock.large )
            , ( W.Spacing.md, Attr.none, Attr.none )
            , ( W.Spacing.sm, W.Heading.small, W.TextBlock.small )
            , ( W.Spacing.xs, W.Heading.extraSmall, W.TextBlock.extraSmall )
            ]
                |> List.map
                    (\( spacing, headingSize, textSize ) ->
                        W.Box.view
                            [ W.Box.flex [ W.Box.xRight ] ]
                            [ W.Box.view
                                [ W.Box.maxWidth W.Sizing.xl
                                , W.Box.gap spacing
                                , W.Box.padding W.Spacing.md
                                ]
                                [ W.Heading.view
                                    [ headingSize ]
                                    [ H.text "The quick brown fox jumps over the lazy dog" ]
                                , W.TextBlock.view
                                    [ textSize ]
                                    [ H.text "Lorem ipsum dolor sit amet, "
                                    , W.TextInline.view
                                        [ W.TextInline.bold, W.TextInline.underline ]
                                        [ H.text "consectetur adipiscing elit" ]
                                    , H.text ", sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                    , W.TextInline.view
                                        [ W.TextInline.subtle ]
                                        [ H.text "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex"
                                        , W.TextInline.view [ W.TextInline.subscript ] [ H.text "ea" ]
                                        , H.text " commodo consequat."
                                        ]
                                    ]
                                ]
                            ]
                    )
                |> List.intersperse
                    (W.Divider.view
                        [ W.Divider.subtle, W.Divider.thin ]
                        []
                    )
          )
        ]


viewSpacing : Chapter msg
viewSpacing =
    chapter "Foundation"
        [ ( "Radius"
          , [ ( "xs", W.Spacing.xs, W.Radius.xs )
            , ( "sm", W.Spacing.sm, W.Radius.sm )
            , ( "md", W.Spacing.md, W.Radius.md )
            , ( "lg", W.Spacing.lg, W.Radius.lg )
            , ( "xl", W.Spacing.xl, W.Radius.xl )
            , ( "xl2", W.Spacing.xl2, W.Radius.xl2 )
            , ( "xl3", W.Spacing.xl3, W.Radius.xl3 )
            ]
                |> List.map
                    (\( name, spacing, radius ) ->
                        W.Box.view
                            [ W.Box.flex [ W.Box.yCenter ]
                            , W.Box.gap W.Spacing.xs
                            ]
                            [ W.Box.view
                                [ W.Box.width 2 ]
                                [ W.TextBlock.view
                                    [ W.TextBlock.subtle ]
                                    [ H.text name ]
                                ]
                            , W.Box.view
                                [ W.Box.padding spacing
                                , W.Box.tint
                                , W.Box.radius radius
                                ]
                                []
                            ]
                    )
          )
        , ( "Spacing"
          , [ ( "xs", W.Spacing.xs )
            , ( "sm", W.Spacing.sm )
            , ( "md", W.Spacing.md )
            , ( "lg", W.Spacing.lg )
            , ( "xl", W.Spacing.xl )
            , ( "xl2", W.Spacing.xl2 )
            , ( "xl3", W.Spacing.xl3 )
            ]
                |> List.map
                    (\( name, spacing ) ->
                        W.Box.view
                            [ W.Box.flex [ W.Box.yCenter ]
                            , W.Box.gap W.Spacing.xs
                            ]
                            [ W.Box.view
                                [ W.Box.width 2 ]
                                [ W.TextBlock.view
                                    [ W.TextBlock.subtle ]
                                    [ H.text name ]
                                ]
                            , W.Box.view
                                [ W.Box.widthCustom (W.Spacing.toCSS spacing)
                                , W.Box.height 2
                                , W.Box.tint
                                , W.Box.rounded
                                ]
                                []
                            ]
                    )
          )
        , ( "Sizing"
          , [ ( "xs", W.Sizing.xs )
            , ( "sm", W.Sizing.sm )
            , ( "md", W.Sizing.md )
            , ( "lg", W.Sizing.lg )
            , ( "xl", W.Sizing.xl )
            , ( "xl2", W.Sizing.xl2 )
            , ( "xl3", W.Sizing.xl3 )
            ]
                |> List.map
                    (\( name, sizing ) ->
                        W.Box.view
                            [ W.Box.flex [ W.Box.yCenter ]
                            , W.Box.gap W.Spacing.xs
                            ]
                            [ W.Box.view
                                [ W.Box.width 2 ]
                                [ W.TextBlock.view
                                    [ W.TextBlock.subtle ]
                                    [ H.text name ]
                                ]
                            , W.Box.view
                                [ W.Box.widthCustom (W.Sizing.toCSS sizing)
                                , W.Box.height 2
                                , W.Box.tint
                                , W.Box.rounded
                                ]
                                []
                            ]
                    )
          )
        ]


viewActions : Chapter msg
viewActions =
    chapter "Actions"
        [ ( "Buttons"
          , List.concat
                [ [ Attr.none, W.Button.outline, W.Button.tint, W.Button.invisible ]
                    |> List.map
                        (\attr ->
                            viewHorizontal
                                [ W.Button.viewDummy [ attr, W.Button.large, W.Button.radius 0.5 ] [ H.text "Button" ]
                                , W.Button.viewDummy [ attr, W.Button.primary ] [ H.text "Button" ]
                                , W.Button.viewDummy [ attr, W.Button.warning, W.Button.disabled ] [ H.text "Button" ]
                                , W.Button.viewDummy [ attr, W.Button.success, W.Button.small ] [ H.text "Button" ]
                                , W.Button.viewDummy [ attr, W.Button.icon, W.Button.small, W.Button.rounded ] [ H.text "λ" ]
                                , W.Button.viewDummy [ attr, W.Button.danger, W.Button.extraSmall ] [ H.text "Button" ]
                                ]
                        )
                , [ W.Button.viewDummy [ W.Button.primary, W.Button.rounded, W.Button.full ] [ H.text "Button" ]
                  , W.Button.viewDummy [ W.Button.primary, W.Button.full, W.Button.disabled ] [ H.text "Button" ]
                  ]
                ]
          )
        ]


viewLayout : Chapter msg
viewLayout =
    chapter "Layout"
        [ ( "Divider"
          , [ H.div
                [ HA.class "w--grid w--grid-cols-2" ]
                [ H.div []
                    [ W.Divider.view [ W.Divider.margins 1 ] []
                    , W.Divider.view [ W.Divider.margins 1, W.Divider.subtle ] [ H.text "Content" ]
                    , W.Divider.view [ W.Divider.margins 1, W.Divider.color W.Theme.color.tint ] []
                    ]
                , H.div
                    [ HA.class "w--flex w--justify-around"
                    , HA.style "height" "68px"
                    , HA.style "padding" "16px 0"
                    ]
                    [ W.Divider.view [ W.Divider.vertical ] []
                    , W.Divider.view [ W.Divider.vertical, W.Divider.subtle ] [ H.text "Content" ]
                    , W.Divider.view [ W.Divider.vertical, W.Divider.color W.Theme.color.tint ] []
                    ]
                ]
            ]
          )
        , ( "DataRow"
          , [ W.DataRow.viewExtra
                [ W.DataRow.padding W.Spacing.md
                ]
                { header = [ H.text "Header" ]
                , main = [ H.text "Main" ]
                , footer = [ H.text "footer" ]
                , left =
                    [ W.Avatar.view
                        [ W.Avatar.large
                        , W.Avatar.names "Georges" "Boris"
                        ]
                    ]
                , right =
                    [ W.Avatar.view
                        [ W.Avatar.large
                        , W.Avatar.names "Georges" "Boris"
                        ]
                    ]
                }
            ]
          )
        , ( "Flex"
          , [ W.Box.view
                [ W.Box.gap W.Spacing.xs
                , W.Box.padding W.Spacing.lg
                , W.Box.background W.Theme.color.tintSubtle
                , W.Box.rounded
                ]
                [ W.Box.view
                    [ W.Box.gap W.Spacing.xs
                    , W.Box.flex [ W.Box.xSpaceBetween ]
                    ]
                    [ placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    ]
                , W.Box.view
                    [ W.Box.gap W.Spacing.xs
                    , W.Box.flex [ W.Box.xSpaceEvenly ]
                    ]
                    [ placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    ]
                , W.Box.view
                    [ W.Box.gap W.Spacing.xs
                    , W.Box.flex [ W.Box.xCenter ]
                    ]
                    [ placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    ]
                , W.Box.view
                    [ W.Box.gap W.Spacing.xs
                    , W.Box.flex [ W.Box.xCenter ]
                    ]
                    [ placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    , placeholderSquare
                    ]
                ]
            ]
          )
        , ( "Grid"
          , let
                gridColumn : List W.Box.Attribute -> H.Html msg
                gridColumn attrs =
                    W.Box.view
                        (attrs
                            ++ [ W.Box.height 2
                               , W.Box.tint
                               ]
                        )
                        []
            in
            [ W.Box.view
                [ W.Box.gap W.Spacing.sm
                , W.Box.grid []
                ]
                [ gridColumn [ W.Box.columnSpan 3 ]
                , gridColumn [ W.Box.columnSpan 2 ]
                , gridColumn [ W.Box.columnSpan 5 ]
                , gridColumn [ W.Box.columnSpan 3, W.Box.columnStart 2 ]

                -- , W.Box.viewColumn
                --     [ W.Box.largeScreen [ W.Box.span 3 ] ]
                --     [ placeholder ]
                -- , W.Box.viewColumn
                --     [ W.Box.largeScreen [ W.Box.span 6 ] ]
                --     [ placeholder ]
                -- , W.Box.viewColumn
                --     [ W.Box.largeScreen [ W.Box.start 2, W.Box.end 12 ] ]
                --     [ placeholder ]
                ]
            ]
          )
        , ( "Box"
          , [ W.Box.view
                [ W.Box.gap W.Spacing.xs
                , W.Box.height 6
                , W.Box.padding W.Spacing.md
                , W.Box.tint
                , W.Box.rounded
                , W.Box.grid []
                ]
                [ W.Box.view
                    [ W.Box.flex []
                    , W.Box.gap W.Spacing.xs
                    , W.Box.rounded
                    , W.Box.shadowLarge
                    , W.Box.padding W.Spacing.md
                    , W.Box.primary
                    , W.Box.solid
                    ]
                    [ placeholderSquare, placeholderSquare ]
                , W.Box.view
                    [ W.Box.shadowSmall
                    , W.Box.tint
                    , W.Box.rounded
                    ]
                    []
                , W.Box.viewLink
                    [ W.Box.shadowLarge
                    , W.Box.rounded
                    , W.Box.solid
                    , W.Box.danger
                    ]
                    { href = "#"
                    , content = [ H.text "Click moi" ]
                    }
                ]
            ]
          )
        ]


viewFeedback : Chapter msg
viewFeedback =
    chapter "Feedback"
        [ ( "Badge"
          , [ viewHorizontal
                [ W.Badge.view [ W.Badge.inline ] [ H.text "123" ]
                , W.Badge.view [ W.Badge.inline, W.Badge.primary ] [ H.text "123" ]
                , W.Badge.view [ W.Badge.inline, W.Badge.secondary ] [ H.text "123" ]
                ]
            , viewHorizontal
                [ W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.base ] [ H.text "123" ]
                , W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.success ] [ H.text "123" ]
                , W.Badge.view [ W.Badge.inline, W.Badge.small, W.Badge.customColor { color = "#dadada", background = "#000000" } ] [ H.text "123" ]
                ]
            , H.div
                [ HA.class "w--inline-block w--relative" ]
                [ W.Button.viewDummy [] [ H.text "Updates" ]
                , W.Badge.view [ W.Badge.small ] [ H.text "48" ]
                ]
            ]
          )
        , ( "Skeleton"
          , [ viewVertical
                [ W.Skeleton.view [ W.Skeleton.noAnimation, W.Skeleton.circle 4 ]
                , W.Skeleton.view [ W.Skeleton.radius 0.5, W.Skeleton.height 8 ]
                , W.Skeleton.view [ W.Skeleton.relativeWidth 0.8 ]
                , W.Skeleton.view [ W.Skeleton.relativeWidth 0.3 ]
                ]
            ]
          )
        , ( "Loading"
          , [ viewHorizontal
                [ W.Loading.view
                    [ W.Loading.size 40
                    , W.Loading.color W.Theme.primary.accent
                    ]
                , W.Loading.view
                    [ W.Loading.circles
                    , W.Loading.size 40
                    , W.Loading.color W.Theme.primary.accentStrong
                    ]
                , W.Loading.view
                    [ W.Loading.ripples
                    , W.Loading.size 40
                    , W.Loading.color W.Theme.secondary.accentStrong
                    ]
                , W.Loading.view [ W.Loading.circles ]
                ]
            ]
          )
        ]


viewOverlays : Chapter msg
viewOverlays =
    chapter "Overlays"
        [ ( "Tooltip"
          , [ H.div
                []
                [ H.button
                    [ HA.class "relative"
                    , HA.attribute "popovertarget" "popover"
                    ]
                    [ H.text "Toggle that shit"
                    , H.div
                        [ HA.id "popover"
                        , HA.class "absolute top-0 right-0"
                        , HA.attribute "popover" "auto"
                        ]
                        [ H.text "hello!" ]
                    ]
                ]
            ]
          )
        ]



-- View Helpers


chapter : String -> List ( String, List (H.Html msg) ) -> Chapter msg
chapter name sections =
    Chapter name
        (List.map (\( sectionName, sectionContent ) -> Section sectionName sectionContent) sections)


viewNavigation : List (Chapter msg) -> H.Html msg
viewNavigation chapters =
    H.nav
        (HA.class "w--sticky w--top-0 w--border-0 w--border-solid w--border-r"
            :: W.Box.asAttrs
                [ W.Box.widthCustom (W.Sizing.toCSS W.Sizing.xs)
                , W.Box.heightScreen
                , W.Box.borderSubtle
                ]
        )
        [ H.div
            [ HA.class "w--absolute w--inset-0 w--overflow-x-hidden w--overflow-y-auto" ]
            (chapters
                |> List.map
                    (\(Chapter name sections) ->
                        H.li
                            [ HA.id name
                            , HA.class "w--py-xl"
                            ]
                            [ H.details
                                []
                                [ H.summary [] [ H.text name ]
                                , H.ul
                                    []
                                    (List.map
                                        (\(Section sectionName _) ->
                                            H.li
                                                [ HA.class "w--py-xl" ]
                                                [ H.a [ HA.href ("#" ++ sectionId name sectionName) ] [ H.text sectionName ]
                                                ]
                                        )
                                        sections
                                    )
                                ]
                            ]
                    )
            )
        ]


viewChapter : Chapter msg -> H.Html msg
viewChapter (Chapter name sections) =
    H.details
        [ HA.attribute "open" ""
        , HA.class "w--min-h-screen w--py-xl"
        ]
        [ H.summary [] [ H.text name ]
        , H.section
            []
            [ H.ul
                [ HA.class "w--list-none w--space-y-2xl w--p-0" ]
                (List.map (viewSection name) sections)
            ]
        ]


viewSection : String -> Section msg -> H.Html msg
viewSection chapterName (Section name content) =
    H.section
        []
        [ H.h2 [ HA.id (sectionId chapterName name) ] [ H.text name ]
        , H.ul [ HA.class "w--space-y-md w--list-none w--p-0" ] (List.map (\v -> H.li [] [ v ]) content)
        ]


sectionId : String -> String -> String
sectionId chapterName sectionName =
    chapterName ++ "--" ++ sectionName


viewHorizontal : List (H.Html msg) -> H.Html msg
viewHorizontal =
    H.div [ HA.class "w--flex w--items-start w--gap-sm" ]


viewVertical : List (H.Html msg) -> H.Html msg
viewVertical =
    H.div [ HA.class "w--space-y-sm" ]


placeholder : H.Html msg
placeholder =
    W.Skeleton.view
        [ W.Skeleton.height 6
        , W.Skeleton.noAnimation
        ]


placeholderSquare : H.Html msg
placeholderSquare =
    W.Box.view
        [ W.Box.height 1
        , W.Box.width 1
        , W.Box.background W.Theme.color.text
        , W.Box.roundedExtraSmall
        ]
        []
