import networkx
import uuid

def id():
  return str(uuid.uuid4())[:8]


class Path:
	def __init__(self, strpath):
		self.graph = networkx.DiGraph()
		
		prev = 'start'
		for char in strpath:
		  next = (id(), char)
		  self.graph.add_edge(prev, next)
		  prev = next
		else:
		  self.graph.add_edge(next, 'end')
	
	def get(self):
	  return self.graph.edges


class Card:
  def __init__(self, path1, path2):
    self.graph = networkx.DiGraph()
    self.graph.add_edges_from(path1.get())
    self.graph.add_edges_from(path2.get())


class Universe:
  def __init__(self):
    self.graph = networkx.Digraph()
    
    
test = Card(Path('a'),Path('b'))
print(test.graph.edges)
