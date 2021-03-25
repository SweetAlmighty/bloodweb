require('src/edge')

Graph = Object:extend()

function Graph:new()
    self.nodes = { }
    self.edges = { }
end

function Graph:add_node(x, y)
    local newNode = Node(x, y)
    self.nodes[#self.nodes+1] = newNode
    return self.nodes[#self.nodes]
end

function Graph:add_edge(from, to) self.edges[#self.edges+1] = Edge(from, to) end