import js.html.DocumentType;
import js.html.Document;
import haxe.io.Encoding;
import electron.remote.BrowserWindow;

class UITools{

    /**
     * Pop an progress bar 
     * @param float progress only (0,1] show 
     */

    public function ShowProgressBar(progress:Float){
        var window:BrowserWindow = BrowserWindow.getFocusedWindow() ;
        if(window!=null){
            var contentPromise = window.loadURL("data:text/html;charset=utf-8," + StringTools.htmlEscape(progressBarHtmlString));
            if(contentPromise!=null){
                contentPromise.then(_->{
                },_->{});
            }
        }
    }


    var progressBarHtmlString = "
    <body>
    <div style=\"width: 400px;height: 25px;\" id=\"bar-container\">
    <div styple=\"width:30;height:100%;background-color:firebrick;transition:width:0.2s;\" id=\"bar\"></div>
    </div>
    </body>
    ";
}