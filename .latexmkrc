# Compilazione: pdflatex + biber + makeglossaries
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;   # usa biber (biblatex) e pulisce i file generati

# glossaries-extra: fa girare makeglossaries quando serve
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('glo-abr', 'gls-abr', 0, 'run_makeglossaries');
sub run_makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    pushd($path);
    system("makeglossaries", $base_name);
    popd();
}
push @generated_exts, 'glo', 'gls', 'glg', 'glo-abr', 'gls-abr', 'glg-abr';
$clean_ext .= ' %R.ist %R.xdy %R.synctex.gz';
