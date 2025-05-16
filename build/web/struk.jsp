<%@ page import="java.util.*, model.Film" %>
<!DOCTYPE html>
<html>
<head>
    <title>Struk Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .struk-container {
            max-width: 600px;
            margin: auto;
        }
        .card {
            background-color: #1f1f1f;
            color: white;
            border: 1px solid #333;
        }
        .btn-custom {
            background-color: #6c757d;
            border: none;
        }
        .btn-custom:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body class="container py-5">

<%
    String nama = request.getParameter("nama");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    int filmIndex = Integer.parseInt(request.getParameter("filmIndex"));
    String jamTayang = request.getParameter("jamTayang");

    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");
    Film filmDipilih = daftarFilm.get(filmIndex);

    int totalHarga = jumlah * filmDipilih.getHargaTiket();
%>

<h2 class="text-center mb-4">Struk Pemesanan</h2>

<div class="struk-container">
    <div class="card p-4 shadow">
        <p><strong>Nama Pemesan:</strong> <%= nama %></p>
        <p><strong>Judul Film:</strong> <%= filmDipilih.getJudul() %></p>
        <p><strong>Genre:</strong> <%= filmDipilih.getGenre() %></p>
        <p><strong>Jam Tayang:</strong> <%= jamTayang %></p>
        <p><strong>Jumlah Tiket:</strong> <%= jumlah %></p>
        <p><strong>Harga per Tiket:</strong> Rp<%= filmDipilih.getHargaTiket() %></p>
        <hr>
        <h5><strong>Total Bayar:</strong> Rp<%= totalHarga %></h5>
    </div>

    <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-custom btn-sm">Kembali ke Daftar Film</a>
    </div>
</div>

</body>
</html>
