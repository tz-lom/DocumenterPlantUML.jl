using Documenter
using DocumenterPlantUML
using Pkg

PROJECT_TOML = Pkg.TOML.parsefile(joinpath(@__DIR__, "..", "Project.toml"))
VERSION = PROJECT_TOML["version"]
NAME = PROJECT_TOML["name"]
AUTHORS = join(PROJECT_TOML["authors"], ", ") * " and contributors"
GITHUB = "https://github.com/tz-lom/DocumenterPlantUML.jl"


println("Starting makedocs")

PAGES = [
    "Home" => "index.md",
]

HTML_OPTIONS = Dict(
    :prettyurls => true,
    # :canonical => "https://juliadocs.org/DocumenterPlantUML.jl",
    # :footer => "[$NAME.jl]($GITHUB) v$VERSION docs powered by [Documenter.jl](https://github.com/JuliaDocs/Documenter.jl).",
)
HTML_OPTIONS[:inventory_version] = VERSION


makedocs(
    authors=AUTHORS,
    warnonly=true,
    # warnonly=[:linkcheck,],
    sitename="DocumenterPlantUML.jl",
    format=Documenter.HTML(; HTML_OPTIONS...),
    pages=PAGES,
)

println("Finished makedocs")