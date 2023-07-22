import 'dart:math';

class Factory {
  final double x;
  final double y;

  Factory(this.x, this.y);
}

class WarehouseLocation {
  double findOptimalLocation(List<Factory> factories) {
    if (factories.isEmpty) return 0.0;

    // Extract x and y coordinates from the factories
    List<double> xCoordinates = factories.map((f) => f.x).toList();
    List<double> yCoordinates = factories.map((f) => f.y).toList();

    // Sort the coordinates to find the medians
    xCoordinates.sort();
    yCoordinates.sort();

    // Find the median values for x and y coordinates
    int mid = factories.length ~/ 2;
    double medianX = factories.length % 2 == 0
        ? (xCoordinates[mid - 1] + xCoordinates[mid]) / 2
        : xCoordinates[mid];
    double medianY = factories.length % 2 == 0
        ? (yCoordinates[mid - 1] + yCoordinates[mid]) / 2
        : yCoordinates[mid];

    // Return the sum of the x and y medians as the optimal location
    return medianX + medianY;
  }
}

void main() {
  // Sample factories data
  List<Factory> factories = [
    Factory(2, 3),
    Factory(5, 7),
    Factory(10, 4),
  ];

  WarehouseLocation warehouseLocation = WarehouseLocation();
  double optimalLocation = warehouseLocation.findOptimalLocation(factories);

  print("Optimal location for the warehouse: $optimalLocation");
}
