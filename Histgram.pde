size(512, 200);
 
PImage img = loadImage("sample.jpg");
println(img);
int[] hist = new int[256];
 
for (int y = 0; y < img.height; y++)
{
  for (int x = 0; x < img.width; x++)
  {
    // 明るさを取り出し、配列に入れる
    int bright = int(brightness(img.get(x, y)));
    hist[bright]++;
  }
}
 
// ピクセルの最大値(数)を取り出す
int histMax = max(hist);
for (int i = 0; i < hist.length; i++)
{
  int x = int(map(i, 0, hist.length, 0, width)); // 0～256の範囲を0～画面横サイズに調整する
  int y = int(map(hist[i], 0, histMax, height, 0)); // 0～ピクセルの最大値の範囲を0～画面縦サイズに調整する
  line(x, height, x, y);
}