function regvalid() {

    var x = document.getElementById("firstname").value;
    var fo = /^[a-zA-Z]+$/;
    if (x === "")
    {
        alert('Please provide your first name');
        return false;
    }
    if (!x.match(fo)) {
        alert('Please provide only characters in your first name');
        return false;
    }
    if (x.length > 20)
    {
        alert('enter the first name in 20 characters');
        return false;
    }

    var y = document.getElementById("lastname").value;
    if (y === "")
    {
        alert('Please provide your last name');
        return false;
    }
    if (!y.match(fo)) {
        alert('Please provide only characters in your last name');
        return false;
    }
    if (y.length > 20)
    {
        alert('enter the last name in 20 characters');
        return false;
    }
    var a = document.getElementById("password").value;
    var pd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    if (a === "")
    {
        alert('Please provide your password');
        return false;
    }
    if (a.length < 6)
    {
        alert('Please provide password containing atleast 6 characters');
        return false;
    }
//    if (!a.match(pd)) {
//        alert('Password Must contain at least 8 characters, at least 1 number and includes both lower and uppercase letters and special characters ');
//        return false;
//    }
    if (a.length > 10)
    {
        alert('Please provide password containing 6 - 10 characters');
        return false;
    }
    var b = document.getElementById("repassword").value;
    if (b == "")
    {
        alert('Please confirm your password');
        return false;
    }
    if (b != a) {
        alert('Password and confirm password doen not match.');
        return false;
    }

    var c = document.getElementById("emailid").value;
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (c == "")
    {
        alert('Please Enter your email');
        return false;
    }
    if (!c.match(filter))
    {
        alert('Please provide a valid Email');
        return false;
    }
    if (c.length > 40)
    {
        alert('enter the email in 40 characters');
        return false;
    }
//	var d= document.getElementById("contact").value;
//	var expr=/^([7-9])+$/;
//	if(d=="")
//	{
//		alert('please Enter your contact number');
//		return false;
//	}
//	if(isNaN(d))
//	{
//		alert('Please Enter numbers only in contact no.');
//		return false;
//	}
//	if(d.length != 10)
//	{
//		alert('mobile no. should be of 10 digits only');
//		return false;
//	}
//	if(!d.match(expr)){
//		alert('mobile no. should start with 7 or 8 or 9 digits only');
//		return false;
//	}
    alert('You have successfully registered. Please login to continue')
    return true;


}