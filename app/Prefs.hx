package app;
import js.node.Fs;
import js.html.FileSystemEntry;
import haxe.display.JsonModuleTypes.JsonEnumFields;
import sys.io.File;
import sys.FileSystem;
class Prefs{
    /**
     * Singleton
     */
    public var  Current:Prefs;
    var isOpenLastDefault:Bool;
    var isDefaultOpenLastOpen:Bool = true;

    var lastOpenHistory:Array<String>;


    public static function loadPrefs(){

    }

    public static function loadPrefsByPath(path:String) {
        Fs.readFile(path,{encoding: "utf-8"},(e,s)->{});
    }

}
