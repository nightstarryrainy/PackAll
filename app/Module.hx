package app;

import haxe.io.Path;
import sys.io.File;

class Module{

    private var pathString:String;
    private var path:Path;
    private var isLoad:Bool;
    private var itemNames:Array<String>;
    private var items:Array<Module>;
    private var itemDict:Map<String,Module>;


    public function new(path:String){
        this.pathString = path;
        Init();
    }

     function Init() {
        load();
    }

    function load(){
        if(isLoad)
            return;
        path = new Path(this.pathString);
        isLoad = true;
    }



}