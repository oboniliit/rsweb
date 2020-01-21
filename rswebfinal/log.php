<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/log.css"> 

<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
</head>
<body>

	<div class="login-box">
    <img src="pic/6.jpg" class="avatar">
        <h1>Login Here</h1>

        <form method="post">
            <form>
            <p>Username</p>
          
            <i class="fa fa-user icon input-field" aria-hidden="true"></i>
            <input type="text" name="username" placeholder="Enter Username" required><br />
            <p>Password</p>
           
            <i class="fa fa-lock icon input-field" aria-hidden="true"></i>
            <input type="password" name="password" placeholder="Enter Password" required><br />
            <input type="submit" name="submit" value="Login">
            <a href="#">Forget Password</a><br><br><br>  
    

            <?php
if(isset($_POST['submit'])){
$username=$_POST['username'];
$password=$_POST['password'];
}


if(isset($_POST['submit'])){
    if($username == "admin" and $password == "pass"){
            echo "welcome admin";
            header("Location: nav.php");
          }
        else{
            echo "Please give the correct username and password";


        }
      }
   

?>


</form>
 </div>
 </form>
</body>
</html>