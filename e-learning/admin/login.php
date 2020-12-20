<?php
@session_start();

if(@$_SESSION['admin'] || @$_SESSION['pengajar']){	
	echo "<script>window.location='./';</script>";
} 
else{
?>

<!DOCTYPE html>
<html>
<head>
	<title>Login Admin</title>
	<link href="style/assets/css/bootstrap.css" rel="stylesheet" />
	<style type="text/css">


	html,body{
	    position: relative;
	    height: 100%;
	}

	.main-content{
	width: 50%;
	border-radius: 20px;
	box-shadow: 0 5px 5px rgba(0,0,0,.4);
	margin: 5em auto;
	display: flex;
	}

	.company__info{
		background-color: #008080;
		border-top-left-radius: 20px;
		border-bottom-left-radius: 20px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		color: #fff;
	}
	.fa-android{
		font-size:3em;
	}
	@media screen and (max-width: 640px) {
		.main-content{width: 90%;}
		.company__info{
			display: none;
		}
		.login_form{
			border-top-left-radius:20px;
			border-bottom-left-radius:20px;
		}
	}
	@media screen and (min-width: 642px) and (max-width:800px){
		.main-content{width: 70%;}
	}
	.row > h2{
		color:#008080;
	}
	.login_form{
		background-color: #fff;
		border-top-right-radius:20px;
		border-bottom-right-radius:20px;
		border-top:1px solid #ccc;
		border-right:1px solid #ccc;
	}
	form{
		padding: 0 2em;
	}
	.form__input{
		width: 100%;
		border:0px solid transparent;
		border-radius: 0;
		border-bottom: 1px solid #aaa;
		padding: 1em .5em .5em;
		padding-left: 2em;
		outline:none;
		margin:1.5em auto;
		transition: all .5s ease;
	}
	.form__input:focus{
		border-bottom-color: #008080;
		box-shadow: 0 0 5px rgba(0,80,80,.4); 
		border-radius: 4px;
	}
	.btn{
		transition: all .5s ease;
		width: 70%;
		border-radius: 30px;
		color:#008080;
		font-weight: 600;
		background-color: #fff;
		border: 1px solid #008080;
		margin-top: 1.5em;
		margin-bottom: 1em;
	}
	.btn:hover, .btn:focus{
		background-color: #008080;
		color:#fff;
	}


	</style>
</head>
<body>

<!-- Bag 1 -->
	<div class="container-fluid">
		<div class="row main-content bg-success text-center">
			<div class="col-md-4 text-center company__info">
        		<h2>TADIKA MESRA</h2>
			</div>
			<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
				<div class="container-fluid">
					<div class="row">
						<h2>Log In Admin/Pengajar</h2>
					</div>
					<div class="row">
						<form control="" class="form-group">
							<div id="output"></div>
							<div class="row">
								<input type="text" name="user" id="username" class="form__input" placeholder="Username">
							</div>
							<div class="row">
								<!-- <span class="fa fa-lock"></span> -->
								<input type="password" name="pass" id="password" class="form__input" placeholder="Password">
							</div>
							<div class="row">
								<button class="btn btn-info btn-block login center-block" type="submit">Login</button>
								<button class="btn btn-info btn-block continue center-block" style="display:none;">Continue</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="style/assets/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
var user = $("input[name=user]");
var pass = $("input[name=pass]");
function proses_login(){
	if(user.val() == ""){
        $("#output").removeClass('alert alert-success');
        $("#output").addClass("alert alert-danger animated fadeInUp").html("Username tidak boleh kosong");
        user.focus();
    } 
    else if(pass.val() == ""){
        $("#output").removeClass('alert alert-success');
        $("#output").addClass("alert alert-danger animated fadeInUp").html("Password tidak boleh kosong");
        pass.focus();
    } 
    else {
    	$.ajax({
    		url  : 'inc/proses_login.php',
    		type : 'post',
    		data : 'user='+user.val()+'&pass='+pass.val(),
    		success : function(msg){
        		if(msg == 'sukses'){
		            $("#output").addClass("alert alert-success animated fadeInUp").html("Selamat datang " + "<span><b><i>" + user.val() + "</i></u></span>");
		            $("#output").removeClass('alert-danger');
		            $("input").hide();
		            $('button[type="submit"]').hide();
		            $(".continue").fadeIn(1000);
		        } else if(msg == 'akun tidak aktif') {
		        	$("#output").removeClass('alert alert-warning');
		            $("#output").addClass("alert alert-danger animated fadeInUp").html("Login gagal, akun Anda tidak aktif");
		        } else if(msg == 'gagal') {
		        	$("#output").removeClass('alert alert-success');
		            $("#output").addClass("alert alert-danger animated fadeInUp").html("Login gagal, coba lagi");
		        }
    		}
    	});
    }
}

$('button[type="submit"]').click(function(e){
    e.preventDefault();
    proses_login();
});
$(pass).keyup(function(e){
	if(e.keyCode == 13) {
		proses_login();
	}
});

$(function(){
	$(".continue").click(function() {
        window.location='./';
    });
});
</script>

</body>
</html>
<?php
}
?>