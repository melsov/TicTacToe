class Square {
  int state = -1;
  PVector pos;
  PVector size;
  color bgColor = color(255, 255, 255);
  color xColor = color(255, 55, 55);
  color oColor = color(55, 55, 255);

  Square(PVector the_pos, int widthHeight) {
    pos = the_pos;
    size = new PVector(widthHeight, widthHeight);
  }

  void drawSelf() {
    fill(bgColor);
    stroke(color(0,0,0));
    strokeWeight(8);
    rect(pos.x, pos.y, size.x, size.y);
    if (state == -1) {
      return;
    }
    if (state == 0) {
      ellipseMode(CORNER);
      stroke(oColor);
      ellipse(pos.x, pos.y, size.x, size.y);
    } else if (state == 1) {
      stroke(xColor);
      line(pos.x, pos.y, pos.x + size.x, pos.y + size.y);
      line(pos.x + size.x, pos.y, pos.x, pos.y + size.y);
    }
  }
  void setToO() {
    state = 0;
  }
  void setToX() {
    state = 1;
  }
  boolean clickedInside(int x, int y) {
   return x > pos.x && x < pos.x + size.x && y > pos.y && y < pos.y + size.y; 
  }
}

