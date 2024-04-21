/**
 * Constants
 */

const NAMESPACE = "w";

function cssVar(id) {
  return `var(--${NAMESPACE}-${id})`;
}

/**
 * Fonts
 */

const fontFamily = {
  heading: cssVar("font-heading"),
  text: cssVar("font-text"),
  code: cssVar("font-code"),
};

/**
 * Border Radius
 */

const borderRadius = {
  none: "0",
  xs: cssVar("border-xs"),
  sm: cssVar("border-sm"),
  DEFAULT: cssVar("border-md"),
  lg: cssVar("border-lg"),
  xl: cssVar("border-xl"),
};

/**
 * Colors
 */

const colorVariants = [
  ["DEFAULT", "bg"],
  ["soft", "bg-soft"],
  ["tint", "tint"],
  ["tint-soft", "tint-soft"],
  ["tint-hover", "tint-hover"],
  ["detail", "detail"],
  ["detail-soft", "detail-soft"],
  ["detail-hover", "detail-hover"],
  ["solid", "solid"],
  ["solid-soft", "solid-soft"],
  ["solid-hover", "solid-hover"],
];

const colorVariables = [
  "base",
  "primary",
  "secondary",
  "success",
  "warning",
  "danger"
];

const colors = colorVariables.reduce((acc, variable) => {
  acc[variable] = colorVariants.reduce((accum, [k, v]) => {
    accum[k] = cssVar(`${variable}-${v}`);
    return accum;
  }, {});

  return acc;
}, {});

/**
 * Text Colors
 */

const textColorVariants = [
  ["DEFAULT", "text"],
  ["soft", "text-soft"],
  ["solid", "solid-text"]
];

const textColors = colorVariables.reduce((acc, variable) => {
  acc[variable] = textColorVariants.reduce((accum, [k, v]) => {
    if (variable === "base" && k === "DEFAULT") {
      accum["text"] = cssVar("base-text");
    } else {
      accum[k] = cssVar(`${variable}-${v}`);
    }

    return accum;
  }, {});

  return acc;
}, {
  soft: cssVar("base-text-soft"),
  default: cssVar("base-text")
});

/**
 * Text Components (default color inside backgrounds)
 */

const textComponents = colorVariables.reduce((acc, variable) => {
  acc[`.bg-${variable}-solid, .bg-${variable}-solid-soft, .bg-${variable}-solid-hover`] = {
    color: cssVar(`${variable}-solid-text`)
  };

  acc[`.bg-${variable}, .bg-${variable}-soft, .bg-${variable}-tint, .bg-${variable}-tint-soft, .bg-${variable}-tint-hover`] = {
    color: cssVar(`${variable}-text`)
  };

  return acc;
}, {});

/**
 * Export
 */

module.exports = {
  optionsHandler: (options = {}) => {
    return ({ addBase, addComponents }) => {
      if (options.strict) {
        addBase({
          body: {
            background: colors["base-bg"],
            color: textColors.default,
            fontFamily: fontFamily.text,
          },
          h1: {
            fontFamily: fontFamily.heading,
          },
          h2: {
            fontFamily: fontFamily.heading,
          },
          h3: {
            fontFamily: fontFamily.heading,
          },
          h4: {
            fontFamily: fontFamily.heading,
          },
          h5: {
            fontFamily: fontFamily.heading,
          },
          h6: {
            fontFamily: fontFamily.heading,
          },
          code: {
            fontFamily: fontFamily.code,
          },
        });
      }

      addComponents(textComponents)
    };
  },
  themeHandler: (options = {}) => {
    const extraColors = options.extraColors || {};
    const strictTextColors = options.strictTextColors ?? true;


    const textColor = strictTextColors ? { textColor: textColors } : {};
    const textColorExtended = strictTextColors ? {} : { textColor: textColors };

    const values = {
      fontFamily,
      borderRadius,
      colors: {
        black: "#000000",
        white: "#ffffff",
        inherit: "inherit",
        current: "currentColor",
        transparent: "transparent",
        ...extraColors,
        ...colors,
      },
      ...textColor
    };

    return options.strict
      ? { theme: { ...values, extend: textColorExtended } }
      : { theme: { extend: { ...values, ...textColorExtended }, ...textColor } };
  }
};
