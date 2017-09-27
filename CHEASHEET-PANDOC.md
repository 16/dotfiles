PANDOC
======

# Lister les fonts dispos pour latex

    fc-list
    fc-list | grep "Avenir Next"

# Génération d'un pdf avec template

    pandoc -r markdown_strict --latex-engine=xelatex -o "formations-avec-didier.pdf" -Vdocumentclass="memoir" -Vdocumentclassoptions="article" -Vmainfont="GFS Bodoni" "formations-avec-didier.md"

    
    pandoc -r markdown --latex-engine=xelatex -o "sample.pdf" -Vdocumentclass="article" -Vdocumentclassoptions="article" -Vmainfont="Avenir Next" "sample.md"

# Dans vim

    :Pandoc! pdf -Vdocumentclass=article -Vdocumentclassoptions=article -Vmainfont='Helvetica Neue'

    :PandocTemplate save fancy_article pdf -Vdocumentclass=memoir -Vmainfont='Helvetica Neue'
    
    :PandocTemplate save fancy_article pdf -Vdocumentclass=memoir -Vmainfont='Helvetica Neue'
