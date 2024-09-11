
# Quadtree

### Description

A quadtree is a tree data structure in which each internal node has exactly four children.

Quadtrees are most often used to partition a
two-dimensional space by recursively subdividing it into four quadrants or regions.

The regions may be square or rectangular, or may have arbitrary shapes.

This data structure is useful for spatial indexing and range queries.


```python

import math


class Point:
    def __init__(self, x, y, data=None):
        self.x = x
        self.y = y
        self.data = data  # Optional metadata (like name or ID)

    def __repr__(self):
        return f"Point(x={self.x}, y={self.y}, data={self.data})"


class Quadtree:
    def __init__(self, x, y, width, height, capacity):
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.capacity = capacity
        self.points = []
        self.divided = False

    def subdivide(self):
        w, h = self.width / 2, self.height / 2
        self.northeast = Quadtree(self.x + w, self.y - h, w, h, self.capacity)
        self.northwest = Quadtree(self.x - w, self.y - h, w, h, self.capacity)
        self.southeast = Quadtree(self.x + w, self.y + h, w, h, self.capacity)
        self.southwest = Quadtree(self.x - w, self.y + h, w, h, self.capacity)
        self.divided = True

    def insert(self, point):
        if not (
            self.x - self.width <= point.x < self.x + self.width
            and self.y - self.height <= point.y < self.y + self.height
        ):
            return False

        if len(self.points) < self.capacity:
            self.points.append(point)
            return True
        else:
            if not self.divided:
                self.subdivide()

            return (
                self.northeast.insert(point)
                or self.northwest.insert(point)
                or self.southeast.insert(point)
                or self.southwest.insert(point)
            )

    def range_query(self, center, distance):
        results = []
        self._range_query_helper(center, distance, results)
        return results

    def _range_query_helper(self, center, distance, results):
        # Define the range as a square centered around `center` with side `2 * distance`
        if not self.intersects(center, distance):
            return

        for point in self.points:
            if self.is_within_distance(point, center, distance):
                results.append(point)

        if self.divided:
            self.northeast._range_query_helper(center, distance, results)
            self.northwest._range_query_helper(center, distance, results)
            self.southeast._range_query_helper(center, distance, results)
            self.southwest._range_query_helper(center, distance, results)

    def intersects(self, center, distance):
        # Check if the quadtree node intersects with the query range
        x_min, x_max = center.x - distance, center.x + distance
        y_min, y_max = center.y - distance, center.y + distance
        return not (
            self.x + self.width < x_min
            or self.x - self.width > x_max
            or self.y + self.height < y_min
            or self.y - self.height > y_max
        )

    @staticmethod
    def is_within_distance(point, center, distance):
        return (
            math.sqrt((point.x - center.x) ** 2 + (point.y - center.y) ** 2) <= distance
        )

    def pretty_print(self, level=0):
        indent = "  " * level
        print(
            f"{indent}Quadtree: Center=({self.x}, {self.y}), Width={self.width}, Height={self.height}, Points={self.points}"
        )
        if self.divided:
            print(f"{indent} Northeast:")
            self.northeast.pretty_print(level + 1)
            print(f"{indent} Northwest:")
            self.northwest.pretty_print(level + 1)
            print(f"{indent} Southeast:")
            self.southeast.pretty_print(level + 1)
            print(f"{indent} Southwest:")
            self.southwest.pretty_print(level + 1)

    def __repr__(self):
        return f"Quadtree(x={self.x}, y={self.y}, width={self.width}, height={self.height}, points={self.points}, divided={self.divided})"


# Example Usage
quadtree = Quadtree(0, 0, 200, 200, 4)
points = [
    Point(10, 20, "A"),
    Point(13, 25, "Z"),
    Point(50, 80, "B"),
    Point(-90, -100, "C"),
    Point(120, 40, "D"),
    Point(110, -60, "E"),
]
for point in points:
    quadtree.insert(point)

# Query points within 20 units of (50, 50)
center_point = Point(10, 50)
found_points = quadtree.range_query(center_point, 30)
print("Points within 20 units of (50, 50):", found_points)


```
