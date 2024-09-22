# Elm Theme

A design system framework for Elm applications.

**Elm Theme** implements the [w-theme](https://github.com/georgesboris/w-theme/) schema and provides utilities for creating and using your design system tokens throughout your codebase.

## Features

### **A curated set of design tokens**

Taking inspiration from other frameworks like [radix-ui](https://www.radix-ui.com/), [tailwindcss](https://tailwindcss.com/), [shadcn](https://ui.shadcn.com/), [daisyui](https://daisyui.com/) and others.

The selected tokens aims to provide a semantic and flexible way of creating user interfaces, without feeling limiting but also not causing loss of cohesion and bikeshedding through excessive freedom of choice. 

```elm
Html.button
  [ W.Theme.styleList
      [ ( "background", W.Theme.Color.tint )
      , ( "border-color", W.Theme.Color.accent )
      , ( "text", W.Theme.Color.text )
      , ( "box-shadow", "0 0 4px " ++ W.Theme.Color.shadow 0.25 )
      , ( "padding", W.Theme.Spacing.toCSS W.Theme.Spacing.md )
      , ( "border-radius", W.Theme.Radius.toCSS W.Theme.Radius.md )
      ]
  ]
  [ Html.text "Button"
  ]


```

### **Light & Dark Modes**

Set up light and dark mode based on system preferences or through custom classes.

```elm
W.Theme.globalTheme
    { theme = W.Theme.lightTheme
    , darkMode =
        W.Theme.darkModeFromSystemPreferences W.Theme.darkTheme
    }
```

### **Multiple themes on the same page**

Creating scoped themes is extremelly useful for reusing elements while providing a diverse experience for the end user.

This can be useful for landing pages where perhaps you're coloring sections of content in multiple ways to provide rhythm and keep the user engaged.

Or even for applications, where perhaps you want to color code parts of your UI to provide different meanings. _e.g. Maybe have a highlight theme for the main piece of content for every page._

```elm
import Html exposing (div, text)
import Html.Attributes exposing (class)
import W.Theme

[ W.Theme.globalTheme
    { theme = defaultTheme
    , darkMode = W.Theme.noDarkMode
    }
, W.Theme.classTheme
    { class = "highlight"
    , theme = highlightTheme
    , darkMode = W.Theme.noDarkMode
    }
, div
    [] 
    [ text "I'm using the default theme." ]
, div
    [ class "highlight" ]
    [ text "I'm using the highlight theme! I'm very special!" ]
]

```

### **Inherited color variants**

Every theme has a color palette with multiple semantic color variants. _e.g. The "primary" color variant, or the "danger" color variant._

You can propagate a variant style for a branch of your content so child elements can automatically use its colors.

```elm
myButton =
  Html.button
    [ W.Theme.styleList
      [ ( "background", W.Theme.Color.solid )
      , ( "text", W.Theme.Color.solidText )
      ]
    ]

Html.article
  []
  [ myButton
    [ Html.text "I'm a normal button, click me! I'm harmless."
    ]
  , Html.section
      [ W.Theme.Color.asDanger ]
      [ Html.text "This text is explaning a dangerous thing!"
      , myButton [ Html.text "This button is clearly dangerous!" ]
      ]
  ]
```
