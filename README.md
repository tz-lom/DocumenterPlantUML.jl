# DocumenterPlantUML.jl

Renders PlantUML diagrams into inlined images in your documentation. 

![License](https://img.shields.io/github/license/tz-lom/DocumenterPlantUML.jl) ![GitHub branch status](https://img.shields.io/github/checks-status/tz-lom/DocumenterPlantUML.jl/master) ![GitHub Tag](https://img.shields.io/github/v/tag/tz-lom/DocumenterPlantUML.jl)
[![Documentation](https://img.shields.io/badge/Documentation-blue)
](https://tz-lom.github.io/DocumenterPlantUML.jl)

## Usage

1. Add `using DocumenterPlantUML` to your `docs/make.jl`.
2. Insert code block with `plantuml` type like
   ```````
   ```plantuml
   A->B
   ```

   ```````
