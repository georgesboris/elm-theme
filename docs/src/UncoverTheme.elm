module UncoverTheme exposing (darkTheme, lightTheme)

import Color
import W.Theme
import W.Theme.Colors



-- Uncover Colors


primary50 : Color.Color
primary50 =
    Color.rgb255 249 250 251


primary100 : Color.Color
primary100 =
    Color.rgb255 243 244 246


primary150 : Color.Color
primary150 =
    Color.rgb255 235 237 240


primary175 : Color.Color
primary175 =
    Color.rgb255 229 231 235


primary200 : Color.Color
primary200 =
    Color.rgb255 223 225 230


primary225 : Color.Color
primary225 =
    Color.rgb255 220 222 227


primary250 : Color.Color
primary250 =
    Color.rgb255 216 219 225


primary300 : Color.Color
primary300 =
    Color.rgb255 206 210 217


primary325 : Color.Color
primary325 =
    Color.rgb255 193 197 207


primary350 : Color.Color
primary350 =
    Color.rgb255 180 184 192


primary375 : Color.Color
primary375 =
    Color.rgb255 169 174 183


primary400 : Color.Color
primary400 =
    Color.rgb255 157 163 174


primary425 : Color.Color
primary425 =
    Color.rgb255 144 151 162


primary450 : Color.Color
primary450 =
    Color.rgb255 132 138 150


primary500 : Color.Color
primary500 =
    Color.rgb255 108 114 127


primary550 : Color.Color
primary550 =
    Color.rgb255 95 103 115


primary600 : Color.Color
primary600 =
    Color.rgb255 80 88 102


primary625 : Color.Color
primary625 =
    Color.rgb255 75 82 93


primary650 : Color.Color
primary650 =
    Color.rgb255 69 76 87


primary700 : Color.Color
primary700 =
    Color.rgb255 64 70 80


primary725 : Color.Color
primary725 =
    Color.rgb255 57 63 71


primary750 : Color.Color
primary750 =
    Color.rgb255 54 59 67


primary800 : Color.Color
primary800 =
    Color.rgb255 42 47 54


primary850 : Color.Color
primary850 =
    Color.rgb255 30 35 40


primary900 : Color.Color
primary900 =
    Color.rgb255 21 23 27



-- Theme Colors


darkDisabledColorScale : W.Theme.ColorScale
darkDisabledColorScale =
    { bg = primary800
    , bgSubtle = primary800

    -- Tint
    , tint = primary800
    , tintSubtle = primary800
    , tintStrong = primary800

    -- Accent
    , accent = primary800
    , accentSubtle = primary800
    , accentStrong = primary800

    -- Solid
    , solid = primary800
    , solidSubtle = primary800
    , solidStrong = primary800
    , solidText = primary800

    -- Text
    , text = primary800
    , textSubtle = primary800

    -- Text
    , shadow = primary800
    }


lightDisabledColorScale : W.Theme.ColorScale
lightDisabledColorScale =
    { bg = primary100
    , bgSubtle = primary100

    -- Tint
    , tint = primary100
    , tintSubtle = primary100
    , tintStrong = primary100

    -- Accent
    , accent = primary100
    , accentSubtle = primary100
    , accentStrong = primary100

    -- Solid
    , solid = primary100
    , solidSubtle = primary100
    , solidStrong = primary100
    , solidText = primary100

    -- Text
    , text = primary100
    , textSubtle = primary100

    -- Text
    , shadow = primary100
    }


baseColorScale : W.Theme.ColorScale
baseColorScale =
    { bg = primary800
    , bgSubtle = primary850

    -- Tint
    , tint = primary725
    , tintSubtle = primary750
    , tintStrong = primary700

    -- Accent
    , accent = primary600
    , accentSubtle = primary700
    , accentStrong = primary550

    -- Solid
    , solid = primary600
    , solidSubtle = primary650
    , solidStrong = primary550
    , solidText = Color.white

    -- Text
    , text = primary100
    , textSubtle = primary350

    -- Text
    , shadow = Color.black
    }


primaryColorScale : W.Theme.ColorScale
primaryColorScale =
    { baseColorScale
        | bg = primary700
        , bgSubtle = primary750

        -- Tint
        , tint = primary600
        , tintSubtle = primary600
        , tintStrong = primary625

        -- Accent
        , accent = primary550
        , accentSubtle = primary600
        , accentStrong = primary500

        -- Solid
        , solidSubtle = primary300
        , solid = primary200
        , solidStrong = primary100
        , solidText = primary850

        -- Text
        , text = primary150
        , textSubtle = primary375

        -- Shadow
        , shadow = Color.rgb255 0 0 0
    }


