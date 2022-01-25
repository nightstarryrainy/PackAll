package app;
class Module{
    private var path:String;
    private var isLoad:Bool;

    function new(path:String){
        this.path = path;

    }

    function load(){
        if(isLoad)
            return;
        

        isLoad = true;

    }



}