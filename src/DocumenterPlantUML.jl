module DocumenterPlantUML

using Documenter.Expanders: ExpanderPipeline
using Documenter: Documenter, iscode
import Documenter: Selectors
using MarkdownAST: MarkdownAST
using PlantUML


abstract type ExtPlantUMLCodeBlock <: ExpanderPipeline end
Selectors.order(::Type{ExtPlantUMLCodeBlock}) = 2.1

Selectors.matcher(::Type{ExtPlantUMLCodeBlock}, node, page, doc) =
    iscode(node, r"^plantuml")


function Selectors.runner(::Type{ExtPlantUMLCodeBlock}, node, page, doc)
    @assert node.element isa MarkdownAST.CodeBlock

    # determine file name
    id = objectid(node)
    image_name = "plantuml-$id.svg"

    # write SVG
    puml = PUML(node.element.code)
    svg = repr("image/svg+xml", puml)
    write(joinpath(pwd(), page.workdir, image_name), svg)



    # create update node to point to the image
    img = MarkdownAST.@ast MarkdownAST.Link(image_name, "") do
        MarkdownAST.Image(image_name, "") do
            MarkdownAST.Text(puml.uml)
        end
    end
    node.element = img.element
    append!(node.children, img.children)

    return

end



end # module DocumenterPlantUML
