<?php
@session_start();
include "koneksi.php";

if(!@$_SESSION['siswa']) {
    if(@$_GET['hal'] == 'daftar') {
        include "register.php";
    } else {
        include "login.php";
    }
} else { ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>E-Learning</title>
    <link href="style/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="style/assets/css/font-awesome.css" rel="stylesheet" />
    <link href="style/assets/css/style.css" rel="stylesheet" />
</head>
<body>

<script src="style/assets/js/jquery-1.11.1.js"></script>
<script src="style/assets/js/bootstrap.js"></script>
<?php
$sql_terlogin = mysqli_query($db, "SELECT * FROM tb_siswa JOIN tb_kelas ON tb_siswa.id_siswa = '$_SESSION[siswa]' AND tb_kelas.id_kelas = tb_siswa.id_kelas") or die ($db->error);
$data_terlogin = mysqli_fetch_array($sql_terlogin);
?>
    <header>
        <h3><b class="col-md-2">TADIKA MESRA</b></h3>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    SELAMAT DATANG, <?php echo ucfirst($data_terlogin['username']); ?> <a href="inc/logout.php?sesi=siswa" class="btn btn-xs btn-danger">Logout</a>
                </div>
            </div>
        </div>
    </header>

    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a <?php if(@$_GET['page'] == '') { echo 'class="menu-top-active"'; } ?> href="./">Beranda</a></li>
                            <li><a <?php if(@$_GET['page'] == 'quiz') { echo 'class="menu-top-active"'; } ?> href="?page=quiz">Tugas / Quiz</a></li>
                            <li><a <?php if(@$_GET['page'] == 'nilai') { echo 'class="menu-top-active"'; } ?> href="?page=nilai">Nilai</a></li>
                            <li><a <?php if(@$_GET['page'] == 'materi') { echo 'class="menu-top-active"'; } ?> href="?page=materi">Materi</a></li>
                            <li><a <?php if(@$_GET['page'] == 'berita') { echo 'class="menu-top-active"'; } ?> href="?page=berita">Berita</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="content-wrapper">
        <div class="container" id="wadah">
        <?php
        if(@$_GET['page'] == '') {
            include "inc/beranda.php";
        } else if(@$_GET['page'] == 'quiz') {
            include "inc/quiz.php";
        } else if(@$_GET['page'] == 'nilai') {
            include "inc/nilai.php";
        } else if(@$_GET['page'] == 'materi') {
            include "inc/materi.php";
        } else if(@$_GET['page'] == 'berita') {
            include "inc/berita.php";
        } ?>
        </div>
    </div>
</body>
</html>
<?php
}
?>