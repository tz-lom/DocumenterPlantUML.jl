module DocumenterPlantUML

using Documenter.Expanders: ExpanderPipeline
using Documenter: Documenter, is_doctest_only
import Documenter: Selectors



abstract type ExtPlantUMLCodeBlock <: ExpanderPipeline end
Selectors.order(::Type{ExtPlantUMLCodeBlock}) = 2.1

Selectors.matcher(::Type{ExtPlantUMLCodeBlock}, node, page, doc) = iscode(node, r"^@plantuml")


function Selectors.runner(::Type{ExtPlantUMLCodeBlock}, node, page, doc)
    @assert node.element isa MarkdownAST.CodeBlock
    x = node.element

    contentsnode = Documenter.buildnode(Documenter.ContentsNode, x, doc, page)
    push!(doc.internal.contentsnodes, contentsnode)
    node.element = contentsnode
    return

end



end # module DocumenterPlantUML
