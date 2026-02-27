#include <iostream>
#include <bits/stdc++.h>
using namespace std;

struct Graph
{
    int V;
    int E;
    struct Edge *edge;
};

struct Edge
{
    int start;
    int goal;
    int weight;
};

struct Graph *make(int V, int E)
{
    struct Graph *graph = new Graph;

    graph->V = V;
    graph->E = E;

    graph->edge = new Edge[E];
    return graph;
}

void findMinDistance(Graph *G, int *distance, int n, int E)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < E; j++)
        {
            int v = G->edge[j].goal;
            int u = G->edge[j].start;
            int weight = G->edge[j].weight;

            if (distance[u] != INT_MAX && distance[v] > distance[u] + weight)
            {
                distance[v] = distance[u] + weight;
            }
        }
    }
}

void BellmanFord(struct Graph *G, int start)
{
    int V = G->V;
    int n = (V - 1);
    int E = G->E;
    int distance[V];
    int i;

    i = 0;
    while (i < n + 1)
    {
        distance[i] = INT_MAX;
        i++;
    }

    distance[start] = 0;

    findMinDistance(G, distance, n, E);

    i = 0;
    while (i < E)
    {
        int u = G->edge[i].start;
        int v = G->edge[i].goal;
        int weight = G->edge[i].weight;
        if (distance[u] != INT_MAX && distance[u] + weight < distance[v])
        {
            cout << "FALSE";
            cout << "\n";
            return;
        }
        i++;
    }
    cout << "TRUE";
    cout << "\n";

    i = 0;
    while (i < n + 1)
    {
        distance[i] == INT_MAX ? printf("INFINITY\n") : printf("%d\n", distance[i]);
        i++;
    }
}

int main()
{
    int V;
    cin >> V;
    int E;
    cin >> E;
    struct Graph *G = make(V, E);

    int i = 0;
    while (i < E)
    {
        int u;
        cin >> u;
        int v;
        cin >> v;
        int c;
        cin >> c;

        G->edge[i].start = u;
        G->edge[i].goal = v;
        G->edge[i].weight = c;
        i++;
    }

    BellmanFord(G, 0);

    return 0;
}
