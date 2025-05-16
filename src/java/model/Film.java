package model;
public class Film {
    private String judul;
    private String genre;
    private int durasi;
    private int hargaTiket;
    private String[] jamTayang;

    public Film(String judul, String genre, int durasi, int hargaTiket, String[] jamTayang) {
        this.judul = judul;
        this.genre = genre;
        this.durasi = durasi;
        this.hargaTiket = hargaTiket;
        this.jamTayang = jamTayang;
    }

    public String getJudul() { return judul; }
    public String getGenre() { return genre; }
    public int getDurasi() { return durasi; }
    public int getHargaTiket() { return hargaTiket; }
    public String[] getJamTayang() { return jamTayang; }
}
