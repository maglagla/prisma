# How to generate the document?

First install this (once):
```
brew install plantuml pandoc tectonic 
```

Run this (once):
```
    chmod +x build.sh
    chmod +x get-plantuml.sh
    ./get-plantuml.sh
```

Then just run
```
    ./build.sh
```

It will create all .svg files from .puml and then generate a .pdf from .md and .svg