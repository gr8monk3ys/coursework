#include <iostream>
#include <list>
#include <stack>
using namespace std;

class SCC
{
    int V;
    list<int> *adj;
    void findID(int vertex, bool *seen, stack<int> &Stack);
    void DFS(int vertex, bool *seen, int node, int *A);

public:
    SCC(int V);
    void connectededges(int vertex, int w);
    void printGraph(int node, int *A);
    SCC flipGraph();
};

SCC::SCC(int V)
{
    this->V = V;
    adj = new list<int>[V];
}

void SCC::DFS(int vertex, bool *seen, int node, int *A)
{

    seen[vertex] = true;
    A[vertex] = node;
    list<int>::iterator i;

    i = adj[vertex].begin();
    while (i != adj[vertex].end())
    {
        if (!seen[*i])
        {
            DFS(*i, seen, node, A);
        }
        i++;
    }
}

SCC SCC::flipGraph()
{
    SCC G(V);
    int vertex = 0;
    while (vertex < V)
    {
        list<int>::iterator i;
        i = adj[vertex].begin();
        while (i != adj[vertex].end())
        {
            G.adj[*i].push_back(vertex);
            i++;
        }
        vertex++;
    }
    return G;
}

void SCC::findID(int vertex, bool *seen, stack<int> &Stack)
{
    seen[vertex] = true;
    list<int>::iterator i;

    i = adj[vertex].begin();
    while (i != adj[vertex].end())
    {
        if (!seen[*i])
        {
            findID(*i, seen, Stack);
        }
        i++;
    }
    Stack.push(vertex);
}

void SCC::connectededges(int vertex, int w)
{
    adj[vertex].push_back(w);
}

void SCC::printGraph(int node, int *A)
{
    stack<int> Stack;
    bool *seen = new bool[V];
    int i;

    i = 0;
    while (i < V)
    {
        seen[i] = false;
        i++;
    }

    i = 0;
    while (i < V)
    {
        if (seen[i] == false)
        {
            findID(i, seen, Stack);
        }
        i++;
    }

    SCC G = flipGraph();

    for (int i = 0; i < V; i++)
    {
        seen[i] = false;
    }

    while (Stack.empty() == false)
    {
        int vertex = Stack.top();
        Stack.pop();

        if (seen[vertex] == false)
        {
            G.DFS(vertex, seen, vertex, A);
            int min = vertex;

            i = 0;
            while (i < node)
            {
                if (vertex == A[i])
                {
                    if (i < min)
                    {
                        min = i;
                    }
                }
                i++;
            }

            i = 0;
            while (i < node)
            {
                if (A[i] == vertex)
                {
                    A[i] = min;
                }
                i++;
            }
        }
    }
}

int main()
{
    int i;
    int node;
    cin >> node;
    int edge;
    cin >> edge;

    SCC G(node);

    i = 0;

    while (i < edge)
    {
        int u;
        cin >> u;
        int w;
        cin >> w;
        G.connectededges(u, w);
        i++;
    }

    int A[node];
    i = 0;

    while (i < node)
    {
        A[i] = node + 2;
        i++;
    }

    G.printGraph(node, A);

    i = 0;

    while (i < node)
    {
        cout << A[i] << endl;
        i++;
    }

    return 0;
}
