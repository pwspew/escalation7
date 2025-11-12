// ollie da goat once again made a beautiful class
class worldbuild {
  int cols, rows;
  int[][] tiles;
  long seed;
  float fillProb = 0.45; // used by cellular
  int roomAttempts = 25;
  int minRoomSize = 3, maxRoomSize = 10;
  String mode; // "rooms" or "cellular"

  // tile types
  final int WALL = 0;
  final int FLOOR = 1;

  worldbuild(int cols, int rows, String mode, long seed) {
    this.cols = cols;
    this.rows = rows;
    this.mode = mode;
    if (seed == 0) this.seed = (long)random(1, Integer.MAX_VALUE);
    else this.seed = seed;
    tiles = new int[cols][rows];
  }

  void setMode(String mode) {
    this.mode = mode;
  }

  void generate() {
    randomSeed(seed);
    noiseSeed(seed);
    // init all walls
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) tiles[c][r] = WALL;
    }

    if (mode.equals("rooms")) {
      generateRooms();
      carveCorridors(); // optional simple connectivity
    } else if (mode.equals("cellular")) {
      generateCellular();
    } else {
      // default fallback
      generateRooms();
    }
  }

  // ---------- Rooms generator (random rectangles) ----------
  void generateRooms() {
    ArrayList<RectangleRoom> rooms = new ArrayList<RectangleRoom>();
    for (int i = 0; i < roomAttempts; i++) {
      int w = (int)random(minRoomSize, maxRoomSize+1);
      int h = (int)random(minRoomSize, maxRoomSize+1);
      int x = (int)random(1, cols - w - 1);
      int y = (int)random(1, rows - h - 1);
      RectangleRoom newR = new RectangleRoom(x, y, w, h);

      boolean overlaps = false;
      for (RectangleRoom r : rooms) {
        if (r.intersects(newR)) { overlaps = true; break; }
      }
      if (overlaps) {
        rooms.add(newR);
        carveRoom(newR);
      }
    }

    // simple corridors: connect centers in order
    for (int i = 1; i < rooms.size(); i++) {
      RectangleRoom a = rooms.get(i-1);
      RectangleRoom b = rooms.get(i);
      int ax = a.centerX();
      int ay = a.centerY();
      int bx = b.centerX();
      int by = b.centerY();
      carveHCorridor(min(ax, bx), max(ax, bx), ay);
      carveVCorridor(min(ay, by), max(ay, by), bx);
    }
  }

  void carveRoom(RectangleRoom r) {
    for (int x = r.x; x < r.x + r.w; x++) {
      for (int y = r.y; y < r.y + r.h; y++) {
        tiles[x][y] = FLOOR;
      }
    }
  }

  void carveHCorridor(int x1, int x2, int y) {
    for (int x = x1; x <= x2; x++) tiles[x][y] = FLOOR;
  }

  void carveVCorridor(int y1, int y2, int x) {
    for (int y = y1; y <= y2; y++) tiles[x][y] = FLOOR;
  }

  void carveCorridors() {
    // intentionally kept simple — corridors already carved in generateRooms()
  }


  void generateCellular() {
    // random fill
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        if (random(1) < fillProb) tiles[x][y] = WALL;
        else tiles[x][y] = FLOOR;
      }
    }
    // run smoothing steps
    int steps = 5;
    for (int s = 0; s < steps; s++) {
      int[][] next = new int[cols][rows];
      for (int x = 0; x < cols; x++) {
        for (int y = 0; y < rows; y++) {
          int walls = countWallNeighbors(x, y);
          if (walls >= 5) next[x][y] = WALL;
          else next[x][y] = FLOOR;
        }
      }
      tiles = next;
    }
    // optionally carve small isolated areas or connect components (not implemented)
  }

  int countWallNeighbors(int cx, int cy) {
    int count = 0;
    for (int dx = -1; dx <= 1; dx++) {
      for (int dy = -1; dy <= 1; dy++) {
        if (dx == 0 && dy == 0) continue;
        int nx = cx + dx;
        int ny = cy + dy;
        if (nx < 0 || ny < 0 || nx >= cols || ny >= rows) {
          count++; // treat outside as wall
        } else {
          if (tiles[nx][ny] == WALL) count++;
        }
      }
    }
    return count;
  }
void display(int tileSize) {
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (tiles[x][y] == WALL) {
        fill(30);
      } else {
        fill(200);
      }
      stroke(20);
      rect(x * tileSize, y * tileSize, tileSize, tileSize);
    }
  }
}
  // ---------- query / helpers ----------
  int getTile(int c, int r) {
    if (c < 0 || r < 0 || c >= cols || r >= rows) return WALL;
    return tiles[c][r];
  }

  boolean isWalkable(int c, int r) {
    return getTile(c, r) == FLOOR;
  }


  void placeItems(int n) {
    // simple random placement of 'n' items on floor tiles
    int placed = 0;
    for (int i = 0; i < n * 10 && placed < n; i++) {
      int x = (int)random(cols);
      int y = (int)random(rows);
      if (isWalkable(x, y)) {

        placed++;
      }
    }
  }
}

