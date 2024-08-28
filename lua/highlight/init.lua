-- Comment = { fg = "vscHighlightGray" },
-- String = { fg = "vscHighlightStr" },
-- Number = { fg = "vscHighlightNum" },
-- Function = { fg = "vscHighlightStr" },
-- Boolean = { fg = "vscHighlightBool", italic = true },
-- Keyword = { fg = "vscHighlightKeyword", italic = true },
-- Class = { fg = "vscHighlightGreen", italic = true },
-- -- 类型定义
-- Type = { fg = "vscHighlightGreen", italic = true },
-- TypeDef = { fg = "vscHighlightGreen", italic = true },
-- Interface = { fg = "vscHighlightGreen", italic = true },
-- Enum = { fg = "vscHighlightGreen", italic = true },
-- TypeParameter = { fg = "vscHighlightGreen", italic = true },
-- Parameter = { fg = "vscHighlightGreen", italic = true },
-- Property = { fg = "vscHighlightGreen", italic = true },
-- Variable = { fg = "vscHighlightGreen", italic = true },
-- TSFunction = { fg = "vscHighlightStr" },
-- TSMethod = { fg = "vscHighlightStr" },
-- TSProperty = { fg = "vscHighlightStr" },
-- TSConstructor = { fg = "vscHighlightStr" },
-- TSClass = { fg = "vscHighlightStr" },
-- TSType = { fg = "vscHighlightStr" },
-- TSInterface = { fg = "vscHighlightStr" },
-- TSEnum = { fg = "vscHighlightStr" },
-- TSTypeParameter = { fg = "vscHighlightStr" },
-- TSParameter = { fg = "vscHighlightStr" },
-- TSVariable = { fg = "vscHighlightStr" },

local set_hl = vim.api.nvim_set_hl
local M = {}

