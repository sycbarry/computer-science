# Floyd Warshall Algorithm 

The Floyd Warshall Algorithm is for solving the All Pairs Shortest Path problem. The problem is to find shortest distances between *every* pair of vertices in a given edge weighted directed Graph.

The idea here is to find the shortest path between every pair of vertices in a given edge weighted graph. The graph may contain negative weight edges, but no negative weight cycles.
We initialize the solution matrix same as the input graph matrix as a first step. Then we update the solution matrix by considering all vertices as an intermediate vertex. The idea is to one by one pick all vertices and updates all shortest paths which include the picked vertex as an intermediate vertex in the shortest path. When we pick vertex number k as an intermediate vertex, we already have considered vertices {0, 1, 2, .. k-1} as intermediate vertices. For every pair (i, j) of the source and destination vertices respectively, there are two possible cases.
1. k is not an intermediate vertex in the shortest path from i to j. We keep the value of dist[i][j] as it is.
2. k is an intermediate vertex in the shortest path from i to j. We update the value of dist[i][j] as dist[i][k] + dist[k][j] if dist[i][j] > dist[i][k] + dist[k][j]



``` java
// Number of vertices in the graph
final static int INF = 99999;
final static int V = 4;

// graph example
int graph[][] = { {0, 5, INF, 10},
                  {INF, 0, 3, INF},
                  {INF, INF, 0, 1},
                  {INF, INF, INF, 0} };

void int[][] floydWarshall(int graph[][]) {
    int dist[][] = new int[V][V];
    int i, j, k;

    for (i = 0; i < V; i++) {
        for (j = 0; j < V; j++) {
            dist[i][j] = graph[i][j];
        }
    }

    for (k = 0; k < V; k++) {
        for (i = 0; i < V; i++) {
            for (j = 0; j < V; j++) {
                if (dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }

    return dist; 
}


```

## Example problems

[[743-network-delay-time]]
