/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function messageValidation() {
    // Get references to the form elements:
    var C_name = document.getElementById('C_name').value;
    var C_email = document.getElementById('C_email').value;
    var C_message = document.getElementById('C_message').value;
   
 
    // Validate the message
    if(C_name === ''){
        alert('Please provide your name');
        return false;
    }
    else if(C_email === ''){
        alert('Please provide your email');
        return false;
    }
    else if(C_message === ''){
        alert('Please provide your message');
        return false;
    }
    else {
        alert('Thankyou for your valuable feedback. Our support team will contact you soon.');
        return true;
    }
}




function paymentValidation() {
    'use strict';

    // Get references to the form elements:
    var first_name = document.getElementById('first_name');
    var email_id = document.getElementById('email_id');
    var mobile = document.getElementById('mobile');
    var address1 = document.getElementById('address1');
    var city = document.getElementById('city');
    var state = document.getElementById('state');
    var country = document.getElementById('country');
    var zip = document.getElementById('zip');
    var nameoncard = document.getElementById('nameoncard');
    var cardnum = document.getElementById('cardnum');
    var mm = document.getElementById('mm');
    var yy = document.getElementById('yy');
    var cvv = document.getElementById('cvv');

    // Validate the payment
    if ((first_name.value.length > 0) && (email_id.value.length > 0)&& (mobile.value.length > 0)&& (address1.value.length > 0)&& (city.value.length > 0)&& (state.value.length > 0) && (country.value.length > 0)&& (zip.value.length > 0) && (nameoncard.value.length > 0)&& (cardnum.value.length > 0) && (mm.value.length > 0)&& (yy.value.length > 0) && (cvv.value.length > 0)) 
    {
       if((cardnum.value.length == 16) && (cvv.value.length == 3)){
           window.location.href = 'loading.html'
            return true;
         
       }
        else{
             alert('Please enter your 16 digit card number and/or 3 digit CVV properly');
        }
    } else {
        alert('Please enter (*)required fields');
        return false;
    }
    }
window.onload = function () {
    document.getElementById("paybutton").onclick = paymentValidation;
};