M.set_highlights = function()
  local hl = {}

  -- 其他
  hl["AlphaHeader"] = { fg = "#311b92", bg = "NONE" }
  hl["AlphaButtons"] = { fg = "#3399ff", bg = "NONE" }
  hl["AlphaShortcut"] = { fg = "#53C670", bg = "NONE" }
  hl["AlphaFooter"] = { fg = "#311b92", bg = "NONE" }
  -- 其他

  -- 第一组
  hl["Comment"] = { fg = "#949494", bg = "NONE" }
  hl["Number"] = { fg = "#ffd700", bg = "NONE" }
  hl["String"] = { fg = "#87ff7c", bg = "NONE" }
  hl["Character"] = { fg = "#87ff7c", bg = "NONE" }
  hl["Boolean"] = { fg = "#569cd6", bg = "NONE" }
  hl["Float"] = { fg = "#ffd700", bg = "NONE" }
  -- TODO: 目前未知左侧标签颜色命名
  -- let 和 /> (自闭合标签右侧)
  hl["Identifier"] = { fg = "#ff76ff", bg = "NONE" }
  hl["Function"] = { fg = "#ff76ff", bg = "NONE" }
  -- return await
  hl["Statement"] = { fg = "#ff76ff", bg = "NONE" }
  -- if else
  hl["Conditional"] = { fg = "#ff76ff", bg = "NONE" }
  hl["Repeat"] = { fg = "#ff76ff", bg = "NONE" }
  hl["Label"] = { fg = "#569cd6", bg = "NONE" }
  hl["Operator"] = { fg = "#d4d4d4", bg = "NONE" }
  hl["Keyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["Exception"] = { fg = "#ff76ff", bg = "NONE" }
  hl["PreProc"] = { fg = "#ff76ff", bg = "NONE" }
  hl["Include"] = { fg = "#ff76ff", bg = "NONE" }
  hl["Define"] = { fg = "#ff76ff", bg = "NONE" }
  hl["Macro"] = { fg = "#ff76ff", bg = "NONE" }
  hl["Type"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["StorageClass"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Structure"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Typedef"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Special"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["SpecialChar"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Tag"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Delimiter"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["SpecialComment"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Debug"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Underlined"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Ignore"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["Error"] = { fg = "NONE", bg = "#d16969" }
  hl["Todo"] = { fg = "NONE", bg = "#569cd6" }

  -- 第二组 Treesitter
  hl["@error"] = { fg = "#d16969", bg = "NONE" }
  hl["@punctuation.bracket"] = { fg = "#d4d4d4", bg = "NONE" }
  hl["@punctuation.delimiter"] = { fg = "#d4d4d4", bg = "NONE" }
  hl["@punctuation.special"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@comment"] = { fg = "#949494", bg = "NONE" }
  hl["@comment.note"] = { fg = "#949494", bg = "NONE" }
  hl["@comment.warning"] = { fg = "#ffd700", bg = "NONE" }
  hl["@comment.error"] = { fg = "#d16969", bg = "NONE" }
  hl["@constant"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@constant.builtin"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@constant.library"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@string.regexp"] = { fg = "#d16969", bg = "NONE" }
  hl["@string"] = { fg = "#87ff7c", bg = "NONE" }
  hl["@character"] = { fg = "#87ff7c", bg = "NONE" }
  hl["@number"] = { fg = "#ffd700", bg = "NONE" }
  hl["@number.float"] = { fg = "#ffd700", bg = "NONE" }
  hl["@boolean"] = { fg = "#569cd6", bg = "NONE" }
  hl["@annotation"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@attribute"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@attribute.builtin"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@module"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@function"] = { fg = "#00e4e5", bg = "NONE" }
  hl["@function.builtin"] = { fg = "#00e4e5", bg = "NONE" }
  hl["@function.macros"] = { fg = "#00e4e5", bg = "NONE" }
  hl["@function.method"] = { fg = "#00e4e5", bg = "NONE" }
  hl["@define"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@variable"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@variable.builtin"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@variable.parameter"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@variable.parameter.reference"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@variable.member"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@property"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@constructor"] = { fg = "#00e4e5", bg = "NONE" }
  hl["@label"] = { fg = "#569cd6", bg = "NONE" }
  hl["@keyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@keyword.conditional"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@keyword.repeat"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@keyword.return"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@keyword.exception"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@keyword.import"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@operator"] = { fg = "#d4d4d4", bg = "NONE" }
  hl["@type"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@type.qualifier"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@structure"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@tag"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@tag.builtin"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@tag.delimiter"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@tag.attribute"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@text"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@markup.strong"] = { fg = "#d3c3ff", bg = "NONE", bold = true }
  hl["@markup.italic"] = { fg = "#d3c3ff", bg = "NONE", italic = true }
  hl["@markup.underline"] = { fg = "#d3c3ff", bg = "NONE", underline = true }
  hl["@markup.strikethrough"] = { fg = "#d3c3ff", bg = "NONE", strikethrough = true }
  hl["@markup.heading"] = { fg = "#d3c3ff", bg = "NONE", bold = true }
  hl["@markup.raw"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@markup.raw.markdown"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@markup.raw.markdown_inline"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@markup.link.label"] = { fg = "#d3c3ff", bg = "NONE", underline = true }
  hl["@markup.link.url"] = { fg = "#d3c3ff", bg = "NONE", underline = true }
  hl["@markup.list.checked"] = { fg = "#569cd6", bg = "NONE" }
  hl["@markup.list.unchecked"] = { fg = "#569cd6", bg = "NONE" }
  hl["@textReference"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@stringEscape"] = { fg = "#d3c3ff", bg = "NONE", bold = true }
  hl["diff.plus"] = { fg = "#00e4f5", bg = "NONE" }
  hl["diff.minus"] = { fg = "#d16969", bg = "NONE" }
  hl["diff.delta"] = { fg = "#d16969", bg = "NONE" }

  -- 第三组 LSP semantic tokens
  hl["@type.builtin"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@lsp.typemod.type.defaultLibrary"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@lsp.type.type"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@lsp.type.typeParameter"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@lsp.type.macro"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@lsp.type.enumMember"] = { fg = "#4ec9b0", bg = "NONE" }
  -- 常量
  hl["@lsp.typemod.variable.readonly"] = { fg = "#4fc1ff", bg = "NONE" }
  hl["@lsp.typemod.property.readonly"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@lsp.typemod.variable.constant"] = { fg = "#4ec9b0", bg = "NONE" }
  -- 可能是成员方法
  hl["@lsp.type.member"] = { fg = "#00e4f5", bg = "NONE" }
  hl["@lsp.type.keyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@lsp.typemod.keyword.controlFlow"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@lsp.type.comment.c"] = { fg = "#949494", bg = "NONE" }
  hl["@lsp.type.comment.cpp"] = { fg = "#949494", bg = "NONE" }
  hl["@event"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@interface"] = { fg = "#ff76ff", bg = "NONE" }
  hl["@modifier"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["@regexp"] = { fg = "#d16969", bg = "NONE" }
  hl["@decorator"] = { fg = "#d3c3ff", bg = "NONE" }

  -- 第四组 Markdown
  hl["markdownBold"] = { fg = "#00e4f5", bg = "NONE", bold = true }
  hl["markdownCode"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["markdownRule"] = { fg = "#00e4f5", bg = "NONE", bold = true }
  hl["markdownCodeDelimiter"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["markdownHeadingDelimiter"] = { fg = "#00e4f5", bg = "NONE" }
  hl["markdownFootnote"] = { fg = "#87ff7c", bg = "NONE" }
  hl["markdownFootnoteDefinition"] = { fg = "#87ff7c", bg = "NONE" }
  hl["markdownUrl"] = { fg = "#87ff7c", bg = "NONE", underline = true }
  hl["markdownLinkText"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["markdownEscape"] = { fg = "#d3c3ff", bg = "NONE" }

  -- 第五组 Asciidoc 未定义的高亮组

  -- 第六组 JSON
  hl["jsonKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["jsonEscape"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsonNull"] = { fg = "#569cd6", bg = "NONE" }
  hl["jsonBoolean"] = { fg = "#569cd6", bg = "NONE" }

  -- 第七组 HTML
  hl["htmlTag"] = { fg = "#569cd6", bg = "NONE" }
  hl["htmlEndTag"] = { fg = "#569cd6", bg = "NONE" }
  hl["htmlTagName"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["htmlArg"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["htmlSpecialTagName"] = { fg = "#d3c3ff", bg = "NONE" }

  -- 第八组 PHP 未定义的高亮组

  -- 第九组 CSS
  hl["cssBraces"] = { fg = "#ffd700", bg = "NONE" }
  hl["cssInclude"] = { fg = "#ff76ff", bg = "NONE" }
  hl["cssTagName"] = { fg = "#d7ba7d", bg = "NONE" }
  hl["cssClassName"] = { fg = "#d7ba7d", bg = "NONE" }
  hl["cssPseudoClass"] = { fg = "#d7ba7d", bg = "NONE" }
  hl["cssPseudoClassId"] = { fg = "#d7ba7d", bg = "NONE" }
  hl["cssPseudoClassLang"] = { fg = "#d7ba7d", bg = "NONE" }
  hl["cssIdentifier"] = { fg = "#9cdcfe", bg = "NONE" }
  hl["cssProp"] = { fg = "#9cdcfe", bg = "NONE" }
  hl["cssDefinition"] = { fg = "#9cdcfe", bg = "NONE" }
  hl["cssAttr"] = { fg = "#9cdcfe", bg = "NONE" }
  hl["cssAttrRegion"] = { fg = "#9cdcfe", bg = "NONE" }
  hl["cssColor"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["cssFunction"] = { fg = "#00e4f5", bg = "NONE" }
  hl["cssFunctionName"] = { fg = "#00e4f5", bg = "NONE" }
  hl["cssVendor"] = { fg = "#d7ba7d", bg = "NONE" }
  hl["cssValueNumber"] = { fg = "#ffd700", bg = "NONE" }
  hl["cssValueLength"] = { fg = "#b5cea8", bg = "NONE" }
  hl["cssUnitDecorators"] = { fg = "#b5cea8", bg = "NONE" }
  hl["cssStyle"] = { fg = "#9cdcfe", bg = "NONE" }
  hl["cssImportant"] = { fg = "#569cd6", bg = "NONE" }

  -- 第十组 JavaScript
  hl["jsVariableDef"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsFuncArgs"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsFuncBlock"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsRegexpString"] = { fg = "#d16969", bg = "NONE" }
  hl["jsThis"] = { fg = "#569cd6", bg = "NONE" }
  hl["jsOperatorKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["jsDestructuringBlock"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsObjectKey"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsGlobalObjects"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["jsModuleKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["jsClassDefinition"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["jsClassKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["jsExtendsKeyword"] = { fg = "#569cd6", bg = "NONE" }
  hl["jsExportDefault"] = { fg = "#ff76ff", bg = "NONE" }
  hl["jsFuncCall"] = { fg = "#00e4f5", bg = "NONE" }
  hl["jsObjectValue"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsParen"] = { fg = "#ffd700", bg = "NONE" }
  hl["jsObjectProp"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsIfElseBlock"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsParenIfElse"] = { fg = "#ffd700", bg = "NONE" }
  hl["jsSpreadOperator"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["jsSpreadExpression"] = { fg = "#d3c3ff", bg = "NONE" }

  -- 以下关键词未验证是否有效
  -- hl['jsAwaitKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsBreakKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsCaseKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsCatchKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsConstKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsContinueKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsDebuggerKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsDefaultKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsDeleteKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsDoKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsDoubleKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsElseKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsEnumKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsExportKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsFinallyKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsForKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsFunctionKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsIfKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsImportKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsInKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsInstanceofKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsLetKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsNewKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsNullKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsReturnKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsSuperKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsSwitchKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsThisKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsThrowKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsTryKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsTypeofKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsVarKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsVoidKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsWhileKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsWithKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- hl['jsYieldKeyword'] = { fg = "#ff76ff", bg = "NONE" }
  -- 以上关键词未验证是否有效

  -- 第十一组 TypeScript
  hl["@type.builtin.typescript"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["@type.builtin.tsx"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["typescriptLabel"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptExceptions"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptBraces"] = { fg = "#ffd700", bg = "NONE" }
  hl["typescriptEndColons"] = { fg = "#d4d4d4", bg = "NONE" }
  hl["typescriptParens"] = { fg = "#ffd700", bg = "NONE" }
  hl["typescriptDocTags"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptDocComment"] = { fg = "#949494", bg = "NONE" }
  hl["typescriptLogicSymbols"] = { fg = "#d4d4d4", bg = "NONE" }
  hl["typescriptImport"] = { fg = "#ff76ff", bg = "NONE" }
  -- TODO: 没懂这个是什么 typescriptBOM：用于 TypeScript 的字节顺序标记（BOM）
  hl["typescriptBOM"] = { fg = "#d3c3ff", bg = "NONE" }
  -- TODO: 没懂这个是什么 typescriptVariableDeclaration：— 用于 TypeScript 中的变量声明
  hl["typescriptVariableDeclaration"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptVariable"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptExport"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptAliasDeclaration"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptAliasKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptClassName"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptAccessibilityModifier"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptOperator"] = { fg = "#d4d4d4", bg = "NONE" }
  hl["typescriptArrowFunc"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptMethodAccessor"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptMember"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptTypeReference"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["typescriptTemplateSB"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptArrowFuncArg"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptParamImpl"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptFuncComma"] = { fg = "#d4d4d4", bg = "NONE" }
  hl["typescriptCastKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptCall"] = { fg = "#00e4f5", bg = "NONE" }
  hl["typescriptCase"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptReserved"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptDefault"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptDecorator"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptPredefinedType"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["typescriptClassHeritage"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["typescriptClassExtends"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptClassKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptBlock"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptDOMDocProp"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptTemplateSubstitution"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptClassBlock"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptFuncCallArg"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptIndexExpr"] = { fg = "#d3c3ff", bg = "NONE" }
  hl["typescriptConditionalParen"] = { fg = "#ffd700", bg = "NONE" }
  hl["typescriptArray"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptES6SetProp"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptObjectLiteral"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptTypeParameter"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptEnumKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptEnum"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptLoopParen"] = { fg = "#ffd700", bg = "NONE" }
  hl["typescriptParenExp"] = { fg = "#ffd700", bg = "NONE" }
  hl["typescriptModule"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptAmbientDeclaration"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptFuncTypeArrow"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptInterfaceHeritage"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptInterfaceName"] = { fg = "#4ec9b0", bg = "NONE" }
  hl["typescriptInterfaceKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptInterfaceExtends"] = { fg = "#569cd6", bg = "NONE" }
  hl["typescriptGlobal"] = { fg = "#9cdcef", bg = "NONE" }
  hl["typescriptAsyncFuncKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptFuncKeyword"] = { fg = "#ff76ff", bg = "NONE" }
  hl["typescriptGlobalMethod"] = { fg = "#00e4f5", bg = "NONE" }
  hl["typescriptPromiseMethod"] = { fg = "#00e4f5", bg = "NONE" }

  -- 第十二组 XML
  hl["xmlTag"] = { fg = "#569cd6", bg = "NONE" }
  hl["xmlEndTag"] = { fg = "#569cd6", bg = "NONE" }
  hl["xmlTagName"] = { fg = "#d3c3ff", bg = "NONE" }

  -- 第十三组 Ruby 未定义的高亮组

  -- 第十四组 Golang 未定义的高亮组

  -- 第十五组 Python 未定义的高亮组

  -- 第十六组 TeX 未定义的高亮组

  -- 第十七组 GIT 未定义的高亮组

  -- 未处理
  return hl
end

return M

-- 第一组 未定义的高亮组
-- Normal
-- ColorColumn
-- Cursor
-- CursorLine
-- CursorColumn
-- Directory
-- DiffAdd
-- DiffChangeDark
-- DiffDeleteLight
-- DiffTextLight
-- EndOfBuffer
-- ErrorMsg
-- VertSplitcBack
-- WinSeparator
-- FoldColumn
-- SignColumn
-- IncSearch
-- LineNr
-- CursorLineNr
-- MatchParen
-- ModeMsg
-- MoreMsg
-- NonText
-- Pmenu
-- PmenuSel
-- PmenuSbar
-- PmenuThumb
-- Question
-- Search
-- SpecialKey
-- StatusLine
-- StatusLineNC
-- TabLine
-- TabLineFill
-- TabLineSel
-- Title
-- Visual
-- VisualNOS
-- WarningMsg
-- WildMenu
-- SpellBad
-- SpellCap
-- SpellRare
-- SpellLocal
-- Whitespace
-- NormalFloat
-- WinBarNc
-- QuickFixLine

-- 第二组 Treesitter 均重写高亮组

-- 第三组 LSP semantic tokens 均重写高亮组

-- 第四组 Markdown 均重写高亮组

-- 第五组 Asciidoc 未定义的高亮组
-- asciidocAttributeEntry
-- asciidocAttributeList
-- asciidocAttributeRef
-- asciidocHLabel
-- asciidocListingBlock
-- asciidocMacroAttributes
-- asciidocOneLineTitle
-- asciidocPassthroughBlock
-- asciidocQuotedMonospaced
-- asciidocTriplePlusPassthrough
-- asciidocMacro
-- asciidocAdmonition
-- asciidocQuotedEmphasized
-- asciidocQuotedEmphasized2
-- asciidocQuotedEmphasizedItalic
-- asciidocBackslash
-- asciidocQuotedBold
-- asciidocQuotedMonospaced2
-- asciidocQuotedUnconstrainedBold
-- asciidocQuotedUnconstrainedEmphasized
-- asciidocURL

-- 第六组 JSON 均重写高亮组

-- 第七组 HTML 均重写高亮组

-- 第八组 PHP 未定义的高亮组
-- phpStaticClasses
-- phpMethod
-- phpClass
-- phpFunction
-- phpInclude
-- phpUseClass
-- phpRegion
-- phpMethodsVar

-- 第九组 CSS 均重写高亮组

-- 第十组 JavaScript 均重写高亮组

-- 第十一组 TypeScript 均重写高亮组

-- 第十二组 XML 均重写高亮组

-- 第十三组 Ruby 未定义的高亮组
-- rubyClassNameTag
-- rubyClassName
-- rubyModuleName
-- rubyConstant

-- 第十四组 Golang 未定义的高亮组
-- goPackage
-- goImport
-- goVar
-- goConst
-- goStatement
-- goType
-- goSignedInts
-- goUnsignedInts
-- goFloats
-- goComplexes
-- goBuiltins
-- goBoolean
-- goPredefinedIdentifiers
-- goTodo
-- goDeclaration
-- goDeclType
-- goTypeDecl
-- goTypeName
-- goVarAssign
-- goVarDefs
-- goReceiver
-- goReceiverType
-- goFunctionCall
-- goMethodCall
-- goSingleDecl

-- 第十五组 Python 未定义的高亮组
-- pythonStatement
-- pythonOperator
-- pythonException
-- pythonExClass
-- pythonBuiltinObj
-- pythonBuiltinType
-- pythonBoolean
-- pythonNone
-- pythonTodo
-- pythonClassVar
-- pythonClassDef
-- @constructor.python

-- 第十六组 TeX 未定义的高亮组
-- texStatement
-- texBeginEnd
-- texBeginEndName
-- texOption
-- texBeginEndModifier
-- texDocType
-- texDocTypeArgs

-- 第十七组 GIT 未定义的高亮组
-- gitcommitHeader
-- gitcommitOnBranch
-- gitcommitBranch
-- gitcommitComment
-- gitcommitSelectedType
-- gitcommitSelectedFile
-- gitcommitDiscardedType
-- gitcommitDiscardedFile
-- gitcommitOverflow
-- gitcommitSummary
-- gitcommitBlank

-- Lua
-- hl(0, 'luaFuncCall', { fg = c.vscYellow, bg = 'NONE' })
-- hl(0, 'luaFuncArgName', { fg = c.vscLightBlue, bg = 'NONE' })
-- hl(0, 'luaFuncKeyword', { fg = c.vscPink, bg = 'NONE' })
-- hl(0, 'luaLocal', { fg = c.vscPink, bg = 'NONE' })
-- hl(0, 'luaBuiltIn', { fg = c.vscBlue, bg = 'NONE' })

-- SH
-- hl(0, 'shDeref', { fg = c.vscLightBlue, bg = 'NONE' })
-- hl(0, 'shVariable', { fg = c.vscLightBlue, bg = 'NONE' })

-- SQL
-- hl(0, 'sqlKeyword', { fg = c.vscPink, bg = 'NONE' })
-- hl(0, 'sqlFunction', { fg = c.vscYellowOrange, bg = 'NONE' })
-- hl(0, 'sqlOperator', { fg = c.vscPink, bg = 'NONE' })

-- YAML
-- hl(0, 'yamlKey', { fg = c.vscBlue, bg = 'NONE' })
-- hl(0, 'yamlConstant', { fg = c.vscBlue, bg = 'NONE' })

-- Gitgutter
-- hl(0, 'GitGutterAdd', { fg = c.vscGreen, bg = 'NONE' })
-- hl(0, 'GitGutterChange', { fg = c.vscYellow, bg = 'NONE' })
-- hl(0, 'GitGutterDelete', { fg = c.vscRed, bg = 'NONE' })

-- Git Signs
-- hl(0, 'GitSignsAdd', { fg = c.vscGreen, bg = 'NONE' })
-- hl(0, 'GitSignsChange', { fg = c.vscYellow, bg = 'NONE' })
-- hl(0, 'GitSignsDelete', { fg = c.vscRed, bg = 'NONE' })
-- hl(0, 'GitSignsAddLn', { fg = c.vscBack, bg = c.vscGreen })
-- hl(0, 'GitSignsChangeLn', { fg = c.vscBack, bg = c.vscYellow })
-- hl(0, 'GitSignsDeleteLn', { fg = c.vscBack, bg = c.vscRed })

-- NvimTree
-- hl(0, 'NvimTreeRootFolder', { fg = c.vscFront, bg = 'NONE', bold = true })
-- hl(0, 'NvimTreeGitDirty', { fg = c.vscYellow, bg = 'NONE' })
-- hl(0, 'NvimTreeGitNew', { fg = c.vscGreen, bg = 'NONE' })
-- hl(0, 'NvimTreeImageFile', { fg = c.vscViolet, bg = 'NONE' })
-- hl(0, 'NvimTreeEmptyFolderName', { fg = c.vscGray, bg = 'NONE' })
-- hl(0, 'NvimTreeFolderName', { fg = c.vscFront, bg = 'NONE' })
-- hl(0, 'NvimTreeSpecialFile', { fg = c.vscPink, bg = 'NONE', underline = true })
-- hl(0, 'NvimTreeNormal', { fg = c.vscFront, bg = opts.disable_nvimtree_bg and c.vscBack or c.vscLeftDark })
-- hl(0, 'NvimTreeCursorLine', { fg = 'NONE', bg = opts.disable_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftMid })
-- hl(0, 'NvimTreeVertSplit', { fg = opts.disable_nvimtree_bg and c.vscSplitDark or c.vscBack, bg = c.vscBack })
-- hl(0, 'NvimTreeEndOfBuffer', { fg = opts.disable_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftDark })
-- hl(
--     0,
--     'NvimTreeOpenedFolderName',
--     { fg = 'NONE', bg = opts.disable_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftDark }
-- )
-- hl(0, 'NvimTreeGitRenamed', { fg = c.vscGitRenamed, bg = 'NONE' })
-- hl(0, 'NvimTreeGitIgnored', { fg = c.vscGitIgnored, bg = 'NONE' })
-- hl(0, 'NvimTreeGitDeleted', { fg = c.vscGitDeleted, bg = 'NONE' })
-- hl(0, 'NvimTreeGitStaged', { fg = c.vscGitStageModified, bg = 'NONE' })
-- hl(0, 'NvimTreeGitMerge', { fg = c.vscGitUntracked, bg = 'NONE' })
-- hl(0, 'NvimTreeGitDirty', { fg = c.vscGitModified, bg = 'NONE' })
-- hl(0, 'NvimTreeGitNew', { fg = c.vscGitAdded, bg = 'NONE' })

-- Bufferline
-- hl(0, 'BufferLineIndicatorSelected', { fg = c.vscLeftDark, bg = 'NONE' })
-- hl(0, 'BufferLineFill', { fg = 'NONE', bg = opts.transparent and c.vscBack or c.vscLeftDark })

-- BarBar
-- hl(0, 'BufferCurrent', { fg = c.vscFront, bg = c.vscTabCurrent })
-- hl(0, 'BufferCurrentIndex', { fg = c.vscFront, bg = c.vscTabCurrent })
-- hl(0, 'BufferCurrentMod', { fg = c.vscYellowOrange, bg = c.vscTabCurrent })
-- hl(0, 'BufferCurrentSign', { fg = c.vscFront, bg = c.vscTabCurrent })
-- hl(0, 'BufferCurrentTarget', { fg = c.vscRed, bg = c.vscTabCurrent })
-- hl(0, 'BufferVisible', { fg = c.vscGray, bg = c.vscTabCurrent })
-- hl(0, 'BufferVisibleIndex', { fg = c.vscGray, bg = c.vscTabCurrent })
-- hl(0, 'BufferVisibleMod', { fg = c.vscYellowOrange, bg = c.vscTabCurrent })
-- hl(0, 'BufferVisibleSign', { fg = c.vscGray, bg = c.vscTabCurrent })
-- hl(0, 'BufferVisibleTarget', { fg = c.vscRed, bg = c.vscTabCurrent })
-- hl(0, 'BufferInactive', { fg = c.vscGray, bg = c.vscTabOther })
-- hl(0, 'BufferInactiveIndex', { fg = c.vscGray, bg = c.vscTabOther })
-- hl(0, 'BufferInactiveMod', { fg = c.vscYellowOrange, bg = c.vscTabOther })
-- hl(0, 'BufferInactiveSign', { fg = c.vscGray, bg = c.vscTabOther })
-- hl(0, 'BufferInactiveTarget', { fg = c.vscRed, bg = c.vscTabOther })
-- hl(0, 'BufferTabpage', { fg = c.vscFront, bg = c.vscTabOther })
-- hl(0, 'BufferTabpageFill', { fg = c.vscFront, bg = c.vscTabOther })
-- hl(0, 'BufferTabpages', { fg = c.vscFront, bg = c.vscTabOther })
-- hl(0, 'BufferTabpagesFill', { fg = c.vscFront, bg = c.vscTabOther })

-- IndentBlankLine
-- hl(0, 'IndentBlanklineContextChar', { fg = c.vscContextCurrent, bg = 'NONE', nocombine = true })
-- hl(0, 'IndentBlanklineContextStart', { sp = c.vscContextCurrent, bg = 'NONE', nocombine = true, underline = true })
-- hl(0, 'IndentBlanklineChar', { fg = c.vscContext, bg = 'NONE', nocombine = true })
-- hl(0, 'IndentBlanklineSpaceChar', { fg = c.vscContext, bg = 'NONE', nocombine = true })
-- hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = c.vscContext, bg = 'NONE', nocombine = true })

-- Neotest
-- hl(0, 'NeotestAdapterName', { fg = c.vscFront, bold = true })
-- hl(0, 'NeotestDir', { fg = c.vscBlue })
-- hl(0, 'NeotestExpandMarker', { fg = c.vscDimHighlight })
-- hl(0, 'NeotestFailed', { fg = c.vscRed })
-- hl(0, 'NeotestFile', { fg = c.vscBlue })
-- hl(0, 'NeotestFocused', { bold = true })
-- hl(0, 'NeotestIndent', { fg = c.vscDimHighlight })
-- hl(0, 'NeotestMarked', { fg = c.vscYellowOrange, bold = true })
-- hl(0, 'NeotestNamespace', { fg = c.vscPink })
-- hl(0, 'NeotestPassed', { fg = c.vscBlueGreen })
-- hl(0, 'NeotestRunning', { fg = c.vscDarkYellow })
-- hl(0, 'NeotestSkipped', { fg = c.vscBlue })
-- hl(0, 'NeotestTarget', { fg = c.vscLightRed })
-- hl(0, 'NeotestWatching', { fg = c.vscDarkYellow })
-- hl(0, 'NeotestWinSelect', { fg = c.vscBlue, bold = true })

-- LSP
-- hl(0, 'DiagnosticOk', { fg = c.vscBlueGreen, bg = 'NONE' })
-- hl(0, 'DiagnosticError', { fg = c.vscRed, bg = 'NONE' })
-- hl(0, 'DiagnosticWarn', { fg = c.vscYellow, bg = 'NONE' })
-- hl(0, 'DiagnosticInfo', { fg = c.vscBlue, bg = 'NONE' })
-- hl(0, 'DiagnosticHint', { fg = c.vscBlue, bg = 'NONE' })
-- hl(0, 'DiagnosticUnnecessary', { fg = c.vscDisabledBlue, bg = 'NONE' })
-- hl(0, 'DiagnosticUnderlineError', { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscRed })
-- hl(0, 'DiagnosticUnderlineWarn', { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscYellow })
-- hl(0, 'DiagnosticUnderlineInfo', { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscBlue })
-- hl(0, 'DiagnosticUnderlineHint', { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscBlue })
-- hl(0, 'LspReferenceText', { fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
-- hl(0, 'LspReferenceRead', { fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
-- hl(0, 'LspReferenceWrite', { fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })

-- Trouble
-- hl(0, 'TroubleNormal', { link = 'Normal' })
-- hl(0, 'TroubleNormalNC', { link = 'Normal' })

-- COC.nvim
-- hl(0, 'CocHighlightText', { fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
-- hl(0, 'CocHighlightRead', { fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
-- hl(0, 'CocHighlightWrite', { fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })

-- Nvim compe
-- hl(0, 'CmpItemKindVariable', { fg = c.vscLightBlue, bg = 'NONE' })
-- hl(0, 'CmpItemKindInterface', { fg = c.vscLightBlue, bg = 'NONE' })
-- hl(0, 'CmpItemKindText', { fg = c.vscLightBlue, bg = 'NONE' })
-- hl(0, 'CmpItemKindFunction', { fg = c.vscPink, bg = 'NONE' })
-- hl(0, 'CmpItemKindMethod', { fg = c.vscPink, bg = 'NONE' })
-- hl(0, 'CmpItemKindKeyword', { fg = c.vscFront, bg = 'NONE' })
-- hl(0, 'CmpItemKindProperty', { fg = c.vscFront, bg = 'NONE' })
-- hl(0, 'CmpItemKindUnit', { fg = c.vscFront, bg = 'NONE' })
-- hl(0, 'CmpItemKindConstructor', { fg = c.vscUiOrange, bg = 'NONE' })
-- hl(0, 'CmpItemMenu', { fg = c.vscPopupFront, bg = 'NONE' })
-- hl(0, 'CmpItemAbbr', { fg = c.vscFront, bg = 'NONE' })
-- hl(0, 'CmpItemAbbrDeprecated', { fg = c.vscCursorDark, bg = c.vscPopupBack, strikethrough = true })
-- hl(0, 'CmpItemAbbrMatch', { fg = isDark and c.vscMediumBlue or c.vscDarkBlue, bg = 'NONE', bold = true })
-- hl(0, 'CmpItemAbbrMatchFuzzy', { fg = isDark and c.vscMediumBlue or c.vscDarkBlue, bg = 'NONE', bold = true })

-- HiPhish/rainbow-delimiters.nvim
-- hl(0, 'RainbowDelimiterRed', { fg = c.vscPink, bg = 'NONE' })
-- hl(0, 'RainbowDelimiterOrange', { fg = c.vscOrange, bg = 'NONE' })
-- hl(0, 'RainbowDelimiterYellow', { fg = c.vscYellowOrange, bg = 'NONE' })
-- hl(0, 'RainbowDelimiterGreen', { fg = c.vscGreen, bg = 'NONE' })
-- hl(0, 'RainbowDelimiterCyan', { fg = c.vscBlueGreen, bg = 'NONE' })
-- hl(0, 'RainbowDelimiterBlue', { fg = c.vscMediumBlue, bg = 'NONE' })
-- hl(0, 'RainbowDelimiterViolet', { fg = c.vscViolet, bg = 'NONE' })

-- rcarriga/nvim-dap-ui
-- Source: https://github.com/rcarriga/nvim-dap-ui/blob/master/lua/dapui/config/highlights.lua
-- hl(0, 'DapUIBreakpointsCurrentLine', { fg = c.vscBlueGreen, bold = true })
-- hl(0, 'DapUIBreakpointsDisabledLine', { fg = c.vscDimHighlight })
-- hl(0, 'DapUIBreakpointsInfo', { fg = c.vscBlueGreen })
-- hl(0, 'DapUIBreakpointsLine', { fg = c.vscPink })
-- hl(0, 'DapUIBreakpointsPath', { fg = c.vscPink })
-- hl(0, 'DapUICurrentFrameName', { fg = c.vscBlueGreen, bold = true })
-- hl(0, 'DapUIDecoration', { fg = c.vscPink })
-- hl(0, 'DapUIFloatBorder', { fg = c.vscPink })
-- hl(0, 'DapUILineNumber', { fg = c.vscPink })
-- hl(0, 'DapUIModifiedValue', { fg = c.vscPink, bold = true })
-- hl(0, 'DapUIPlayPause', { fg = c.vscBlueGreen })
-- hl(0, 'DapUIPlayPauseNC', { fg = c.vscBlueGreen })
-- hl(0, 'DapUIRestart', { fg = c.vscBlueGreen })
-- hl(0, 'DapUIRestartNC', { fg = c.vscBlueGreen })
-- hl(0, 'DapUIScope', { fg = c.vscPink })
-- hl(0, 'DapUISource', { fg = c.vscMediumBlue })
-- hl(0, 'DapUIStepBack', { fg = c.vscPink })
-- hl(0, 'DapUIStepBackNC', { fg = c.vscPink })
-- hl(0, 'DapUIStepInto', { fg = c.vscPink })
-- hl(0, 'DapUIStepIntoNC', { fg = c.vscPink })
-- hl(0, 'DapUIStepOut', { fg = c.vscPink })
-- hl(0, 'DapUIStepOutNC', { fg = c.vscPink })
-- hl(0, 'DapUIStepOver', { fg = c.vscPink })
-- hl(0, 'DapUIStepOverNC', { fg = c.vscPink })
-- hl(0, 'DapUIStop', { fg = c.vscRed })
-- hl(0, 'DapUIStopNC', { fg = c.vscRed })
-- hl(0, 'DapUIStoppedThread', { fg = c.vscPink })
-- hl(0, 'DapUIThread', { fg = c.vscBlueGreen })
-- hl(0, 'DapUIType', { fg = c.vscPink })
-- hl(0, 'DapUIUnavailable', { fg = c.vscDimHighlight })
-- hl(0, 'DapUIUnavailableNC', { fg = c.vscDimHighlight })
-- hl(0, 'DapUIWatchesEmpty', { fg = c.vscDimHighlight })
-- hl(0, 'DapUIWatchesError', { fg = c.vscRed })
-- hl(0, 'DapUIWatchesValue', { fg = c.vscBlueGreen })
-- hl(0, 'DapUIWinSelect', { fg = c.vscPink, bold = true })

-- Dashboard
-- hl(0, 'DashboardHeader', { fg = c.vscBlue, bg = 'NONE' })
-- hl(0, 'DashboardDesc', { fg = c.vscYellowOrange, bg = 'NONE' })
-- hl(0, 'DashboardIcon', { fg = c.vscYellowOrange, bg = 'NONE' })
-- hl(0, 'DashboardShortCut', { fg = c.vscPink, bg = 'NONE' })
-- hl(0, 'DashboardKey', { fg = c.vscWhite, bg = 'NONE' })
-- hl(0, 'DashboardFooter', { fg = c.vscBlue, bg = 'NONE', italic = true })

-- Illuminate
-- hl(0, 'illuminatedWord', { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
-- hl(0, 'illuminatedCurWord', { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
-- hl(0, 'IlluminatedWordText', { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
-- hl(0, 'IlluminatedWordRead', { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
-- hl(0, 'IlluminatedWordWrite', { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })

-- mini.statusline
-- hl(0, 'MiniStatuslineModeNormal', { bg = c.vscLeftDark, fg = c.vscFront })
-- hl(0, 'MiniStatuslineModeInsert', { bg = c.vscLeftDark, fg = c.vscFront })
-- hl(0, 'MiniStatuslineModeVisual', { bg = c.vscLeftDark, fg = c.vscFront })
-- hl(0, 'MiniStatuslineModeReplace', { bg = c.vscLeftDark, fg = c.vscFront })
-- hl(0, 'MiniStatuslineModeCommand', { bg = c.vscLeftDark, fg = c.vscFront })
-- hl(0, 'MiniStatuslineModeOther', { bg = c.vscLeftDark, fg = c.vscFront })
-- hl(0, 'MiniStatuslineDevinfo', { bg = c.vscLeftDark, fg = c.vscFront })
-- hl(0, 'MiniStatuslineFilename', { bg = c.vscLeftMid, fg = c.vscFront })
-- hl(0, 'MiniStatuslineFileinfo', { bg = c.vscLeftLight, fg = c.vscFront })
-- hl(0, 'MiniStatuslineInactive', { bg = c.vscLeftDark, fg = c.vscFront })

-- Neotree
-- hl(0, 'NeoTreeBufferNumber', { fg = c.vscLineNumber, bg = 'NONE' })
-- hl(0, 'NeoTreeCursorLine', { fg = 'NONE', bg = c.vscCursorDarkDark })
-- hl(0, 'NeoTreeDimText', { fg = 'NONE', bg = c.vscCursorDarkDark })
-- hl(0, 'NeoTreeDirectoryIcon', { fg = c.vscBlue, bg = 'NONE' })
-- hl(0, 'NeoTreeDirectoryName', { fg = c.vscFront, bg = 'NONE' })
-- hl(0, 'NeoTreeDotfile', { fg = c.vscDisabledBlue, bg = 'NONE' })
-- hl(0, 'NeoTreeFileIcon', { fg = c.vscViolet, bg = 'NONE' })
-- hl(0, 'NeoTreeFileName', { fg = c.vscFront, bg = 'NONE' })
-- hl(0, 'NeoTreeFileNameOpened', { fg = c.vscFront, bg = c.vscCursorDarkDark })
-- hl(0, 'NeoTreeFilterTerm', { fg = c.vscFront, bg = 'NONE' })
-- hl(0, 'NeoTreeFloatBorder', { fg = c.vscLineNumber, bg = 'NONE' })
-- hl(0, 'NeoTreeFloatTitle', { fg = c.vscLineNumber, bg = 'NONE' })
-- hl(0, 'NeoTreeTitleBar', { fg = c.vscLineNumber, bg = 'NONE' })

-- NeogitOrg/neogit
-- if isDark then
--     hl(0, 'NeogitDiffAdd', { fg = c.vscGitAdded, bg = c.vscDiffGreenDark })
--     hl(0, 'NeogitDiffAddHighlight', { fg = c.vscGitAdded, bg = c.vscDiffGreenLight })
--     hl(0, 'NeogitDiffContext', { fg = c.vscPopupFront, bg = c.vscLeftDark })
--     hl(0, 'NeogitDiffContextHighlight', { fg = c.vscPopupFront, bg = c.vscLeftMid })
--     hl(0, 'NeogitDiffDelete', { fg = c.vscGitDeleted, bg = c.vscDiffRedDark })
--     hl(0, 'NeogitDiffDeleteHighlight', { fg = c.vscGitDeleted, bg = c.vscDiffRedLight })
--     hl(0, 'NeogitDiffHeader', { fg = c.vscSplitLight, bg = c.vscBack })
--     hl(0, 'NeogitDiffHeaderHighlight', { fg = c.vscSplitLight, bg = c.vscBack })
--     hl(0, 'NeogitHunkHeader', { fg = c.vscGitModified, bg = c.vscLeftDark })
--     hl(0, 'NeogitHunkHeaderHighlight', { fg = c.vscGitModified, bg = c.vscLeftMid })
-- else
--     hl(0, 'NeogitDiffAdd', { fg = c.vscGitAdded, bg = c.vscDiffGreenLight })
--     hl(0, 'NeogitDiffAddHighlight', { fg = c.vscGitAdded, bg = c.vscDiffGreenDark })
--     hl(0, 'NeogitDiffContext', { fg = c.vscPopupFront, bg = c.vscLeftMid })
--     hl(0, 'NeogitDiffContextHighlight', { fg = c.vscPopupFront, bg = c.vscLeftDark })
--     hl(0, 'NeogitDiffDelete', { fg = c.vscGitDeleted, bg = c.vscDiffRedLight })
--     hl(0, 'NeogitDiffDeleteHighlight', { fg = c.vscGitDeleted, bg = c.vscDiffRedDark })
--     hl(0, 'NeogitDiffHeader', { fg = c.vscSplitLight, bg = c.vscBack })
--     hl(0, 'NeogitDiffHeaderHighlight', { fg = c.vscSplitLight, bg = c.vscBack })
--     hl(0, 'NeogitHunkHeader', { fg = c.vscGitModified, bg = c.vscLeftMid })
--     hl(0, 'NeogitHunkHeaderHighlight', { fg = c.vscGitModified, bg = c.vscLeftDark })
-- end

-- if isDark then
--     hl(0, 'NvimTreeFolderIcon', { fg = c.vscBlue, bg = 'NONE' })
--     hl(0, 'NvimTreeIndentMarker', { fg = c.vscLineNumber, bg = 'NONE' })

--     hl(0, 'LspFloatWinNormal', { fg = c.vscFront, bg = 'NONE' })
--     hl(0, 'LspFloatWinBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspInfoBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaHoverBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaSignatureHelpBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaCodeActionBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaDefPreviewBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspLinesDiagBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaRenameBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaBorderTitle', { fg = c.vscCursorDark, bg = 'NONE' })
--     hl(0, 'LSPSagaDiagnosticTruncateLine', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaDiagnosticBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaDiagnosticBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaShTruncateLine', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaShTruncateLine', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaDocTruncateLine', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaRenameBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'LspSagaLspFinderBorder', { fg = c.vscLineNumber, bg = 'NONE' })

--     hl(0, 'TelescopePromptBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'TelescopeResultsBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'TelescopePreviewBorder', { fg = c.vscLineNumber, bg = 'NONE' })
--     hl(0, 'TelescopeNormal', { fg = c.vscFront, bg = 'NONE' })
--     hl(0, 'TelescopeSelection', { fg = c.vscFront, bg = c.vscPopupHighlightBlue })
--     hl(0, 'TelescopeMultiSelection', { fg = c.vscFront, bg = c.vscPopupHighlightBlue })
--     hl(0, 'TelescopeMatching', { fg = c.vscMediumBlue, bg = 'NONE', bold = true })
--     hl(0, 'TelescopePromptPrefix', { fg = c.vscFront, bg = 'NONE' })

-- Debugging
-- hl(0, 'debugPC', { bg = '#4C4C19' })

-- symbols-outline
-- white fg and lualine blue bg
--     hl(0, 'FocusedSymbol', { fg = '#ffffff', bg = c.vscUiBlue })
--     hl(0, 'SymbolsOutlineConnector', { fg = c.vscLineNumber, bg = 'NONE' })
-- else
--     hl(0, 'NvimTreeFolderIcon', { fg = c.vscDarkBlue, bg = 'NONE' })
--     hl(0, 'NvimTreeIndentMarker', { fg = c.vscTabOther, bg = 'NONE' })

--     hl(0, 'LspFloatWinNormal', { fg = c.vscFront, bg = 'NONE' })
--     hl(0, 'LspFloatWinBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspInfoBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaHoverBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaSignatureHelpBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaCodeActionBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaDefPreviewBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspLinesDiagBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaRenameBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaBorderTitle', { fg = c.vscCursorDark, bg = 'NONE' })
--     hl(0, 'LSPSagaDiagnosticTruncateLine', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaDiagnosticBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaDiagnosticBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaShTruncateLine', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaShTruncateLine', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaDocTruncateLine', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaRenameBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'LspSagaLspFinderBorder', { fg = c.vscTabOther, bg = 'NONE' })

--     hl(0, 'TelescopePromptBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'TelescopeResultsBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'TelescopePreviewBorder', { fg = c.vscTabOther, bg = 'NONE' })
--     hl(0, 'TelescopeNormal', { fg = c.vscFront, bg = 'NONE' })
--     hl(0, 'TelescopeSelection', { fg = '#FFFFFF', bg = c.vscPopupHighlightBlue })
--     hl(0, 'TelescopeMultiSelection', { fg = c.vscBack, bg = c.vscPopupHighlightBlue })
--     hl(0, 'TelescopeMatching', { fg = 'orange', bg = 'NONE', bold = true, nil })
--     hl(0, 'TelescopePromptPrefix', { fg = c.vscFront, bg = 'NONE' })

-- Debugging
-- hl(0, 'debugPC', { bg = '#FFFFBA' })

-- COC.nvim
-- hl(0, 'CocFloating', { fg = 'NONE', bg = c.vscPopupBack })
-- hl(0, 'CocMenuSel', { fg = '#FFFFFF', bg = '#285EBA' })
-- hl(0, 'CocSearch', { fg = '#2A64B9', bg = 'NONE' })

-- Pmenu
-- hl(0, 'Pmenu', { fg = 'NONE', bg = c.vscPopupBack })
-- hl(0, 'PmenuSel', { fg = '#FFFFFF', bg = '#285EBA' })

-- Copilot
-- hl(0, 'CopilotSuggestion', { fg = c.vscGray, bg = 'NONE' })

-- symbols-outline
-- white fg and lualine blue bg
--         hl(0, 'FocusedSymbol', { fg = c.vscBack, bg = '#AF00DB' })
--         hl(0, 'SymbolsOutlineConnector', { fg = c.vscTabOther, bg = 'NONE' })
--     end
-- end

-- theme.link_highlight = function()
-- Legacy groups for official git.vim and diff.vim syntax
-- hl(0, 'diffAdded', { link = 'DiffAdd' })
-- hl(0, 'diffChanged', { link = 'DiffChange' })
-- hl(0, 'diffRemoved', { link = 'DiffDelete' })
-- Legacy groups for treesitter
-- hl(0, '@parameter', { link = '@variable.parameter' })
-- hl(0, '@field', { link = '@variable.member' })
-- hl(0, '@string.regex', { link = '@string.regexp' })
-- hl(0, '@float', { link = '@number.float' })
-- hl(0, '@namespace', { link = '@module' })
-- hl(0, '@method', { link = '@function.method' })
-- hl(0, '@field', { link = '@variable.member' })
-- hl(0, '@conditional', { link = '@keyword.conditional' })
-- hl(0, '@repeat', { link = '@keyword.repeat' })
-- hl(0, '@exception', { link = '@keyword.exception' })
-- hl(0, '@storageclass', { link = '@keyword.storage' })
-- hl(0, '@include', { link = '@keyword.import' })
-- hl(0, '@text.strong', { link = '@markup.strong' })
-- hl(0, '@text.underline', { link = '@markup.underline' })
-- hl(0, '@text.emphasis', { link = '@markup.italic' })
-- hl(0, '@text.strike', { link = '@markup.strikethrough' })
-- hl(0, '@text.title', { link = '@markup.heading' })
-- hl(0, '@text.uri', { link = '@markup.link.url' })
-- hl(0, '@text.literal', { link = '@markup.raw' })
-- hl(0, '@text.note', { link = '@comment.note' })
-- hl(0, '@text.warning', { link = '@comment.warning' })
-- hl(0, '@text.danger', { link = '@comment.error' })
-- hl(0, '@text.diff.add', { link = '@diff.plus' })
-- hl(0, '@text.diff.delete', { link = '@diff.minus' })
-- Nvim compe
-- hl(0, 'CompeDocumentation', { link = 'Pmenu' })
-- hl(0, 'CompeDocumentationBorder', { link = 'Pmenu' })
-- hl(0, 'CmpItemKind', { link = 'Pmenu' })
-- hl(0, 'CmpItemKindClass', { link = 'CmpItemKindConstructor' })
-- hl(0, 'CmpItemKindModule', { link = 'CmpItemKindKeyword' })
-- hl(0, 'CmpItemKindOperator', { link = '@operator' })
-- hl(0, 'CmpItemKindReference', { link = '@variable.parameter.reference' })
-- hl(0, 'CmpItemKindValue', { link = '@variable.member' })
-- hl(0, 'CmpItemKindField', { link = '@variable.member' })
-- hl(0, 'CmpItemKindEnum', { link = '@variable.member' })
-- hl(0, 'CmpItemKindSnippet', { link = '@text' })
-- hl(0, 'CmpItemKindColor', { link = 'cssColor' })
-- hl(0, 'CmpItemKindFile', { link = '@text.uri' })
-- hl(0, 'CmpItemKindFolder', { link = '@text.uri' })
-- hl(0, 'CmpItemKindEvent', { link = '@constant' })
-- hl(0, 'CmpItemKindEnumMember', { link = '@variable.member' })
-- hl(0, 'CmpItemKindConstant', { link = '@constant' })
-- hl(0, 'CmpItemKindStruct', { link = '@structure' })
-- hl(0, 'CmpItemKindTypeParameter', { link = '@variable.parameter' })
