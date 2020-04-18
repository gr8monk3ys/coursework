#include <iostream>
#include <queue>
#include <map>
#include <iterator>
#include <cstdlib>
using namespace std;

int n;

typedef vector<bool> CodeVector;
typedef map<int, CodeVector> CodeMap;

struct Node
{
    char letter;
    int freq;
    Node *l, *r;

    Node(char letter, int freq)
    {
        l = r = NULL;
        this->letter = letter;
        this->freq = freq;
    }
};

struct NodeCompare
{
    bool operator()(Node *l, Node *r)
    {
        if (l->freq == r->freq)
        {
            int lIndex = -1, rIndex = -1;
            if (NodeLeafy *ll = dynamic_cast<NodeLeafy *>(l))
            {
                lIndex = ll->index;
            }
            else
            {
                Node *ptrNode = l;
                while (lIndex == -1)
                {
                    if (NodeLeafy *ll = dynamic_cast<NodeLeafy *>(ptrNode))
                    {
                        lIndex = ll->index;
                    }

                    else
                    {
                        ptrNode = dynamic_cast<NodeInny *>(ptrNode)->l;
                    }
                }
            }
            if (NodeLeafy *rr = dynamic_cast<NodeLeafy *>(r))
                rIndex = rr->index;
            else
            {
                Node *ptrNode = r;
                while (rIndex == -1)
                {
                    if (NodeLeafy *rr = dynamic_cast<NodeLeafy *>(ptrNode))
                        rIndex = (int)rr->index;
                    else
                        ptrNode = dynamic_cast<NodeInny *>(ptrNode)->l;
                }
            }
            return lIndex > rIndex;
        }
        /* Else choose greater frequency*/
        return l->freq > r->freq;
    }
};

void makeCode(Node *node, const CodeVector &codePtr, CodeMap &code)
{
    /* If is an internal node */
    if (NodeInny *nodeI = dynamic_cast<NodeInny *>(node))
    {
        CodeVector l = codePtr;
        l.push_back(false);
        makeCode(nodeI->l, l, code);

        CodeVector r = codePtr;
        r.push_back(true);
        makeCode(nodeI->r, r, code);
    }

    /* If is a leaf */
    else if (NodeLeafy *nodeL = dynamic_cast<NodeLeafy *>(node))
    {
        code[nodeL->index] = codePtr;
    }
}

int main()
{
    cin >> n;
    int vals[n];

    for (int i = 0; i < n; i++)
    {
        cin >> vals[i];
    }

    return 0;
}
