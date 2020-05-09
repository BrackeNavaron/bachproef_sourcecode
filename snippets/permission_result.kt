override fun onRequestPermissionsResult(requestCode: Int,
        permissions: Array<String>, grantResults: IntArray) {
    when (requestCode) {
        MY_PERMISSIONS_CAMERA -> {
            if ((grantResults.isNotEmpty() &&
             grantResults[0] == PackageManager.PERMISSION_GRANTED)) {
                // We hebben toestemming, doe verder
            } else {
                // We hebben geen toestemming,
                // schakel de functionaliteit uit
            }
            return
        }
        else -> {
            // Negeer ander permissies
        }
    }
}