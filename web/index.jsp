<%@ page import="java.util.*, model.Film" %>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar Film</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .card {
            background-color: #1f1f1f;
        }
        .btn-custom {
            background-color: #6c757d;
            border: none;
            color: white;
        }
        .btn-custom:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body class="container py-5">

<%
    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("Demon Slayer : Mugen Train", "Action", 125, 50000, new String[]{"12:00", "15:00", "18:00"}));
    daftarFilm.add(new Film("Koe No Katachi", "Romance", 120, 40000, new String[]{"10:00", "12:00", "15:00"}));
    daftarFilm.add(new Film("Kiminonawa", "Romance", 100, 60000, new String[]{"12:00", "16:00", "20:00"}));
    daftarFilm.add(new Film("Jujutsu Kaisen : Movie 0", "Action", 135, 75000, new String[]{"10:00", "16:00", "22:00"}));
    daftarFilm.add(new Film("Tensei Shitara : Movie", "Action", 160, 45000, new String[]{"08:00", "13:00", "18:00"}));
    daftarFilm.add(new Film("Tamako Love Story", "Romance", 90, 55000, new String[]{"10:00", "14:00", "16:00"}));
    session.setAttribute("daftarFilm", daftarFilm);
%>

<h2 class="text-center mb-5">Daftar Film Anime</h2>
<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 justify-content-center">
    <%
        for (Film f : daftarFilm) {
            String judul = f.getJudul().toLowerCase();
            String gambar = "";
            if (judul.contains("demon")) gambar = "images/demonslayer.jpeg";
            else if (judul.contains("jujutsu")) gambar = "images/jujutsu.jpeg";
            else if (judul.contains("kimi")) gambar = "images/kiminonawa.jpeg";
            else if (judul.contains("koe")) gambar = "images/koe.jpeg";
            else if (judul.contains("tensei")) gambar = "images/tensei.jpeg";
            else if (judul.contains("tamako")) gambar = "images/tamako.jpeg";
    %>
    <div class="col">
        <div class="card h-100 text-white">
            <img src="<%= gambar %>" class="card-img-top" alt="Poster" style="height: 300px; object-fit: cover;">
            <div class="card-body">
                <h5 class="card-title"><%= f.getJudul() %></h5>
                <p class="card-text">
                    <strong>Genre:</strong> <%= f.getGenre() %><br>
                    <strong>Durasi:</strong> <%= f.getDurasi() %> menit<br>
                    <strong>Harga Tiket:</strong> Rp<%= f.getHargaTiket() %><br>
                    <strong>Jam Tayang:</strong> <%= String.join(", ", f.getJamTayang()) %>
                </p>
            </div>
        </div>
    </div>
    <% } %>
</div>

<div class="text-center mt-5">
    <a href="formPesan.jsp" class="btn btn-custom btn-lg px-5">Pesan Tiket</a>
</div>

</body>
</html>
