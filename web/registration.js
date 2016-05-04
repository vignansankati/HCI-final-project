/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validateForm() {
    'use strict';

    // Get references to the form elements:
    var firstname = document.getElementById('firstname');
   
    var email = document.getElementById('email');
    var password = document.getElementById('password');
    var repassword = document.getElementById('repassword');
    var mob1 = document.getElementById('mob1');
    var mob2 = document.getElementById('mob2');
    var mob3 = document.getElementById('mob3');
    var secAnswer1 = document.getElementById('secAnswer1');
    var secAnswer2 = document.getElementById('secAnswer2');
    

    // Validate the signup
    if ((firstname.value.length > 0) && (emailid.value.length > 0)&& (password.value.length > 0)&& (repassword.value.length > 0)&& (mob1.value.length > 0) && (mob2.value.length > 0)&& (mob3.value.length > 0) && (secAnswer1.value.length > 0)&& (secAnswer2.value.length > 0)) {
       
        alert('you have registered successfully');
        return true;
    }
//    else {
//         
//        alert('Please enter (*)required fields');
//        return false;
//    }
}
window.onload = function () {
    document.getElementById("reg_Btn").onclick = validateForm;
};


//Login vredentials 
//function check(form) {
//
//    var emailArray = ("myemail@live.com", "");
//    var passwordArray = ("MyLogIn", "");
//
//    if (email.value == "email" && password.value == "password") {
//        window.open('myaccount.html');
//    } else {
//        alert('Please enter correct username or password!');
//        return false;
//    }   
//}

    