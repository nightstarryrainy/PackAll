
import electron.remote.MenuItem;
import electron.main.Menu;
import electron.main.App;
import electron.main.BrowserWindow;
import js.Node.__dirname;
import js.Node.process;

class Main {

	static function main() {

		Sys.println( process.platform +' '+ process.arch );
		Sys.println( 'node '+process.version );
		Sys.println( 'electron '+process.versions['electron'] );

		electron.main.App.whenReady().then(_ -> {

			var win = new BrowserWindow( {
				width: 720, height: 480,
				webPreferences: {
					nodeIntegration: true,
					contextIsolation: false
				}
			} );
			win.on( closed, () -> {
				win = null;
			});
			win.loadFile( 'app.html' );
			//win.webContents.openDevTools();
			var menu : electron.main.Menu = electron.main.Menu.getApplicationMenu();
			menu.append(new electron.main.MenuItem(
				{
					label: 'Haxe',
					submenu: [
						{ label: 'Website', click: e -> win.loadURL('https://haxe.org') },
						{ label: 'Github', click: e -> win.loadURL('https://github.com/HaxeFoundation') }
					]
				}
			));
			menu.append(new electron.main.MenuItem({
				label: "Extra",
				submenu: [
					{label:"Dev Console",click:e -> {
						if(win.webContents.isDevToolsOpened())
							win.webContents.closeDevTools();
						else 
							win.webContents.openDevTools();
					
					}}
				]
			}));

			var fileMenuItem:MenuItem = menu.getMenuItemById("File");
			fileMenuItem.submenu.append(new MenuItem({
				label: "Open",
				click: (m,b,e)->{
					
				},
			}));

			electron.main.Menu.setApplicationMenu(menu);
		});
		

		electron.main.App.on( window_all_closed, e -> {
			if( process.platform != 'darwin' ) electron.main.App.quit();
		});


	}

}