darkTheme : W.Theme.Theme
darkTheme =
    W.Theme.darkTheme
        |> W.Theme.withBaseColor baseColorScale
        |> W.Theme.withPrimaryColor primaryColorScale
        |> W.Theme.withSecondaryColor darkDisabledColorScale
        |> W.Theme.withSuccessColor
            { bg = Color.rgb255 45 52 46
            , bgSubtle = Color.rgb255 42 49 43
            , tintSubtle = Color.rgb255 51 66 52
            , tint = Color.rgb255 53 80 56
            , tintStrong = Color.rgb255 58 92 62
            , accentSubtle = Color.rgb255 58 92 62
            , accent = Color.rgb255 64 104 69
            , accentStrong = Color.rgb255 70 118 77
            , solidSubtle = Color.rgb255 60 151 77
            , solid = Color.rgb255 70 167 88
            , solidStrong = Color.rgb255 83 179 101
            , solidText = Color.rgb255 255 255 255
            , textSubtle = Color.rgb255 113 208 131
            , text = Color.rgb255 194 240 194
            , shadow = Color.rgb255 0 0 0
            }
        |> W.Theme.withWarningColor
            { bg = Color.rgb255 55 50 42
            , bgSubtle = Color.rgb255 49 46 40
            , tintSubtle = Color.rgb255 69 58 36
            , tint = Color.rgb255 83 64 24
            , tintStrong = Color.rgb255 93 71 23
            , accentSubtle = Color.rgb255 93 71 23
            , accent = Color.rgb255 104 83 37
            , accentStrong = Color.rgb255 121 98 50
            , solidSubtle = Color.rgb255 255 179 0
            , solid = Color.rgb255 255 197 61
            , solidStrong = Color.rgb255 255 208 97
            , solidText = Color.rgb255 29 24 15
            , textSubtle = Color.rgb255 255 202 22
            , text = Color.rgb255 255 231 179
            , shadow = Color.rgb255 0 0 0
            }
        |> W.Theme.withDangerColor
            { bg = Color.rgb255 58 44 43
            , bgSubtle = Color.rgb255 53 44 43
            , tintSubtle = Color.rgb255 86 43 41
            , tint = Color.rgb255 106 40 39
            , tintStrong = Color.rgb255 120 44 45
            , accentSubtle = Color.rgb255 120 44 45
            , accent = Color.rgb255 135 54 54
            , accentStrong = Color.rgb255 157 67 66
            , solidSubtle = Color.rgb255 220 52 57
            , solid = Color.rgb255 229 72 77
            , solidStrong = Color.rgb255 236 93 94
            , solidText = Color.rgb255 255 255 255
            , textSubtle = Color.rgb255 255 149 146
            , text = Color.rgb255 255 209 217
            , shadow = Color.rgb255 0 0 0
            }


lightTheme : W.Theme.Theme
lightTheme =
    W.Theme.lightTheme
        |> W.Theme.withBaseColor
            { bg = primary100
            , bgSubtle = primary175

            -- Tint
            , tintSubtle = primary225
            , tint = primary250
            , tintStrong = primary300

            -- Accent
            , accentSubtle = primary250
            , accent = primary300
            , accentStrong = primary350

            -- Solid
            , solidSubtle = primary375
            , solid = primary400
            , solidStrong = primary425
            , solidText = Color.white

            -- Text
            , text = primary750
            , textSubtle = primary450

            -- Shadow
            , shadow = primary750
            }
        |> W.Theme.withPrimaryColor
            { bg = Color.white
            , bgSubtle = primary100

            -- Tint
            , tintSubtle = primary150
            , tint = primary175
            , tintStrong = primary200

            -- Accent
            , accentSubtle = primary250
            , accent = primary300
            , accentStrong = primary350

            -- Solid
            , solidSubtle = primary625
            , solid = primary700
            , solidStrong = primary800
            , solidText = Color.white

            -- Text
            , text = primary750
            , textSubtle = primary450

            -- Shadow
            , shadow = primary750
            }
        |> W.Theme.withSecondaryColor lightDisabledColorScale
        |> W.Theme.withSuccessColor
            { grass
                | bg = Color.rgb255 239 242 239
                , bgSubtle = Color.rgb255 232 238 233

                -- Tint
                , tintSubtle = Color.rgb255 219 233 220
                , tint = Color.rgb255 203 226 205
                , tintStrong = Color.rgb255 185 217 188

                -- Accent
                , accentSubtle = Color.rgb255 185 217 188
                , accent = Color.rgb255 162 206 166
                , accentStrong = Color.rgb255 132 190 138
            }
        |> W.Theme.withWarningColor
            { bg = Color.rgb255 242 241 239
            , bgSubtle = Color.rgb255 245 237 221
            , tintSubtle = Color.rgb255 253 229 181
            , tint = Color.rgb255 254 218 146
            , tintStrong = Color.rgb255 253 212 128
            , accentSubtle = Color.rgb255 252 206 111
            , accent = Color.rgb255 236 194 107
            , accentStrong = Color.rgb255 216 177 93
            , solidSubtle = Color.rgb255 255 208 97
            , solid = Color.rgb255 255 197 61
            , solidStrong = Color.rgb255 255 186 24
            , solidText = Color.rgb255 79 52 34
            , textSubtle = Color.rgb255 171 100 0
            , text = Color.rgb255 79 52 34
            , shadow = Color.rgb255 171 100 0
            }
        |> W.Theme.withDangerColor
            { bg = Color.rgb255 243 240 240
            , bgSubtle = Color.rgb255 242 235 234
            , tintSubtle = Color.rgb255 241 222 220
            , tint = Color.rgb255 247 205 202
            , tintStrong = Color.rgb255 244 190 187
            , accentSubtle = Color.rgb255 244 190 187
            , accent = Color.rgb255 237 174 170
            , accentStrong = Color.rgb255 227 153 149
            , solidSubtle = Color.rgb255 236 83 88
            , solid = Color.rgb255 229 72 77
            , solidStrong = Color.rgb255 220 62 66
            , solidText = Color.rgb255 255 255 255
            , textSubtle = Color.rgb255 206 44 49
            , text = Color.rgb255 100 23 35
            , shadow = Color.rgb255 206 44 49
            }


grass : W.Theme.ColorScale
grass =
    W.Theme.Colors.grass
