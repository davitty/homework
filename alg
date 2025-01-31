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
