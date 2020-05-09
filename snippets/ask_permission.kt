// Voorbeeld met de Camera permissie
if (ContextCompat.checkSelfPermission(thisActivity,
        Manifest.permission.CAMERA)
        != PackageManager.PERMISSION_GRANTED) {

    // Permissie werd nog niet gegeven
    // Toon een omschrijving vóór het vragen van de permissie
    if (ActivityCompat.shouldShowRequestPermissionRationale(
		thisActivity, Manifest.permission.CAMERA)) {
        //Toon een omschrijving
    } else {
        // Vraag Toestemming
        ActivityCompat.requestPermissions(thisActivity,
                arrayOf(Manifest.permission.CAMERA),
                MY_PERMISSIONS_CAMERA)
    }
} else {
    // App heeft reeds toestemming
}