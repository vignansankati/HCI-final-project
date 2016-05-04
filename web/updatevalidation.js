function updateProfile() {
    var a = document.getElementById('secAnswer1').value;
    if (a === '') {
        alert('Please provide Security answer#1');
        return true;
    }
    var b = document.getElementById('secAnswer2').value;
    if (b === '') {
        alert('Please provide Security answer#2');
    }
    alert('Profile updated successfully.');
}