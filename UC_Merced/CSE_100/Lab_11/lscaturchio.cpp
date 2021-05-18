#include <iostream>
#include <queue>
using namespace std;

void printParent(int n, int *A)
{
    int i = 1;
    while (i < n)
    {
        cout << A[i] << endl;
        i++;
    }
}

void decreaseKey(int n, int *A, bool *credible, int *w, int edges)
{
    int i;
    vector<pair<int, int>>::iterator iter;
    vector<pair<int, int>> G[n];

    i = 0;
    while (i < n)
    {
        credible[i] = true;
        A[i] = -1;
        w[i] = 10000;
        i++;
    }

    i = 0;
    while (i < edges)
    {
        int u;
        cin >> u;
        int v;
        cin >> v;
        int x;
        cin >> x;

        G[u].push_back(make_pair(x, v));
        G[v].push_back(make_pair(x, u));
        i++;
    }

    int k = 0;
    int min;
    A[k] = -1;
    w[k] = 0;

    priority_queue<pair<int, int>,
                   vector<pair<int, int>>,
                   greater<pair<int, int>>>
        Q;
    Q.push(make_pair(k, 0));

    while (!(Q.empty()))
    {
        int u = Q.top().second;
        Q.pop();

        if (credible[u] == 1)
        {
            credible[u] = 0;
            iter = G[u].begin();

            while (iter != G[u].end())
            {
                int v = iter->second;
                int x = iter->first;

                if (credible[v] && w[v] > x)
                {
                    Q.push(*iter);
                    A[v] = u;
                    w[v] = x;
                }
                iter++;
            }
        }
    }
}

int main()
{
    int n;
    cin >> n;
    int edges;
    cin >> edges;
    bool credible[n];
    int A[n];
    int w[n];

    decreaseKey(n, A, credible, w, edges);
    printParent(n, A);
}
