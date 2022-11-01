# Extra assignment 

This directory contains an extra assignment for student who submit their reports past the due date. Send them the PDF. 

The markdown is the template for the PDF so if updating the `Questions_Lab.md` file the PDF needs to be regenerated. For example using [`pandoc`](https://pandoc.org/index.html) as below:

    pandoc -s Questions_Lab.md --pdf-engine=xelatex -o Questions_Lab.md
