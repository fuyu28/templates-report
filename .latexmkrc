# ==== LuaLaTeX を使用する設定 ====
$latex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$pdf_mode = 1;

# ==== 最大再コンパイル回数 ====
$max_repeat = 5;

# ==== BibTeX / Biber（使う場合） ====
$bibtex = 'bibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# ==== Previewer（PDF ビューア） ====
if ($^O eq 'linux') {
    $pdf_previewer = 'xdg-open %S';
} elsif ($^O eq 'darwin') {
    $pdf_previewer = 'open %S';
} else {
    $pdf_previewer = 'start %S';
}

# ==== Clean targets ====
$clean_full_ext = "%R.synctex.gz";