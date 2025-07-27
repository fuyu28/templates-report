[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

# 汎用実験レポートテンプレート（LuaLaTeX／ltjsarticle）

LuaLaTeX ＋ ltjsarticle クラスを使った日本語実験レポート用テンプレートです。

大学の実験レポートを手軽に作成できるよう、フォント設定・ヘッダ／フッタ・目次・自動日付挿入などをあらかじめ構成しています。

---

## ディレクトリ構成

```

.
├── .latexmkrc           ← latexmk のプロジェクト設定
├── README.md            ← このファイル
├── report.tex           ← メインのテンプレートソース
├── images/              ← 図版・画像を置くフォルダ
└── out/                 ← ビルド結果（PDF／中間ファイル出力先）

```

---

## 特徴

- LuaLaTeX + ltjsarticle クラスによる日本語組版
- フォント設定済み
  - 欧文：Times New Roman
  - 和文：IPAexMincho／IPAexGothic
- fancyhdr でヘッダ・フッタ自動生成
  - 左ヘッダ：文書名
  - 右ヘッダ：作成日＋ページ番号
  - 左フッタ：学籍番号・氏名（要変更）
- `\tableofcontents` による目次付き
- `\graphicspath{{images/}}` で画像管理を簡略化
- `xurl`／`hyphens` による URL の柔軟改行

---

## 前提・動作環境

- **TeX ディストリビューション**：TeX Live 2024 以降
- TeX エンジン：LuaLaTeX
- 必要パッケージ

```

fontspec, luatexja-fontspec,
amsmath, amssymb,
graphicx, subcaption, float,
booktabs, multirow,
url, xurl, hyperref,
fancyhdr, siunitx

```

- フォント（システムにインストール済み）
- Times New Roman
- IPAexMincho／IPAexGothic

---

## ビルド方法

1. リポジトリをクローン

```bash
git clone https://github.com/yourname/templates-report.git
cd templates-report
```

2. 出力先フォルダを準備（初回のみ）

   ```bash
   mkdir -p out
   ```

3. コマンドラインからビルド

   ```bash
   latexmk -lualatex \
     -synctex=1 \
     -interaction=nonstopmode \
     -file-line-error \
     -outdir=out \
     report.tex
   ```

4. ビルド後は `out/report.pdf` を開いて内容を確認してください。

---

## VSCode （LaTeX Workshop）設定例

VSCode の Settings.json に以下を追記すると、自動ビルドとフォーマッタの設定を一括で行えます。

```jsonc
// LaTeX ファイル全般のエディタ設定
"[latex]": {
  "editor.suggest.snippetsPreventQuickSuggestions": false,
  "editor.tabSize": 2,
  "editor.defaultFormatter": "James-Yu.latex-workshop"
},

// Formatter: latexindent を使用
"latex-workshop.formatting.latex": "latexindent",

// パッケージ／環境名の補完を有効化
"latex-workshop.intellisense.package.enabled": true,

// 出力ディレクトリを指定
"latex-workshop.latex.outDir": "out",

// レシピ定義
"latex-workshop.latex.recipes": [
  {
    "name": "latexmk (lualatex)",
    "tools": ["latexmk"]
  }
],

// ツール定義
"latex-workshop.latex.tools": [
  {
    "name": "latexmk",
    "command": "latexmk",
    "args": [
      "-lualatex",
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "-outdir=out",
      "%DOC%"
    ]
  }
],

// デフォルトレシピ
"latex-workshop.latex.recipe.default": "latexmk (lualatex)",

// 保存時に自動ビルド
"latex-workshop.latex.autoBuild.run": "onSave",
```

---

## プロジェクト設定（.latexmkrc）

```perl
# LuaLaTeX で PDF を生成
$pdf_mode = 1;
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode';

# 出力ディレクトリ
$out_dir = 'out';

# クリーン対象拡張子
$clean_ext = 'aux fdb_latexmk fls synctex.gz';

# biber を使う場合
# $bibtex = 'biber %O %S';
```

グローバルな `~/.latexmkrc` はそのままに、こちらの設定でプロジェクト固有の振る舞いを定義します。

---

## カスタマイズ方法

`report.tex` のプリアンブルやヘッダ／フッタ部分を編集してください。

```tex
% 左フッタ（学籍番号・氏名）
\lfoot{学籍番号 氏名}

% タイトル
\title{\LARGE 実験タイトルを書く}

% 著者情報
\author{{\Large 学籍番号 氏名}}

% 日付（デフォルトは \today）
\date{作成日：\today}
```

画像を追加する場合は `images/` フォルダに配置し、本文で `\includegraphics{}` を利用します。

---

## ライセンス

MIT License

自由にフォーク・改変してお使いください。
