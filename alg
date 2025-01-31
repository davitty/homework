def factorial(n):
    if n == 0 or n == 1:
        return 1
    return n * factorial(n - 1)

def find_n_from_factorial(n_fact):
    for i in range(1, 10):
        if factorial(i) == n_fact:
            return i
    return None

n_fact = int(input())
print(find_n_from_factorial(n_fact))


def max_rectangle_sum(matrix, N, M):
    return sum(sum(row) for row in matrix)

def min_rectangle_sum(matrix, N, M):
    return min(sum(row) for row in matrix)

N, M = map(int, input().split())
matrix = [list(map(int, input().split())) for _ in range(N)]
print(max_rectangle_sum(matrix, N, M))
print(min_rectangle_sum(matrix, N, M))


def count_doors(matrix, n):
    return sum(sum(row) for row in matrix) // 2

def bfs(n, graph):
    visited = set()
    queue = [1]
    while queue:
        node = queue.pop(0)
        if node not in visited:
            visited.add(node)
            queue.extend(graph[node])
    return "YES" if len(visited) == n else "NO"

def dfs(n, graph):
    visited = set()
    stack = [1]
    while stack:
        node = stack.pop()
        if node not in visited:
            visited.add(node)
            stack.extend(graph[node])
    return "YES" if len(visited) == n else "NO"

n = int(input())
matrix = [list(map(int, input().split())) for _ in range(n)]
print(count_doors(matrix, n))

N, M = map(int, input().split())
graph = {i: [] for i in range(1, N + 1)}
for _ in range(M):
    u, v = map(int, input().split())
    graph[u].append(v)
    graph[v].append(u)
print(bfs(N, graph))
print(dfs(N, graph))


def gcd(a, b):
    if b == 0:
        return a
    return gcd(b, a % b)

a, b = map(int, input().split())
print(gcd(a, b))










# Algorithms for Assignment

# 1. Recursion Algorithms
# Factorial
def factorial(n):
    if n == 0 or n == 1:
        return 1
    return n * factorial(n - 1)

# Fibonacci (Recursive with Memoization)
def fibonacci_memo(n, memo={}):
    if n in memo:
        return memo[n]
    if n <= 1:
        return n
    memo[n] = fibonacci_memo(n - 1, memo) + fibonacci_memo(n - 2, memo)
    return memo[n]

# 2. Tower of Hanoi
def hanoi(n, source, auxiliary, target):
    if n == 1:
        print(f"Move disk 1 from {source} to {target}")
        return
    hanoi(n - 1, source, target, auxiliary)
    print(f"Move disk {n} from {source} to {target}")
    hanoi(n - 1, auxiliary, source, target)

# 3. Dynamic Programming
# Fibonacci (DP)
def fibonacci_dp(n):
    dp = [0, 1] + [0] * (n - 1)
    for i in range(2, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]

# Longest Common Subsequence (LCS)
def lcs(X, Y):
    m, n = len(X), len(Y)
    dp = [[0] * (n + 1) for _ in range(m + 1)]
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if X[i - 1] == Y[j - 1]:
                dp[i][j] = dp[i - 1][j - 1] + 1
            else:
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
    return dp[m][n]

# 4. Graph Traversal
from collections import defaultdict, deque

# Depth-First Search (DFS)
def dfs(graph, start, visited=None):
    if visited is None:
        visited = set()
    visited.add(start)
    print(start, end=' ')
    for neighbor in graph[start]:
        if neighbor not in visited:
            dfs(graph, neighbor, visited)

# Breadth-First Search (BFS)
def bfs(graph, start):
    visited = set([start])
    queue = deque([start])
    while queue:
        vertex = queue.popleft()
        print(vertex, end=' ')
        for neighbor in graph[vertex]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
