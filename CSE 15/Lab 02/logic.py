# CSE 15 Discrete Mathematics Support Code
# Angelo Kyrilov
# Computer Science and Engineering
# University of California Merced

def generate(vars):
    values = [0, 1]
    command = ""
    count = 0
    for i in vars:
        for j in range(count):
            command = command + "\t"
        command = command + "for %s in values:\n" % (i)
        count = count + 1

    for i in range(count):
        command = command + "\t"

    command = command + "rows.append(["
    for i in vars:
        command = command + i + ", "

    command = command[:-2]
    command = command + "])"
    rows = []

    exec(command)

    return rows


def land(a, b):
    return a and b


def lor(a, b):
    return a or b


def lnot(a):
    return not a


def lif(a, b):
    return not a or b


def liff(a, b):
    return (not a or b) and (not b or a)


def isPrimitive(formula):
    for i in formula:
        if isConnective(i) or i == '(' or i == ')':
            return False
    return True


def reformat(formula):
    temp = formula.split(' ')
    c = []
    for i in temp:
        if i != '':
            c.append(i)
    r = ''
    for i in c:
        if i == 'and' or i == 'or' or i == '->' or i == '<->':
            i = ' ' + i + ' '
        r = r + i

    s = ''
    for i in range(len(r)):

        s = s + r[i]

        if r[i] == '-' and r[i+1] != '>':
            s = s + ' '

        if (i < len(r) - 1) and (r[i + 1] == ')'):
            s = s + ' '

        if r[i] == '(' and r[i+1] != ' ':
            s = s + ' '
    return s


def matching(items):
    pc = 0
    for i in range(len(items)):
        if items[i] == '(':
            pc = pc + 1
        elif items[i] == ')':
            pc = pc - 1

        if pc == 0 and i < (len(items) - 1):
            return False
    return True


def flatten(items):
    if len(items) > 0:
        while items[0] == '(' and items[-1] == ')' and matching(items):
            items = items[1:-1]
    return items


def isConnective(s):
    return s == 'and' or s == 'or' or s == '->' or s == '<->' or s == '-'


def mainConnective(items):
    items = flatten(items)
    stack = []
    lhs = []
    pc = 0

    for i in range(len(items)):
        if items[i] == '(':
            pc = pc + 1
        elif items[i] == ')':
            pc = pc - 1

        if not isConnective(items[i]):
            lhs.append(items[i])
        else:
            if pc == 0:
                if items[i] == '-':
                    if items[i+1] == '(':
                        test = items[i+1:]
                        if matching(test):
                            stack.append(items[i])
                            rhs = items[i+1:]
                            if isPrimitive(lhs):
                                stack.append(lhs)
                            else:
                                stack.append(mainConnective(lhs))

                            if isPrimitive(rhs):
                                stack.append(rhs)
                            else:
                                stack.append(mainConnective(rhs))
                            break
                        else:
                            lhs.append(items[i])


                    elif i+1 == len(items)-1:
                        stack.append(items[i])
                        rhs = items[i+1:]
                        if isPrimitive(lhs):
                            stack.append(lhs)
                        else:
                            stack.append(mainConnective(lhs))

                        if isPrimitive(rhs):
                            stack.append(rhs)
                        else:
                            stack.append(mainConnective(rhs))
                        break
                    else:
                        lhs.append(items[i])

                else:

                    stack.append(items[i])
                    rhs = items[i+1:]

                    if isPrimitive(lhs):
                        stack.append(lhs)
                    else:
                        stack.append(mainConnective(lhs))

                    if isPrimitive(rhs):
                        stack.append(rhs)
                    else:
                        stack.append(mainConnective(rhs))

                    break
            else:
                lhs.append(items[i])
    if stack == []:
        stack = lhs
    return stack


def process(formula):
    formula = reformat(formula)
    items = formula.split(' ')
    return mainConnective(items)


