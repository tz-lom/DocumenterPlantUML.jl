using Documenter
using DocumenterPlantUML
using Pkg

ENV["JULIA_DEBUG"] = DocumenterPlantUML

PROJECT_TOML = Pkg.TOML.parsefile(joinpath(@__DIR__, "..", "Project.toml"))
VERSION = PROJECT_TOML["version"]
NAME = PROJECT_TOML["name"]
AUTHORS = join(PROJECT_TOML["authors"], ", ") * " and contributors"


println("Starting makedocs")


makedocs(
    authors=AUTHORS,
    sitename="DocumenterPlantUML.jl",
    format = Documenter.HTML(prettyurls = haskey(ENV, "CI")),
    pages=[
        "Description" => "index.md"
    ],
)

println("Finished makedocs")

deploydocs(repo = "github.com/tz-lom/DocumenterPlantUML.jl.git", push_preview = true)
