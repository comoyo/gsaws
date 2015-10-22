#!/bin/bash

# brew install graphviz

terraform graph -draw-cycles | dot -Tpng -o graph.png

open graph.png