def substitute(stack, bl):
    if stack[0] == '-':
        if isPrimitive(stack[2]):
            return [stack[0], stack[1], bl[stack[2][0]]]
        else:
            return [stack[0], stack[1], substitute(stack[2], bl)]
    else:
        if isPrimitive(stack[1]) and isPrimitive(stack[2]):
            return [stack[0], bl[stack[1][0]], bl[stack[2][0]]]
        elif not isPrimitive(stack[1]) and isPrimitive(stack[2]):
            return [stack[0], substitute(stack[1], bl), bl[stack[2][0]]]
        elif isPrimitive(stack[1]) and not isPrimitive(stack[2]):
            return [stack[0], bl[stack[1][0]], substitute(stack[2], bl)]
        else:
            return [stack[0], substitute(stack[1], bl), substitute(stack[2], bl)]


def evaluateNow(formula):

    if formula[0] == '-':
        return lnot(formula[2])
    elif formula[0] == 'and':
        return land(formula[1], formula[2])
    elif formula[0] == 'or':
        return lor(formula[1], formula[2])
    elif formula[0] == '->':
        return lif(formula[1], formula[2])
    elif formula[0] == '<->':
        return liff(formula[1], formula[2])

def evaluate(formula):
    if formula[0] == '-':
        if not isinstance(formula[2], list):
            return evaluateNow([formula[0], None, formula[2]])
        else:
            return evaluate([formula[0], formula[1], evaluate(formula[2])])
    else:
        if not isinstance(formula[1], list) and not isinstance(formula[2], list):
            return evaluateNow([formula[0], formula[1], formula[2]])
        elif isinstance(formula[1], list) and not isinstance(formula[2], list):
            return evaluateNow([formula[0], evaluate(formula[1]), formula[2]])
        elif not isinstance(formula[1], list) and isinstance(formula[2], list):
            return evaluateNow([formula[0], formula[1], evaluate(formula[2])])
        else:
            return evaluateNow([formula[0], evaluate(formula[1]), evaluate(formula[2])])

class TruthTable:
    def __init__(self, vars, props):
        self.vars = vars
        self.props = props
        self.table = []
        self.ttable()

    def ttable(self):
        stacks = []
        for i in self.props:
            stack = process(i)
            stacks.append(stack)

        rows = generate(self.vars)
        self.table = []
        for row in rows:
            bl = {}
            for i in range(len(self.vars)):
                bl[self.vars[i]] = row[i]
            results = []
            for stack in stacks:
                f = substitute(stack, bl)
                e = int(evaluate(f))
                results.append(e)
            self.table.append([row, results])

    def display(self):

        header = self.vars + self.props

        widths = []
        for i in header:
            if len(i) > 5:
                widths.append(len(i) + 2)
            else:
                widths.append(7)

        for i in range(len(header)):
            item = header[i]
            pad = widths[i] - len(item)
            item = item + (' ' * pad)
            print(item, end='   ')
        print()
        total = 1
        for i in widths:
            total = total + i
        print('-' * total)
        for row in self.table:
            varlist = []
            for i in row[0]:
                varlist.append(i)
            line = varlist + row[1]
            for i in range(len(line)):
                item = str(line[i])
                pad = widths[i] - len(item)
                item = item + (' ' * pad)
                print(item, end='')
            print()

    def latex(self):
        align = ((len(self.vars) + len(self.props) -1) * '|c') + '|c|';
        header = ""
        latexphrases = []
        for i in self.props:
            latexphrase = i.replace(' and ', ' \land ').replace(' or ', ' \lor ').replace(' -> ', ' \\to ').replace('-', ' \lnot ').replace(' <-> ', ' \\leftrightarrow ')
            latexphrases.append(latexphrase)
        for i in self.vars + latexphrases:
            header = header +"$" +i + "$ & "
        header = header[:-2]
        rows = ""
        for i in self.table:
            pv = i[0]
            res = i[1]
            temp = ""
            for j in pv+res:
                temp = temp + str(j) + ' & '
            temp = temp[:-2] + "\\\\\n"
            rows = rows + temp

        rows = rows[:-1]
        command = "\\begin{tabular}{%s}\n\\hline\n%s\\\\\n\\hline\n%s\n\\hline\n\\end{tabular}" % (align, header, rows)
        print(command)

