
Square[] squares = new Square[9];
int squareSize = 200;
PVector boardPos;
boolean isOsTurn = false;

void setup() {
  size(840, 840);
  makeBoard();
  drawAllSquares();
}

void makeBoard() {
  PVector start = new PVector(20, 20);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      int x = j * squareSize;
      int y = i * squareSize; 
      PVector pos = new PVector(x, y);
      squares[i * 3 + j] = new Square(pos, squareSize);
    }
  }
}

void drawAllSquares() {
  for (Square s : squares) {
    s.drawSelf();
  }
}

Square getTheClickedSquare(int x, int y) {
  for (Square s : squares) {
    if (s.clickedInside(x, y)) {
      return s;
    }
  }
  return null;
} 

void makeAMove(Square s) {
  if (s == null) {
    return;
  }
  if (isOsTurn) {
    s.setToO();
  } else {
    s.setToX();
  }
  isOsTurn = !isOsTurn;
}

void mousePressed() {
  makeAMove(getTheClickedSquare(mouseX, mouseY));
}

void draw() {
  drawAllSquares();
}


