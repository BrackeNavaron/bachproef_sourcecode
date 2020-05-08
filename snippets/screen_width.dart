class MyWidget extends StatelessWidget {

    @override
    Widget build(BuildContext context){
        final width = MediaQuery.of(context).size.width;
        final someBreakpoint = 768;

        if(width < 768){
            return someLayout();
        }
        ....
    }
}