Navigator.of(context).push(
  MaterialPageRoute(
   builder: (context) => OtherPage(destinationValue)
  )
).then((returnedValue) => foo(returnedValue))