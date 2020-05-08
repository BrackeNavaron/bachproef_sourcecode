FutureBuilder(
    initialData: "Future not started",
    future: Future.value("Some async value"),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        if(snapshot.hasError){
          return MyErrorWidget(snapshot.error);
        }else{
          return MyDataWidget(snapshot.data);
        }
      }else{
        return MyLoadingWidget();
      }
    });