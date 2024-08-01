# Floyd Warshal Algorithm 

The Floyd Warshall Algorithm is for solving the All Pairs Shortest Path problem. The problem is to find shortest distances between *every* pair of vertices in a given edge weighted directed Graph.


``` python
# Graph example

# Number of vertices in the graph
V = 4

# Define infinity as the large enough value. This value will be used for vertices not connected to each other
INF = 99999

# Graph in the form of 2D array from the source to destination
graph = [[0, 5, INF, 10],
         [INF, 0, 3, INF],
         [INF, INF, 0, 1],
         [INF, INF, INF, 0]]

# Solves all pair shortest path via Floyd Warshall Algorithm
def floydWarshall(graph):
    dist = []
    for i in range(V):
        dist.append(graph[i])
    for k in range(V):
        for i in range(V):
            for j in range(V):
                dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
    return dist
```
