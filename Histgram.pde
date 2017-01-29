PImage img;
int cash; //閾値を一時的に保存 
int[] hist = new int[256];
int ikichi = 0;
boolean judge = true;

void setup() {
  size(400, 200);
  selectInput("Select a file to process:", "fileSelected");
}

// ファイルを選択
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    img = loadImage(selection.getName());
  }
}

void draw() {

  // 背景色を白にする
  background(255, 255, 255);
  
  if (img != null) {
    for (int y = 0; y < img.height; y++)
    {
      for (int x = 0; x < img.width; x++)
      {
        // 明るさを取り出し、配列に入れる
        int bright = int(brightness(img.get(x, y)));
        hist[bright]++;
      }
    }
  }

  // 閾値処理
  if (img != null) {
    for (int i = 0; ikichi < (img.width * img.height) * 0.5; i++) {
      ikichi =  hist[i] + ikichi;
      cash = i;
    }
  }

  // ピクセルの最大値(数)を取り出す
  int histMax = max(hist);
  for (int i = 0; i < hist.length; i++) {
    // 0～256の範囲を0～画面横サイズに調整する
    int x = int(map(i, 0, hist.length, 0, width));
    // 0～ピクセルの最大値の範囲を0～画面縦サイズに調整する
    int y = int(map(hist[i], 0, histMax, height, 0));
    line(x, height, x, y);
  }

  if (img != null) {
    // 画像を保存
    if (judge == true)     
    save("result.jpg");
    judge = false;//一度だけ保存する
  }
  
}