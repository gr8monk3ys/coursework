#include <iostream>
#include <queue>
using namespace std;

int n = 6;

struct Node
{
    char letter;
    unsigned frequency;

    Node *left;
    Node *right;

    Node(char letter, unsigned frequency)
    {
        left = right = NULL;
        this->letter = letter;
        this->frequency = frequency;
    }
};

struct compare
{
    bool operator()(Node *left, Node *right)
    {
        return (right->frequency < left->frequency);
    }
};

void formCodes(struct Node *root, char letter, string str)
{
    if (!root)
    {
        return;
    }
    else if (root->letter != '$' && letter == root->letter)
    {
        cout << root->letter;
        cout << ":";
        cout << str;
        cout << "\n";
    }

    formCodes(root->left, letter, str + "0");
    formCodes(root->right, letter, str + "1");
}

void makeCodes(priority_queue<Node *, vector<Node *>, compare> tree, int n, char *letter)
{
    int i = 0;
    while (i < n)
    {
        formCodes(tree.top(), letter[i], "");
        i++;
    }
}

void makeTree(char *letter, int *frequency, int len)
{
    int i;
    struct Node *left, *right, *top;
    priority_queue<Node *, vector<Node *>, compare> tree;

    i = 0;
    while (i < len)
    {
        Node *newLeaf = new Node(letter[i], frequency[i]);
        tree.push(newLeaf);
        i++;
    }

    while (tree.size() > 1)
    {
        left = tree.top();
        tree.pop();
        right = tree.top();
        tree.pop();

        top = new Node('$', left->frequency + right->frequency);
        top->right = right;
        top->left = left;
        tree.push(top);
    }

    makeCodes(tree, n, letter);
}

int main()
{
    int frequency[n];
    char arr[] = {'A', 'B', 'C', 'D', 'E', 'F'};

    int i = 0;
    while (i < n)
    {
        cin >> frequency[i];
        i++;
    }

    makeTree(arr, frequency, n);

    return 0;
}
