(TeX-add-style-hook
 "index"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:org1ec247e"
    "sec:org276e361"
    "sec:orge940f9f"
    "sec:org668013d"
    "sec:orge1f758d"
    "sec:orgc66e4f1"
    "sec:orgb5d307b"
    "sec:orgb66fa4b"
    "sec:orge46bc3a"
    "sec:org2108fba"
    "sec:orgb1c8aca"
    "sec:org616b6c3"
    "sec:org77ba3d3"
    "sec:orgd94168f"
    "sec:org1f200bc"
    "sec:org17668bc"
    "sec:orgc8ca0b7"
    "sec:org55e5dd6"
    "sec:org6971c97"
    "sec:orgfba8219"
    "sec:org43a32d0"
    "sec:orgbfb1aff"
    "sec:org952dad0"
    "sec:orgbcff413"))
 :latex)

