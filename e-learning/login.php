<?php
@session_start();
$db = mysqli_connect("localhost", "root", "", "db_elearning");
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>Login E-Learning</title>
    <link href="style/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="style/assets/css/font-awesome.css" rel="stylesheet" />
    <link href="style/assets/css/style.css" rel="stylesheet" />
</head>
<body>
    <header>
        <h3><b class="col-md-2">TADIKA MESRA</b></h3>
        <div class="container">
                <div class="col-md-12">
                    <a href="./?hal=daftar" class="btn btn-xs btn-warning">Daftar</a>
                    <a href="admin/index.php" class="btn btn-xs btn-primary">Admin</a>
                </div>
        </div>
    </header>

    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a <?php if(@$_GET['page'] == '') { echo 'class="menu-top-active"'; } ?> href="./">Login</a></li>
                            <li><a <?php if(@$_GET['page'] == 'berita') { echo 'class="menu-top-active"'; } ?> href="?page=berita">Berita</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="content-wrapper">
        <div class="container">
            <?php
            if(@$_GET['page'] == '') { ?>
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-head-line">Silahkan login untuk masuk ke e-learning</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <?php
                        if(@$_POST['login']) {
                            $user = @mysqli_real_escape_string($db, $_POST['user']);
                            $pass = @mysqli_real_escape_string($db, $_POST['pass']);
                            $sql = mysqli_query($db, "SELECT * FROM tb_siswa WHERE username = '$user' AND password = md5('$pass')") or die ($db->error);
                            $data = mysqli_fetch_array($sql);
                            if(mysqli_num_rows($sql) > 0) {
                                if($data['status'] == 'aktif') {
                                    @$_SESSION['siswa'] = $data['id_siswa'];
                                    echo "<script>window.location='./';</script>";
                                } else {
                                    echo '<div class="alert alert-warning">Login gagal, akun Anda sedang tidak aktif</div>';
                                }
                            } else {
                                echo '<div class="alert alert-danger">Login gagal, username / password salah, coba lagi!</div>';
                            }
                        } ?>
                        <h4><i>Masukkan username dan password Anda dengan benar :</i></h4>
                        <form method="post">
                            <label>Username :</label>
                            <input type="text" name="user" class="form-control" required />
                            <label>Password :  </label>
                            <input type="password" name="pass" class="form-control" required />
                            <hr />
                            <input type="submit" name="login" value="Login" class="btn btn-info" />
                            <input type="reset" class="btn btn-danger" />
                        </form>
                    </div>
                    <div class="col-md-6">
                        <div class="alert alert-danger col-md-12">
                            Untuk menggunakan layanan e-learning ini kalian harus login terlebih dahulu.
                        </div>
                    </div>
                </div>
            <?php
            } else if(@$_GET['page'] == 'berita') {
                include "inc/berita.php";
            } ?>
        </div>
    </div>
    <script src="style/assets/js/jquery-1.11.1.js"></script>
    <script src="style/assets/js/bootstrap.js"></script>
</body>
</html>