using Test
using DocumenterPlantUML
using Documenter


@testset "Render and check" begin
    dir = mktempdir()

    mkpath(joinpath(dir, "src"))
    cp(
        joinpath(@__DIR__, "..", "docs", "src", "index.md"),
        joinpath(dir, "src", "index.md");
        force = true,
    )

    makedocs(
        format = Documenter.HTML(),
        root = dir,
        remotes = nothing,
        sitename = " ",
        pages = ["Description" => "index.md"],
    )

    index = read(joinpath(dir, "build", "index.html"), String)

    @test contains(
        index,
        r"""<a href="plantuml-\d+\.svg"><img src="plantuml-\d+\.svg" alt="A-&gt;B"/></a>""",
    )

end