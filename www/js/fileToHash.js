var holder = document.getElementById('holder');

holder.ondragover = function() {
  return false;
};

holder.ondragend = function() {
  return false;
};
var sha256_hash;

holder.ondrop = function(event) {
  event.preventDefault();

  var file = event.dataTransfer.files[0];
  var reader = new FileReader();

  reader.onload = function(event) {
    var binary = event.target.result;
    sha256_hash = CryptoJS.SHA256(binary);
    console.log(sha256_hash);
    document.getElementById('sha256 hash').innerHTML = sha256_hash;
  };

  reader.readAsBinaryString(file);
};



var holder2 = document.getElementById('holder2');

holder2.onclick = function(event) {
	if (sha256_hash == null) {
						 method_id = "generate SHA256 hash first!"	
						 console.log(method_id);
						document.getElementById('Method ID').innerHTML = method_id;}
	else {
    var sha3_hash = keccak256("registerObject(bytes32)");
    var sha3_first_8_bits = sha3_hash.substring(0,8);
	
    var method_id = "0x" + sha3_first_8_bits + sha256_hash; 
	 
    console.log(method_id);
document.getElementById('Method ID').innerHTML = method_id; }
  };
  