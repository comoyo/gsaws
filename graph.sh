#!/bin/bash

# brew install graphviz

terraform graph > graph.dot

dot -Tpdf -o graph.pdf graph.dot

open graph.pdf