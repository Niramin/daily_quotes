class SkyObject {
  String name = "random";
  bool isVisible = false;
  String image_url = "";
  double height = 200;
  double width = 50;
  //x coordinate and y coordinate
  double x = 0;
  double y = 0;
  // let max limits
  double screen_x = 50;
  double screen_y = 100;
  SkyObject() {}

  void setVisibiliy(bool value) {
    isVisible = value;
  }

  void setPosition({double? x, double? y}) {
    //set position on screen
    if (x != null) {
      this.x = x;
    }

    if (y != null) {
      this.y = y;
    }
  }

  void setScreenLimits(double x, double y) {
    screen_x = x;
    screen_y = y;
  }

  bool isOffBounds({double margin = 50}) {
    if (x > screen_x + margin) {
      return true;
    }
    if (y > screen_y + y) {
      return true;
    }
    return false;
  }

  void spawnLeft({double? distance}) {
    x = -100;
    if (distance != null) {
      x = -1 * distance;
    }
  }

  void spawnRight({double? distance}) {
    x = screen_y + 100;
    if (distance != null) {
      x = screen_y + distance;
    }
  }

  void traverseRight({double distance = 1}) {
    x += distance;
  }

  void traverseLeft({double distance = 1}) {
    x -= distance;
  }
}
