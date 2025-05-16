<%@ page import="java.util.*, model.Film" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #121212; color: white; }
        .form-control, .form-select {
            background-color: #2c2c2c;
            color: white;
            border: 1px solid #555;
        }
        .form-control:focus, .form-select:focus {
            background-color: #2c2c2c;
            color: white;
            border-color: #888;
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
<body class="d-flex justify-content-center align-items-center vh-100">

<%
    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");
%>

<div class="col-md-6">
    <h2 class="mb-4 text-center">Form Pemesanan Tiket</h2>
    <form action="struk.jsp" method="post" class="bg-dark p-4 rounded">
        <div class="mb-3">
            <label class="form-label">Nama Pemesan:</label>
            <input type="text" name="nama" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Jumlah Tiket:</label>
            <input type="number" name="jumlah" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Pilih Film:</label>
            <select name="filmIndex" id="filmSelect" class="form-select" required>
                <% for (int i = 0; i < daftarFilm.size(); i++) { %>
                    <option value="<%= i %>"><%= daftarFilm.get(i).getJudul() %></option>
                <% } %>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Pilih Jam Tayang:</label>
            <select name="jamTayang" id="jamTayangSelect" class="form-select" required>
                <% for (String jam : daftarFilm.get(0).getJamTayang()) { %>
                    <option value="<%= jam %>"><%= jam %></option>
                <% } %>
            </select>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-custom px-4">Submit</button>
            <a href="index.jsp" class="btn btn-custom btn-sm ms-2">Kembali ke Daftar Film</a>
        </div>
    </form>
</div>

<script>
    const jamTayangData = {
        <% for (int i = 0; i < daftarFilm.size(); i++) {
            Film f = daftarFilm.get(i);
            String[] jamArray = f.getJamTayang();
            out.print("\"" + i + "\": [");
            for (int j = 0; j < jamArray.length; j++) {
                out.print("\"" + jamArray[j] + "\"");
                if (j < jamArray.length - 1) out.print(", ");
            }
            out.print("]");
            if (i < daftarFilm.size() - 1) out.print(",\n");
        } %>
    };

    const filmSelect = document.getElementById("filmSelect");
    const jamTayangSelect = document.getElementById("jamTayangSelect");

    filmSelect.addEventListener("change", function () {
        const selectedIndex = filmSelect.value;
        const jamList = jamTayangData[selectedIndex];

        jamTayangSelect.innerHTML = "";
        jamList.forEach(jam => {
            const option = document.createElement("option");
            option.value = jam;
            option.textContent = jam;
            jamTayangSelect.appendChild(option);
        });
    });
</script>

</body>
</html>
