
You are given a network of n nodes, labeled from 1 to n. You are also given times, a list of travel times as directed edges times[i] = (ui, vi, wi), where ui is the source node, vi is the target node, and wi is the time it takes for a signal to travel from source to target.

We will send a signal from a given node k. Return the minimum time it takes for all the n nodes to receive the signal. If it is impossible for all the n nodes to receive the signal, return -1.

Example 1:


Input: times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2
Output: 2
Example 2:

Input: times = [[1,2,1]], n = 2, k = 1
Output: 1
Example 3:

Input: times = [[1,2,1]], n = 2, k = 2
Output: -1


``` java
import java.util.Arrays;

class Solution {
    public int networkDelayTime(int[][] times, int n, int k) {
        int[][] graph = new int[n + 1][n + 1];
        for (int[] row : graph) {
            Arrays.fill(row, Integer.MAX_VALUE);
        }
        
        for (int i = 1; i <= n; i++) {
            graph[i][i] = 0;
        }
        
        for (int[] time : times) {
            int u = time[0], v = time[1], t = time[2];
            graph[u][v] = t;
        }
        
        for (int p = 1; p <= n; p++) {
            for (int i = 1; i <= n; i++) {
                for (int j = 1; j <= n; j++) {
                    if (graph[i][p] != Integer.MAX_VALUE && graph[p][j] != Integer.MAX_VALUE) {
                        graph[i][j] = Math.min(graph[i][j], graph[i][p] + graph[p][j]);
                    }
                }
            }
        }
        
        int res = Integer.MIN_VALUE;
        for (int i = 1; i <= n; i++) {
            if (graph[k][i] == Integer.MAX_VALUE) {
                return -1;
            }
            res = Math.max(res, graph[k][i]);
        }
        
        return res;
    }
}

```


